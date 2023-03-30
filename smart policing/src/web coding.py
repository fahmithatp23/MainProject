from flask import *
from src.dbconnection import *
app=Flask(__name__)


app.secret_key="bjfhdkj"

@app.route('/')
def log():
    return  render_template("index.html")


@app.route('/logincode',methods=['Post'])
def logincode():
    un=request.form['textfield']
    ps=request.form['textfield2']
    qry="select * from login where username=%s and password=%s"
    val=(un,ps)
    res=selectone(qry,val)
    if res is None:
        return'''<script>alert("invalid username or password");window.location='/'</script>'''
    elif res['Type']=="admin":
        session['lid']=res['log_id']
        return redirect('/admin_homepage')
    elif res['Type']=="officer":
        session['lid']=res['log_id']
        return redirect('/officer homepage')
    elif res['Type']=="user":
        session['lid']=res['log_id']
        return redirect('/user home page')
    elif res['Type'] == "blocked":
        return '''<script>alert("Blocked By admin");window.location='/'</script>'''
    else:
        return'''<script>alert("invalid username or password");window.location='/'</script>'''





@app.route('/addmanage officers',methods=['get','post'])
def addmanage_officers():
    return  render_template("add&manage officers.html")

@app.route('/insert_officers',methods=['get','post'])
def insert_officers():
    name=request.form['textfield']
    age= request.form['textfield2']
    position= request.form['textfield3']
    gender= request.form['radiobutton']
    department= request.form['textfield4']
    station = request.form['textfield5']
    email = request.form['textfield6']
    phone = request.form['textfield7']
    username = request.form['textfield8']
    password= request.form['textfield9']
    qry="INSERT INTO `login` VALUES(NULL,%s,%s,'officer')"
    val=(username,password)
    id=iud(qry,val)
    qry1="INSERT INTO `officer` VALUES(NULL,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val1=(str(id),name,age,gender,position,department,station,email,phone)
    iud(qry1,val1)
    return '''<script>alert("successfully added");window.location='addmanage officers view'</script>'''


@app.route('/addmanage officers view',methods=['get','post'])
def addmanage_officers_view():
    qry="SELECT * FROM `officer`"
    res=selectall(qry)
    return  render_template("add&manage officers view.html",val=res)

@app.route('/edit_officer',methods=['get','post'])
def edit_officer():
    id=request.args.get('id')
    session['EO_id']=id
    q="SELECT * FROM `officer` WHERE `offrid`=%s"
    res=selectone(q,id)
    return  render_template("edit_officers.html",val=res)


@app.route('/edit_officer1',methods=['get','post'])
def edit_officer1():
    name=request.form['textfield']
    age= request.form['textfield2']
    position= request.form['textfield3']
    gender= request.form['radiobutton']
    department= request.form['textfield4']
    station = request.form['textfield5']
    email = request.form['textfield6']
    phone = request.form['textfield7']

    qry1="UPDATE `officer` SET `name`=%s,`age`=%s,`gender`=%s,`position`=%s,`department`=%s,`station`=%s,`email`=%s,`phone`=%s WHERE `offrid`=%s"
    val1=(name,age,gender,position,department,station,email,phone,session['EO_id'])
    iud(qry1,val1)
    return '''<script>alert("successfully added");window.location='addmanage officers view'</script>'''


@app.route('/delete_officer',methods=['get','post'])
def delete_officer():
    id=request.args.get('id')
    qry="DELETE FROM `officer` WHERE `user_id`=%s"
    iud(qry,id)
    qry1="DELETE FROM `login` WHERE `log_id`=%s"
    iud(qry1,id)
    return '''<script>alert("successfully deleted");window.location='addmanage officers view'</script>'''

@app.route('/view assigned works',methods=['get','post'])
def view_assigned_works():
    return  render_template("view assigned works.html")

@app.route('/view complaint and reply',methods=['get','post'])
def view_complaint_and_reply():
    qry = "SELECT * FROM `complaint`"
    res = selectall(qry)
    return  render_template("view complaint and reply.html",val=res)

@app.route('/view daily reports',methods=['get','post'])
def view_daily_reports():
    return  render_template("view daily reports.html")

@app.route('/view feedback',methods=['get','post'])
def view_feedback():
    qry = "SELECT `officer`.`name` AS `oname` ,`user`.`name`,`feedback`. `Feedback`,`date` FROM `user` JOIN `feedback` ON `feedback`.`userid`=`user`.`log_id` JOIN`officer` ON `feedback`.`offrid`=`officer`.`user_id`"
    res = selectall(qry)
    return  render_template("view feedback.html",val=res)

@app.route('/view users',methods=['get','post'])
def view_users():
    qry="SELECT * FROM `user`"
    res=selectall(qry)
    return  render_template("view users.html",val=res)

@app.route('/delete_user',methods=['get','post'])
def delete_user():
    id = request.args.get('id')
    qry = "DELETE FROM `user` WHERE `user_id`=%s"
    iud(qry, id)
    return '''<script>alert("successfully deleted");window.location='view users'</script>'''

@app.route('/view reported officers',methods=['get','post'])
def view_reported_officers():
    qry = "SELECT `officer`.*,`login`.* FROM `officer` JOIN `login` ON `officer` .`user_id`=`login`.`log_id`"
    res = selectall(qry)
    return  render_template("view reported officers.html",val=res)

@app.route('/view breports',methods=['get','post'])
def view_breports():
    id = request.args.get('id')

    qry="SELECT * FROM `report` JOIN `user` ON `user`.`log_id`=`report`.`user_id` WHERE `offrid`=%s"
    res=selectall2(qry,id)
    return  render_template("view block reports.html",val=res)


@app.route('/admin_homepage',methods=['get','post'])
def admin_homepage():
    return  render_template("admin homepage.html")



@app.route('/oview case and update status1',methods=['get','post'])
def oview_case_and_update_status1():
    return  render_template("oview case and update status1.html")

@app.route('/oview case and update status2',methods=['get','post'])
def oview_case_and_update_status2():
    return  render_template("oview case and update status2.html")


@app.route('/managedailyreport1',methods=['get','post'])
def managedailyreport1():
    return  render_template("0manage daily report1.html")

@app.route('/managedailyreport2',methods=['get','post'])
def managedailyreport2():
    return  render_template("0manage daily report2.html")

@app.route('/oview complaint and send reply1',methods=['get','post'])
def oview_complaint_and_send_reply1():
    return  render_template("oview complaint and send reply1.html")

@app.route('/oview complaint and send reply2',methods=['get','post'])
def oview_complaint_and_send_reply2():
    return  render_template("oview complaint and send reply2.html")

@app.route('/ochat with users',methods=['get','post'])
def ochat_with_users():
    return  render_template("ochat with users.html")

@app.route('/oview feedback',methods=['get','post'])
def oview_feedback():
    qry = "SELECT `feedback`.*,`user`.* FROM `feedback` JOIN `user` ON `feedback`.`userid`=`user`.`log_id` WHERE `feedback`.`offrid`=%s "
    res = selectall2(qry,session['lid'])
    return  render_template("oview feedback.html",val=res)

@app.route('/officer homepage',methods=['get','post'])
def officer_homepage():
    return  render_template("officer homepage.html")

@app.route('/uregistration',methods=['get','post'])
def uregistration():
    return  render_template("uregistration.html")

@app.route('/register_user',methods=['get','post'])
def register_user():
    name = request.form['textfield']
    place = request.form['textfield2']
    post= request.form['textfield22']
    pin= request.form['textfield26']
    gender = request.form['radiobutton']
    age = request.form['textfield3']
    phone = request.form['textfield4']
    email = request.form['textfield5']
    username = request.form['textfield6']
    password = request.form['textfield7']
    qry="INSERT INTO `login` VALUES(NULL,%s,%s,'user')"
    val=(username,password)
    id=iud(qry,val)
    qry1="INSERT INTO `user` VALUES(NULL,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val1=(str(id),name,place,post,pin,gender,age,email,phone)
    iud(qry1,val1)
    return '''<script>alert("Registered");window.location='/'</script>'''



@app.route('/uadd and manage case1',methods=['get','post'])
def uadd_and_manage_case1():
    return  render_template("uadd and manage case1.html")
@app.route('/insert_case',methods=['get','post'])
def insert_case():
    case=request.form['textfield2']
    description = request.form['textarea']
    qry="INSERT INTO `case` VALUES(NULL,%s,%s,now(),%s)"
    val=(session['lid'],case,description)
    iud(qry,val)
    return '''<script>alert("successfully added");window.location='uadd and manage case2'</script>'''


@app.route('/uadd and manage case2',methods=['get','post'])
def uadd_and_manage_case2():
    qry="SELECT * FROM `case` WHERE `case`.`user_id`=%s"
    res=selectall2(qry,session['lid'])
    return  render_template("uadd and manage case2.html",val=res)

@app.route('/edit_case',methods=['get','post'])
def edit_case():
    id = request.args.get('id')
    session['Ec_id'] = id
    print("123165",id)
    q = "SELECT * FROM `case` WHERE `case_id` =%s"
    res = selectone(q, id)
    print(res)
    return  render_template("edit_case.html",val=res)

@app.route('/edit_case1',methods=['get','post'])
def edit_case1():
    case=request.form['textfield2']
    description = request.form['textarea']
    qry="UPDATE `case` SET `case`=%s,`description`=%s,`date_and_time`=NOW() WHERE `case_id`=%s"
    val=(case,description,session['Ec_id'])
    iud(qry,val)
    return '''<script>alert("successfully added");window.location='uadd and manage case2'</script>'''

@app.route('/delete_case',methods=['get','post'])
def delete_case():
    id = request.args.get('id')
    qry = "DELETE FROM `case` WHERE `case_id`=%s"
    iud(qry, id)
    return '''<script>alert("successfully deleted");window.location='uadd and manage case2'</script>'''


@app.route('/ureport officer',methods=['get','post'])
def ureport_officer():
    return  render_template("ureport officer.html")

@app.route('/ureport officer1',methods=['get','post'])
def ureport_officer1():
    return  render_template("ureport officer1.html")

@app.route('/usend complaint and view reply',methods=['get','post'])
def usend_complaint_and_view_reply():
    qry = "SELECT `case`.`case`,`officer`.`user_id` FROM `officer` JOIN `work` ON `work`.`offrid`=`officer`.`user_id` JOIN `case` ON `case`.`case_id`=`work`.`offrid` WHERE `case`.`user_id`=%s"
    res = selectall2(qry, session['lid'])
    return  render_template("usend complaint and view reply.html",data=res)

@app.route('/usend complaint and view reply post',methods=['get','post'])
def usend_complaint_and_view_reply_post():
    of_id=request.form['select']
    Complaint=request.form['textarea']
    qry="INSERT INTO `complaint` VALUES(NULL,%s,%s,NOW(),%s,'pending')"
    val=(session['lid'],of_id,Complaint)
    iud(qry,val)
    return '''<script>alert("Send successfully");window.location='/usend complaint and view reply1'</script>'''



@app.route('/usend complaint and view reply1',methods=['get','post'])
def usend_complaint_and_view_reply1():
    qry = "SELECT * FROM `complaint`WHERE `user_id`=%s"
    res = selectall2(qry,session['lid'])
    return  render_template("usend complaint and view reply1.html",val=res)

@app.route('/usend feedback',methods=['get','post'])
def usend_feedback():
    qry="SELECT `work`.*,`officer`.*,`case`.* FROM `work` JOIN `officer` ON `work`.`offrid`=`officer`.`user_id` JOIN `case` ON `case`.`case_id`=`work`.`case_id` WHERE `case`.`user_id`=%s"
    res=selectall2(qry,session['lid'])
    print(res)
    return  render_template("usend feedback.html",data=res)

@app.route('/insert_feedback',methods=['get','post'])
def insert_feedback():
    print(request.form)
    Feedback=request.form['textarea']
    officer=request.form['select']
    qry="INSERT INTO `feedback` VALUES(NULL,%s,%s,%s,curdate())"
    val=(officer,session['lid'],Feedback)
    iud(qry,val)
    return '''<script>alert("successfully added");window.location='user home page'</script>'''


@app.route('/uchat with officer',methods=['get','post'])
def uchat_with_officer():
    return  render_template("uchat with officer.html")

@app.route('/uview case status',methods=['get','post'])
def uview_case_status():
    return  render_template("uview case status.html")

@app.route('/user home page',methods=['get','post'])
def user_home_page():
    return  render_template("user home page.html")

@app.route('/block',methods=['get','post'])
def block():
    id=request.args.get('id')
    q="update login set Type='blocked' where log_id=%s"
    v=(id)
    iud(q,v)
    return '''<script>alert("Blocked!!!");window.location="/view reported officers"</script>'''

@app.route('/unblock',methods=['get','post'])
def unblock():
    id=request.args.get('id')
    q="update login set Type='officer' where log_id=%s"
    v=(id)
    iud(q,v)
    return '''<script>alert("Unblocked!!!");window.location="/view reported officers"</script>'''

















app.run(debug=True)


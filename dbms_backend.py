from flask import Flask, request, jsonify
import mysql.connector
import json
from flask_cors import CORS
app = Flask(__name__)
CORS(app)
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Athreya2608#",
    database="dbms",
    autocommit=True
)
bio=['DA','AB']
phy=['SC','HD']
chem=['CH','VD']
cursor = connection.cursor()

@app.route('/one', methods=['GET','POST'])
def one():
    so=request.get_json()['name']
    query = 'SELECT cases_master.* FROM cases_master WHERE cases_master.case_no IN ((SELECT master_case_no FROM allotments WHERE SO_Name = %s));'

    cursor.execute(query, (so,))
    ans = cursor.fetchall()
   
    return jsonify({'response':ans})
@app.route('/two', methods=['GET','POST'])
def two():
    dept=request.get_json()['dept']
    dic={'biology':0,'chemistry':1,'physics':2}
    q='select master_case_no, department_case_no, SO_name,type,status from allotments where dept=%s'
    cursor.execute(q,(dic[dept.lower()],))
    ans=cursor.fetchall()
    return jsonify({'response':ans})
@app.route('/nine', methods=['GET','POST'])
def nine():
    query = 'SELECT cases_master.* FROM cases_master WHERE cases_master.case_no IN ((SELECT Master_case_no from allotments where Status=%s));'
    cursor.execute(query,('Completed',))
    ans=cursor.fetchall()
    return jsonify({'response':ans})
@app.route('/ten', methods=['GET','POST'])
def ten():
    query = 'SELECT cases_master.* FROM cases_master WHERE cases_master.case_no IN ((SELECT Master_case_no from allotments where Status=%s));'
    cursor.execute(query,('Pending',))
    ans=cursor.fetchall()
    return jsonify({'response':ans})
@app.route('/three', methods=['GET','POST'])
def three():
    cno=request.get_json()['no']
    query='SELECT * from cases_master WHERE attributes like %s';
    cursor.execute(query,(cno,));
    ans=cursor.fetchall();
    return jsonify({'response':ans})
@app.route('/eight', methods=['GET','POST'])
def eight():
    cno=request.get_json()['case']
    query='SELECT * from cases_master WHERE Case_no = %s';
    cursor.execute(query,(cno,));
    ans=cursor.fetchall();
    return jsonify({'response':ans})
@app.route('/four', methods=['GET','POST'])
def four():
    ps=request.get_json()['police']
    crno=request.get_json()['crime']
    cd=request.get_json()['crimedt']
    rd=request.get_json()['recdt']
    ipc=request.get_json()['ipcsec']
    spec=request.get_json()['specs']
    ipc='IPC'+ipc
    dept=request.get_json()['dept']
    q='select * from cases_master where police_station_id=%s and crime_registration_no=%s;'
    cursor.execute(q,(ps,crno))
    if cursor.fetchone()!=None:
        return jsonify({'response':'Case already exists'})
    q='select max(Case_no) from cases_master'
    cursor.execute(q)
    serial=int(cursor.fetchone()[0])+1
    print(serial)
    query = 'insert into cases_master values(%s,%s,%s,%s,%s,%s,%s,%s)'
    cursor.execute(query,(serial,ps,crno,cd,rd,dept,ipc,spec))
    if dept=='Biology':
        q='select max(Department_Case_No) from allotments where dept=0'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(serial,0,serial1,bio[0],'Original','Pending'))
            last=bio.pop(0)
            bio.append(last)
        except:
            return jsonify({'response':'Invalid allotment'})
    elif dept=='Chemistry':
        q='select max(Department_Case_No) from allotments where dept=1'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(serial,1,serial1,chem[0],'Original','Pending'))
            last=chem.pop(0)
            chem.append(last)
        except:
            return jsonify({'response':'Invalid allotment'})
    else:
        q='select max(Department_Case_No) from allotments where dept=2'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(serial,2,serial1,phy[0],'Original','Pending'))
            last=phy.pop(0)
            phy.append(last)
        except:
            return jsonify({'response':'Invalid allotment'})
    return jsonify({'response':'Inserted Successfully'})
@app.route('/five', methods=['GET','POST'])
def five():
    cno=request.get_json()['c']
    oldd=request.get_json()['o']
    newd=request.get_json()['n']
    dic={'biology':0,'chemistry':1,'physics':2}
    if oldd=='Biology':
        q='select status from allotments where master_case_no=%s and dept=%s;'
        cursor.execute(q,(cno,oldd))
        st=cursor.fetchone()
        if st==None:
            return jsonify({'response':'Invalid case details'})
        query = 'update allotments set Status=%s where Master_case_no=%s and dept=%s'
        cursor.execute(query,(newd,cno,dic[oldd.lower()]))
        q2='update cases_master set department=%s where case_no=%s'
        cursor.execute(q2,(newd,cno))
    
    if newd=='Biology':
        q='select max(Department_Case_No) from allotments where dept=0'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(cno,0,serial1,bio[0],'Original','Pending'))
            last=bio.pop(0)
            bio.append(last)
        except:
            return jsonify({'response':'Case has already been forwarded'})
    elif newd=='Chemistry':
        q='select max(Department_Case_No) from allotments where dept=1'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(cno,1,serial1,chem[0],'Original','Pending'))
            last=chem.pop(0)
            chem.append(last)
        except:
            return jsonify({'response':'Case has already been forwarded'})
    else:
        q='select max(Department_Case_No) from allotments where dept=2'
        cursor.execute(q)
        serial1=int(cursor.fetchone()[0])+1
        query = 'insert into allotments values(%s,%s,%s,%s,%s,%s)'
        try:
            cursor.execute(query,(cno,2,serial1,phy[0],'Original','Pending'))
            last=phy.pop(0)
            phy.append(last)
        except:
            return jsonify({'response':'Case has already been forwarded'})
    return jsonify({'response':'Forwarded successfully'})
@app.route('/six', methods=['GET','POST'])
def six():
    sec=request.get_json()['ipc']
    sec='IPC'+sec
    query = 'SELECT * FROM cases_master WHERE IPC_Section = %s'
    cursor.execute(query,(sec,))
    ans=cursor.fetchall()
    return jsonify({'response':ans})
@app.route('/seven', methods=['GET','POST'])
def seven():
    ps=request.get_json()['psname']
    query = 'SELECT * FROM cases_master WHERE Police_station_id = %s'
    cursor.execute(query,(ps,))
    ans=cursor.fetchall()
    return jsonify({'response':ans})
if __name__ == '__main__':
    app.run(debug=True)

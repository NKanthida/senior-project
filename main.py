from flask import Flask, request, jsonify
from flask_socketio import SocketIO, emit , disconnect
import json
import sqlite3
import logging
import sys
from flask_cors import CORS
import base64
from datetime import datetime
import random
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})
socketio = SocketIO(app, cors_allowed_origins="*")  # สร้าง SocketIO instance
logging.basicConfig(level=logging.DEBUG)

#c.execute('CREATE TABLE registerusers(register_id integer PRIMARY KEY AUTOINCREMENT, email varchar(100), password varchar(100), username varchar(100), firstname varchar(100), lastname varchar(100), phonenumber integer(100), skill varchar(100), profile_image BLOB, user_type varchar(10))')
#c.execute("INSERT INTO registerusers (email, password, username, firstname, lastname, phonenumber, skill, user_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
#          (email, password, username, firstname, lastname, phonenumber, skill, user_type))
#c.execute('CREATE TABLE postusers(postuser_id integer PRIMARY KEY AUTOINCREMENT, post_description varchar(300), post_title varchar(200), user_id integer, FOREIGN KEY (user_id) REFERENCES registerusers(register_id))')
#c.execute("INSERT INTO postusers (post_description, post_title, user_id) VALUES (?, ?, ?)",
#          (post_description, post_title, user_id))
#c.execute('CREATE TABLE user_log(log_id integer PRIMARY KEY AUTOINCREMENT, user_id integer, login_time DATETIME DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (user_id) REFERENCES registerusers(register_id))')
#c.execute("INSERT INTO user_log (user_id) VALUES (?)", (user_id,))

#อันด้านล่างนี้เป็นฟอร์มเก่าในการเก็บข้อมูลดังนั้นยังเก็บไว้ใช้อยู่เผื่อฉุกเฉินนะ
#c.execute('CREATE TABLE registeremployer(register_id integer PRIMARY KEY AUTOINCREMENT,email varchar(100),password varchar(100),username varchar(100),firstname varchar(100),lastname varchar(100),phonenumber integer(100),profile_image BLOB)')
#c.execute('CREATE TABLE registeremployee(register_id integer PRIMARY KEY AUTOINCREMENT,email varchar(100),password varchar(100),username varchar(100),firstname varchar(100),lastname varchar(100),phonenumber integer(100),skill varchar(100),profile_image BLOB)')
#c.execute('CREATE TABLE postemployer(postemployer_id integer PRIMARY KEY AUTOINCREMENT,post_description varchar(300),post_title varchar(200))')
#c.execute('CREATE TABLE postemployee(postemployee_id integer PRIMARY KEY AUTOINCREMENT,post_description varchar(300),post_title varchar(200))')
#c.execute('CREATE TABLE OTP(otp_id integer PRIMARY KEY AUTOINCREMENT,otp_number integer(100))')
# ตั้งค่าระดับ logging เป็น DEBUG


# ต่อไปจะเป็นการเขียนรายละเอียดของ API ตามที่คุณต้องการ
def generate_otp():
    # Generate a random 6-digit OTP
    return random.randint(100000, 999999)

def check_duplicate_data(cursor):
    check_duplicate_sql = """
    SELECT email, COUNT(email) as count
    FROM registeremployer
    GROUP BY email
    HAVING COUNT(email) > 1
    """
    cursor.execute(check_duplicate_sql)
    results = cursor.fetchall()
    return results

def is_duplicate_email(email, cursor):
    email_check_sql = "SELECT COUNT(*) FROM registeremployer WHERE email = ?"
    cursor.execute(email_check_sql, (email,))
    count = cursor.fetchone()[0]
    return count > 0

def valid_login(email, password):
    conn = sqlite3.connect('matchwork2.sqlite')
    c = conn.cursor()

    c.execute('SELECT * FROM registeremployer WHERE email=? AND password=?', (email, password))
    user = c.fetchone()

    if user:
        # บันทึกเวลาเข้าใช้งาน
        current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        c.execute('UPDATE registeremployer SET last_login=? WHERE email=?', (current_time, email))
        conn.commit()

        return True
    else:
        return False
def validate_token(token):
    # ตรวจสอบในฐานข้อมูลหรือตรวจสอบลายเซ็นของ Token
    # ตามที่คุณต้องการ
    return True  # หรือ False ตามความเหมาะสม

@app.route('/') #กำหนด URL
def hello_world():
    q = request.args.get('q') # get API
    print(q)
    return {"message": 'Hello, World!'}, 201  # dic, status code == Created

def verify_otp():
    data = request.form
    otp_received = data.get('otp')

    # Check if the received OTP matches the stored OTP in the database
    conn = sqlite3.connect('matchwork2.sqlite')
    c = conn.cursor()

    c.execute('SELECT * FROM OTP WHERE otp_number = ?', (otp_received,))
    result = c.fetchone()

    if result:
        # Successful OTP verification
        return jsonify({"message": "OTP verification successful"}), 200
    else:
        # Failed OTP verification
        return jsonify({"message": "OTP verification failed"}), 400
@app.route('/regemployer', methods=['POST', 'GET', 'PUT', 'DELETE'])
def regregemployer():
    conn = sqlite3.connect('matchwork2.sqlite')
    c = conn.cursor()
    # ตรวจสอบ Token หรือ API Key
    if 'Authorization' not in request.headers:
        return jsonify({"message": "Unauthorized"}), 401

    # ตรวจสอบความถูกต้องของ Token หรือ API Key ที่ส่งมา
    token = request.headers['Authorization'].replace('Bearer ', '')
    if not validate_token(token):
        return jsonify({"message": "Invalid Token"}), 401

    # ดำเนินการต่อไปตามที่คุณต้องการ
    # ...
 
    data = request.get_json()  # รับ JSON จากแอปพลิเคชัน Flutter
    email = data.get('email')
    password = data.get('password')
    username = data.get('Username')
    firstname = data.get('Firstname')
    lastname = data.get('Lastname')
    phonenumber = data.get('Phonenumber')
    otp = generate_otp()
    
        
    print(email)
   # return jsonify({"message": "Registration Successful!"}), 201
    if request.method == 'POST':
        body = request.get_json()
        if not body:
            return jsonify({"message": "ไม่พบข้อมูล JSON ในคำขอ"}), 400
        email = body.get('email')
        password = body.get('password')
        register_id = body.get('register_id')
        username = body.get('Username')
        firstname = body.get('Firstname')
        lastname = body.get('Lastname')
        phonenumber = body.get('Phonenumber')
        otp = body.get('OTP')
        print(firstname)
        print(phonenumber)
        print(otp)
        #if not email or not password or not username or not firstname or not lastname:
         #   return jsonify({"message": "กรุณากรอกข้อมูลที่จำเป็น"}), 400
            
        if is_duplicate_email(email, c):
            return jsonify({"message": "อีเมลนี้มีอยู่ในระบบแล้ว", "body": body}), 400

        c.execute('SELECT COUNT(*) FROM registeremployer WHERE register_id = ?', (register_id,))
        count = c.fetchone()[0]
        if count > 0:
            return jsonify({"message": "ไอดีนี้ถูกใช้งานแล้ว", "body": body}), 400

        c.execute('SELECT COUNT(*) FROM registeremployer WHERE email = ?', (email,))
        email_count = c.fetchone()[0]
        if email_count > 0:
            return jsonify({"message": "อีเมลนี้ถูกใช้งานแล้ว", "body": body}), 400
        else:
            c.execute("INSERT INTO registeremployer (email, password, username, firstname, lastname, phonenumber, otp) VALUES (?, ?, ?, ?, ?, ?, ?)",
                (email, password, username, firstname, lastname, phonenumber, otp))

            conn.commit()
            return jsonify({"message": "ลงทะเบียนเรียบร้อยแล้ว!", "body": body, "otp": otp}), 201

    elif request.method == 'GET':
        rows = []
        for row in c.execute('SELECT * FROM registeremployer'):
            rows.append({
                "register_id": row[0], "email": row[1], "password": row[2],"username": row[3],"firstname": row[4],"lastname":row[5],"phonenumber":row[6]
            })
        for row in c.execute('SELECT * FROM OTP'):
            rows.append({
                "otp_id": row[0], "otp_number": row[1]
            })
        results = check_duplicate_data(c)
        if results:
            return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง", "registeremployer": rows}), 400
        else:
            return {'registeremployer': rows}, 200
#check password ถ้าเปลี่ยนในอีเมลล์เดิมหรือไอดีเดิม!!
    elif request.method == 'PUT':
        body = request.get_json()
        if not body:
            return jsonify({"message": "ไม่พบข้อมูล JSON ในคำขอ"}), 400
        email = body.get('email')
        password = body.get('password')
        username = body.get('username')
        firstname = body.get('firstname')
        lastname = body.get('lastname')
        phonenumber = data.get('Phonenumber')
        #otp = data.get('OTP')
        if not email or not password:
            return jsonify({"message": "ไม่ได้ระบุข้อมูลอีเมลหรือรหัสผ่าน"}), 400

       # if is_duplicate_email(email, c):
        #    return jsonify({"message": "อีเมลนี้มีอยู่ในระบบแล้ว", "body": body}), 400
        else:
            c.execute('UPDATE registeremployer SET email = ?, password = ? username = ? firstname = ? lastname = ? phonenumber = ?WHERE register_id = ?', (email, password, username, firstname, lastname, phonenumber, body['register_id']))
            conn.commit()
            #results = check_duplicate_data(c)
            #if results:
             #   return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง", "body": body}), 400
            #else:
            return jsonify({"message": "Register update", "body": body}), 200

    elif request.method == 'DELETE':
        deleteId = request.args.get('register_id')
        if not deleteId:
            return jsonify({"message": "ไม่ได้ระบุ ID ที่ต้องการลบ"}), 400

        c.execute('DELETE FROM registeremployer WHERE register_id=?', (deleteId,))
        conn.commit()
        results = check_duplicate_data(c)
        if results:
            return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง"}), 400
        else:
            return {"message": "delete"}, 200
@app.route('/regemployee', methods=['POST', 'GET', 'PUT', 'DELETE'])
def regregemployee():
    conn = sqlite3.connect('matchwork2.sqlite')
    c = conn.cursor()
    # ตรวจสอบ Token หรือ API Key
    if 'Authorization' not in request.headers:
        return jsonify({"message": "Unauthorized"}), 401

    # ตรวจสอบความถูกต้องของ Token หรือ API Key ที่ส่งมา
    token = request.headers['Authorization'].replace('Bearer ', '')
    if not validate_token(token):
        return jsonify({"message": "Invalid Token"}), 401

    # ดำเนินการต่อไปตามที่คุณต้องการ
    # ...
 
    data = request.get_json()  # รับ JSON จากแอปพลิเคชัน Flutter
    email = data.get('email')
    password = data.get('password')
    username = data.get('Username')
    firstname = data.get('Firstname')
    lastname = data.get('Lastname')
    phonenumber = data.get('Phonenumber')
    skill = data.get('Skill')
    otp = data.get('OTP')
    
        
    print(email)
   # return jsonify({"message": "Registration Successful!"}), 201
    if request.method == 'POST':
        body = request.get_json()
        if not body:
            return jsonify({"message": "ไม่พบข้อมูล JSON ในคำขอ"}), 400
        email = body.get('email')
        password = body.get('password')
        register_id = body.get('register_id')
        username = body.get('Username')
        firstname = body.get('Firstname')
        lastname = body.get('Lastname')
        phonenumber = data.get('Phonenumber')
        skill = data.get('Skill')
        otp = data.get('OTP')
    
        #if not email or not password or not username or not firstname or not lastname:
         #   return jsonify({"message": "กรุณากรอกข้อมูลที่จำเป็น"}), 400
            
        if is_duplicate_email(email, c):
            return jsonify({"message": "อีเมลนี้มีอยู่ในระบบแล้ว", "body": body}), 400

        c.execute('SELECT COUNT(*) FROM registeremployee WHERE register_id = ?', (register_id,))
        count = c.fetchone()[0]
        if count > 0:
            return jsonify({"message": "ไอดีนี้ถูกใช้งานแล้ว", "body": body}), 400

        c.execute('SELECT COUNT(*) FROM registeremployee WHERE email = ?', (email,))
        email_count = c.fetchone()[0]
        if email_count > 0:
            return jsonify({"message": "อีเมลนี้ถูกใช้งานแล้ว", "body": body}), 400
        else:
            c.execute("INSERT INTO registeremployee (email, password, username, firstname, lastname,phonenumber,skill,otp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
              (email, password, username, firstname, lastname,phonenumber,otp))
            conn.commit()
            return jsonify({"message": "ลงทะเบียนเรียบร้อยแล้ว!", "body": body}), 201

    elif request.method == 'GET':
        rows = []
        for row in c.execute('SELECT * FROM registeremployee'):
            rows.append({
                "register_id": row[0], "email": row[1], "password": row[2],"username": row[3],"firstname": row[4],"lastname":row[5],"phonenumber":row[6],"skill":row[7],"otp":row[8]
            })
        results = check_duplicate_data(c)
        if results:
            return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง", "registeremployee": rows}), 400
        else:
            return {'registeremployee': rows}, 200
#check password ถ้าเปลี่ยนในอีเมลล์เดิมหรือไอดีเดิม!!
    elif request.method == 'PUT':
        body = request.get_json()
        if not body:
            return jsonify({"message": "ไม่พบข้อมูล JSON ในคำขอ"}), 400
        email = body.get('email')
        password = body.get('password')
        username = body.get('username')
        firstname = body.get('firstname')
        lastname = body.get('lastname')
        phonenumber = data.get('Phonenumber')
        skill = data.get('Skill')
        #otp = data.get('OTP')
        if not email or not password:
            return jsonify({"message": "ไม่ได้ระบุข้อมูลอีเมลหรือรหัสผ่าน"}), 400

       # if is_duplicate_email(email, c):
        #    return jsonify({"message": "อีเมลนี้มีอยู่ในระบบแล้ว", "body": body}), 400
        else:
            c.execute('UPDATE registeremployee SET email = ?, password = ? username = ? firstname = ? lastname = ? phonenumber = ?skill = ?WHERE register_id = ?', (email, password, username, firstname, lastname, phonenumber,skill, body['register_id']))
            conn.commit()
            #results = check_duplicate_data(c)
            #if results:
             #   return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง", "body": body}), 400
            #else:
            return jsonify({"message": "Register update", "body": body}), 200

    elif request.method == 'DELETE':
        deleteId = request.args.get('register_id')
        if not deleteId:
            return jsonify({"message": "ไม่ได้ระบุ ID ที่ต้องการลบ"}), 400

        c.execute('DELETE FROM registeremployee WHERE register_id=?', (deleteId,))
        conn.commit()
        results = check_duplicate_data(c)
        if results:
            return jsonify({"message": "มีข้อมูลที่ซ้ำกันในตาราง"}), 400
        else:
            return {"message": "delete"}, 200
                
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()  # รับ JSON จากแอปพลิเคชัน Flutter
    if not data:
        return jsonify({"message": "ไม่พบข้อมูล JSON ในคำขอ"}), 400
    email = data.get('email')
    password = data.get('password')
    
   # if not email or not password:
    #    return jsonify({"message": "กรุณากรอกอีเมลและรหัสผ่าน"}), 400

   # if ' ' in email or ' ' in password:
    #    return jsonify({"message": "อีเมลหรือรหัสผ่านไม่ควรมีช่องว่าง"}), 400

    if valid_login(email, password):
        return jsonify({"message": "Login successful!"}) #loginสำเร็จ
    else:
        return jsonify({"message": "Invalid login credentials"})#ไม่สามารถเข้าใช้งานได้
    
@app.route('/sign_out', methods=['GET'])
def sign_out():
    # Perform sign-out logic
    # You might want to clear session data, etc.
    return jsonify({'message': 'Sign-out successful'}), 200
    
@app.route('/profileemployer', methods=['GET', 'PUT'])
def profileemployer():
    if request.method == 'GET':
        profile_id = request.args.get('profile_id')
        if not profile_id:
            return jsonify({"message": "Profile ID is not specified"}), 400

        c.execute('SELECT * FROM registeremployer WHERE register_id=?', (profile_id,))
        profile_data = c.fetchone()

        if profile_data:
            return jsonify({"profileemployer": profile_data}), 200
        else:
            return jsonify({"message": "Profile not found"}), 404


        return jsonify({"message": "Profile updated successfully", "body": body}), 200

@app.route('/profileemployee', methods=['GET', 'PUT'])
def profileemployee():
    if request.method == 'GET':
        profile_id = request.args.get('profile_id')
        if not profile_id:
            return jsonify({"message": "Profile ID is not specified"}), 400

        c.execute('SELECT * FROM registeremployee WHERE register_id=?', (profile_id,))
        profile_data = c.fetchone()

        if profile_data:
            return jsonify({"profileemployee": profile_data}), 200
        else:
            return jsonify({"message": "Profile not found"}), 404

    elif request.method == 'PUT':
        # Your existing code...

        return jsonify({"message": "Profile updated successfully", "body": body}), 200

@socketio.on('message')
def handle_message(message):
    print('Received message:', message)
    emit('message', message, broadcast=True)  # ส่งข้อความไปยังทุกคนที่เชื่อมต่อ
@socketio.on('connect')
def handle_connect():
    # ตรวจสอบ Token หรือ API Key ในการเชื่อมต่อ SocketIO
    token = request.headers.get('Authorization', '').replace('Bearer ', '')
    if not validate_token(token):
        disconnect()  # ถ้า Token ไม่ถูกต้อง, ให้ตัดการเชื่อมต่อ

    print('Client connected')
    emit('message', 'You are connected!')

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected') 
if __name__ == '__main__':
    conn = sqlite3.connect('matchwork2.sqlite')
    c = conn.cursor()
    socketio.run(app, host='0.0.0.0', debug=True)  # ใช้ socketio.run แทน app.run เพื่อรองรับการสื่อสารแบบ real-time ด้วย SocketIO

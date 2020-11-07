from flask import Flask, jsonify, render_template, flash, redirect, url_for, session, request, logging
from flask_mysqldb import MySQL
#from wtforms import Form, StringField, TextAreaField, PasswordField, validators
#from passlib.hash import sha256_crypt
import pandas as pd
from functools import wraps
import recommender 

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
#app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'anveshak'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        session['username']=username
        return redirect(url_for('dashboard'))
    
    return render_template('login.html')


@app.route('/dashboard/<username>')    
def dashboard(username):
    # Create cursor
    #cur = mysql.connection.cursor()
    #result = cur.execute("SELECT * FROM corp_rating")
    corps=pd.read_csv('corp_rating.csv',names=['corp1234','ReliabilityIndex','MonetaryIndex','FlexibilityIndex','ImpactFactor','vertical','Objectives'])
    #recommender.get_ratings()
    #user_rating=recommender.compute_rating(rows)
    #collaborative_filtering_user()
    #result = cur.execute("SELECT * FROM ratingdescription_dataset")
    result=pd.read_csv('ratingdescription_dataset.csv',names=['startup_id','description','tags','ReliabilityIndex','PerformanceIndex','MonetaryIndex','ImpactFactor','vertical'])
    '''
    startups=[]
    for startup in result:
        startups.append(startup)
    '''
    recommended=recommender.cold_start2(username,result,corps)
    #return render_template('startups.html', display=recommended)
    return jsonify({'data':recommended})

if __name__ == '__main__':
    app.secret_key='secret123'
    app.debug = True
    app.run(host='0.0.0.0', port=3000)
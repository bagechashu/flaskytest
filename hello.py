#!/usr/bin/evn python

from flask import Flask, render_template
from flask import request 
from flask import redirect
from flask import abort
from flask_script import Manager

app = Flask(__name__)

manager = Manager(app)


@app.route('/')
def index():
	# return '<h1>Hello world!</h1>'
	return render_template('index.html')

@app.route('/browser')
def browser():
	user_agent = request.headers.get('User-Agent')
	return '<p>Your Browser is %s </p>'  % user_agent

@app.route('/user/<name>')
def user(name):
	# return '<h1>Hello ,%s!</h1>'  % name
	return render_template('user.html', name=name)

@app.route('/redirect')
def baiduredirect():
	return redirect('http://www.baidu.com')



if __name__ == '__main__':
	# app.run(debug=True)
	manager.run()


#!/usr/bin/evn python
from datetime import datetime

from flask import Flask, render_template
from flask import request 
from flask import redirect
from flask import abort
from flask_script import Manager
from flask_bootstrap import Bootstrap
from flask_moment import Moment
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Required

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Hallelujah'

manager = Manager(app)
bootstrap = Bootstrap(app)
moment = Moment(app)


class NameForm(FlaskForm):
	name = StringField('What is your name?', validators=[Required()])
	submit = SubmitField('Submit')


@app.errorhandler(404)
def page_not_found(e):
	return render_template('404.html'), 404

@app.errorhandler(500)
def internal_server_error(e):
	return render_template('500.html'), 500


@app.route('/', methods=['GET', 'POST'])
def index():
	name = None
	form = NameForm()
	if form.validate_on_submit():
		name = form.name.data
		form.name.data=''
	return render_template('index.html', 
				form=form,
				name=name,
				current_time=datetime.utcnow())

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


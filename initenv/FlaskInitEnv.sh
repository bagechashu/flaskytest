#!/usr/bin/evn bash

function Prepare_flask_env() {
	# pip install flask library
	pip3 install flask argparse flask-script flask-bootstrap 
}


function Download_flasktest() {
	mkdir $HOME/Flask
	# chmod 600 /home/lxx/.ssh/id_rsa
	git clone git@github.com:bagechashu/flaskytest.git $HOME/Flask
}

function main() {
	Prepare_flask_env
	# Download_flasktest
}

main

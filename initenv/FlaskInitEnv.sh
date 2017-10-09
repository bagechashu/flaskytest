
function Prepare_flask_env() {
	# pip install flask library
	$1/pip3 install flask
	$1/pip3 install argparse
	$1/pip3 install flask-script
	$1/pip3 install flask-bootstrap
	$1/pip3 install flask-moment 
	$1/pip3 install flask-wtf 
	$1/pip3 install flask-sqlalchemy 
}


function Download_flasktest() {
	mkdir $HOME/Flask
	# chmod 600 /home/lxx/.ssh/id_rsa
	git clone git@github.com:bagechashu/flaskytest.git $HOME/Flask
}

function main() {
	PIP_PATH=~/Flask/venv/bin
	Prepare_flask_env ${PIP_PATH}
	# Download_flasktest
}

main

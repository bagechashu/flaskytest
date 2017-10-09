
function Prepare_flask_env() {
	# pip install flask library
	$1/pip3 install flask argparse flask-script flask-bootstrap flask-moment 
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

#!/usr/bin/evn bash
# by lixiaoxue 2017-10-08
function Uninstall_old_virtualenv() {
	rpm -e $(rpm -qa |grep -i "python-virtualenv")
}

function Install_virtualenv15_tarball() {
	# tarball install virtualenv
	cd $HOME/Download
	wget https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-15.1.0.tar.gz#md5=44e19f4134906fe2d75124427dc9b716
	tar xf virtualenv-15.1.0.tar.gz 
	cd $HOME/Download/virtualenv-15.1.0
	python setup.py build
	python setup.py install

	# source virtualenv
	# ln -s $HOME/Downloads/virtualenv-15.1.0/virtualenv.py $HOME/bin/virtualenv
	cp $HOME/Downloads/virtualenv-15.1.0/virtualenv.py $HOME/bin/virtualenv

	source $HOME/.bash_profile
}

function Virtualenv_init() {
	cd $1
	virtualenv venv
	source $1/venv/bin/activate
	# deactivate 
}

function Venvmain() {
	Uninstall_old_virtualenv
	Install_virtualenv15_tarball
}


VENV_DIR=$HOME/Flask

Venvmain
Virtualenv_init ${VENV_DIR}







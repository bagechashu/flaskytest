#!/usr/bin/evn bash
# by:lixiaoxue 2017-10-08

function Install_compile_tools() {
	yum -y groupinstall "Development tools"
	yum -y install tree
	yum -y install sqlite
}

function Install_python3_tarball() {
	cd $1
	wget https://www.python.org/ftp/python/$2/$3.tar.xz
	tar xJf $3.tar.xz 
	cd $1/$3
	./configure --enable-loadable-sqlite-extensions --prefix=$4
	make
	make install
	make clean
	make distclean

	# centos6u4 change default python execution environment
	mv /usr/bin/python /usr/bin/python2.6.6
	rm -f /usr/bin/python2
	ln -s /usr/bin/python2.6.6 /usr/bin/python2
	ln -s $4/python3.6 /usr/bin/python3
	ln -s $4/python3.6 /usr/bin/python

	# centos6u4 adapt yum tools python version
	cp /usr/bin/yum /usr/bin/yum.bak
	sed -i 's#/usr/bin/python#/usr/bin/python2#' /usr/bin/yum
}

function Source_python3_scripts(){
	echo "PYTHON3_HOME=$1/bin" >> $HOME/.bash_profile
	echo 'PATH=$PYTHON3_HOME:$PATH:$HOME/bin' >> $HOME/.bash_profile
	echo 'export PATH' >> $HOME/.bash_profile
}

function main() {
	TAR_PATH=$HOME/Download
	PYTHON_VER=3.6.3
	PYTHON_DIR=Python-${PYTHON_VER}
	PYTHON_PREFIX=/usr/local/python${PYTHON_VER}
	
	Install_compile_tools 
	Install_python3_tarball ${TAR_PATH} ${PYTHON_VER} ${PYTHON_DIR} ${PYTHON_PREFIX}
	Source_python3_scripts ${PYTHON_PREFIX}
}

main


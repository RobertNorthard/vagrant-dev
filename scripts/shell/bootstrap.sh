#!/bin/bash

yum update -y
yum install -y epel-release

PACKAGES="python;python-pip;git;vi"
PYTHON_PACKAGES="cumulus"

IFS=";"
for PACKAGE in ${PACKAGES}
do
	yum install -y "${PACKAGE}"
done

pip install --upgrade pip

for PYTHON_PACKAGE in ${PYTHON_PACKAGES}
do
	pip install "${PYTHON_PACKAGE}"
done

cd $HOME

git init .
git remote add -t \* -f origin https://github.com/RobertNorthard/dotfiles.git
git checkout -f master


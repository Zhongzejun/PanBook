#!/bin/bash

function getVar() {
	cmd="echo \$$1"
	val=`eval $cmd`
	[ "$val"x == ""x ] && eval $1=$2
}

function note() {
	echo -e "\033[43;34m[NOTE] $1\033[0m"
}

function info() {
	[ "$DEBUG"x == "true"x ] && echo -e "\033[32m[INFO] $1\033[0m"
}

function warn() {
	[ "$DEBUG"x == "true"x ] && echo -e "\033[33m[WARN] $1\033[0m"
}

function error() {
	echo -e "\033[31m[ERRO] $1\033[0m"
	exit 1
}

function printhelp() {
	echo -e "  eBook maker base pandoc\n"
	echo -e "\tUsage: panbook <functions> [OPTIONS]\n"
	echo -e "  Available functions:"
	echo -e "\tinit        initialize work environment"
	echo -e "\tpdf         make pdf ebook"
	echo -e "\thtml        make html ebook"
	echo -e "\tepub        make epub ebook"
	echo -e "\tbeamer      make beamer"
	echo -e "\thelp        print help info"
	echo -e "\tsaveimg     save image url to local"
	echo -e "\teps         convert gif to eps"
	echo -e "  Available OPTIONS:"
	echo -e "\t--tpl       specify template for pandoc"
	echo -e "\t--class     specify documentclass for latex"
	echo -e "\t--theme     specify beamer theme"
	echo -e "\t--css       specify epub css"
	echo -e "\t--src       specify src dir name(default src)"
	echo -e "\t--imgdir    specify image dir name(default src/images)"
	echo -e "\t-V key=val  same with pandoc -V option"
	echo -e "\t-E key=val  set variable for template or beamer theme"
	echo -e "\t-d --debug  debug mode"
	echo -e "\t-h --help   function help(if exists)"
	exit 0
}

#!/bin/bash

logo(){
echo "          __  __     _      _             ";
echo "    o O O|  \/  |   (_)    | |__    ___   ";
echo "   o     | |\/| |   | |    | / /   / -_)  ";
echo "  TS__[O]|_|__|_|  _|_|_   |_\_\   \___|  ";
echo " {======|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"| ";
echo "./o--000'\"\`-0-0-'\"\`-0-0-'\"\`-0-0-'\"\`-0-0-' ";
echo "--------------------------------------------------------------";
echo "		             ___                          ";
echo "		    o O O   | _ \ __ __ __ _ _       ___  ";
echo "		   o        |  _/ \ V  V /| ' \     |_ /  ";
echo "		  TS__[O]  _|_|_   \_/\_/ |_||_|   _/__|  ";
echo "		 {======|_| \"\"\" |_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"| ";
echo "		./o--000'\"\`-0-0-'\"\`-0-0-'\"\`-0-0-'\"\`-0-0-' ";
echo "--------------------------------------------------------------";
}
logo

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

CTF_Recon(){
    echo '-----------------------------------------------------'
    echo "${red} Starting CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
    	export domain
    	bash ctf.sh $domain;
    echo '-----------------------------------------------------'
    echo "${red} Finished CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
}

WEB_Recon(){
    echo '-----------------------------------------------------'
    echo "${red} Starting CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
    	export domain
    	bash web.sh $domain;
    echo '-----------------------------------------------------'
    echo "${red} Finished CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
}

NETWORK_Recon(){
    echo '-----------------------------------------------------'
    echo "${red} Starting CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
    	
    echo '-----------------------------------------------------'
    echo "${red} Finished CTF Recon on : ${green} [$(echo $domain)] ${reset}"
    echo '-----------------------------------------------------'
}

while getopts ":d:l:eCWNh" opt; do
	case ${opt} in
		d ) domain=$OPTARG
		    ;;
		l ) IPs=$OPTARG
		    ;;
		e ) exclude=$OPTARG
		    ;;
		C ) CTF_Recon
		    ;;
		W ) WEB_Recon
		    ;;
		N ) NETWORK_Recon
		    ;;
		\? | h ) echo "Usage  :";
			 echo "         -d	Single domain target";
			 echo "         -l	List of Network IPs";
			 echo "		-e	Exclude target.(eg: sub1.ex.com,sub2.ex.com)";
			 echo "         -C	Perform CTF Recon";
			 echo "         -M	Perform Medium Recon";
			 echo "         -L	Perform Large Recon";
			 echo "         -h	Displays the usage details";
		         ;;
		: ) echo "Invalid Argument";
		     ;;
	esac
done
shift $((OPTIND -1))
#!/bin/bash

u_MemSpace=$(free | grep -i Mem | awk '{print $3/$2*100}')
usage(){
	echo "USAGE: $0 [-c 90] [-w 60] [-e <email address>]"
	exit 2;
}
function crit_func() {
	if [ $u_MemSpace -ge 90 ] && [ $u_MemSpace -le 100 ]; then
		echo "ALERT: Memory Space is in CRITICAL level ($u_MemSpace %)"
		echo "Sending the top 10 processes that used most of your Memory Space to the emal you provided. . . ."

		e_Msg=/home/ec2-user/top10.txt
		top -b | awk '!(NR<=6) {print} | head -10' > $e_Msg
		
		e_Subj=$(date + '%Y%m%D %H:%M')
		echo "PLease see attached file" | mail -s "$e_Subj" $e -A $e_Msg
	else
		echo "Memory Space is in $u_MemSpace %. Status: OKAY"
		exit 0;
}

function warn_func() {
	if [ $u_MemSpace -ge 60 ] && [ $u_MemSpace -le 90 ]; then
		echo "ALERT: Memory Space is in CRITICAL level ($u_MemSpace %)"
	else
		echo "Memory Space is in $u_MemSpace %. Status: OKAY"
		exit 0;

}


######################### M A I N #################################
while getopts 'c:w:e:' opt ; 
do
	case $opt in
		c) c=$OPTARG;;
		w) w=$OPTARG;;
		e) e=$OPTARG;;
		*) usage ;;
	esac
done

[ -z "$c"] && usage; [ -z "$w"] && usage; [ -z "$e"] && usage


if [ $c -e 90 ]; then
	crit_func
else
	usage
fi

if [ $w -e 60 ]; then
	crit_func
else
	usage
fi





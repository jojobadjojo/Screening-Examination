		#!/bin/bash

		u_MemSpace_dbl=$(free | grep -i Mem | awk '{print $3/$2*100}') # Data Type is float

		u_MemSpace=${u_MemSpace_dbl%.*} # parsing to int

		e_Sender=MemCheck.TechExam@gmail.com # ssmtp sender
				
		e_Subj=$(date +'%Y%m%d %H:%M') # email subject
		
		warn=1
		okay=0

		usage(){
			echo "USAGE: $0 [-c 90] [-w 60] [-e <email address>]"  # Error Handler
			exit 2;
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


		if [ $c -eq 90 ] && [ $w -eq 60 ]; then
				if [ $u_MemSpace -ge 90 ] && [ $u_MemSpace -le 100 ]; then
					echo "ALERT: Memory Space is in $u_MemSpace%. Status: CRITICAL!"
					echo "Sending the top 10 processes that used most of your Memory Space to the email you provided. . . ."
					{
						echo To: $e
						echo From: $e_Sender
						echo Subject: $e_Subj
						echo -e "Hi Team,\n\nPlease see the details below.\n\n"
							top -b | awk '!(NR<=6) {print}' | head -10
						echo -e "\n\nThank you."
					} | ssmtp $e
					echo "Email Sent!"

				elif [ $u_MemSpace -ge 60 ] && [ $u_MemSpace -le 89 ]; then
					echo "ALERT: Memory Space is $u_MemSpace%. Status: WARNING"	
					exit $warn;
				else
					echo "Memory Space is $u_MemSpace %. Status: OKAY"
					exit $okay;
			    fi
		else
			usage
		fi
		


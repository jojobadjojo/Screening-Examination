		#!/bin/bash

		u_MemSpace_dbl=$(free | grep -i Mem | awk '{print $3/$2*100}')
		u_MemSpace=${u_MemSpace_dbl%.*}
		usage(){
			echo "USAGE: $0 [-c 90] [-w 60] [-e <email address>]"
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

		echo $c $w $e


		if [ $c -eq 90 ] && [ $w -eq 60 ]; then
				if [ $u_MemSpace -ge 9 ] && [ $u_MemSpace -le 100 ]; then
					echo "ALERT: Memory Space is in $u_MemSpace%. Status: CRITICAL!"
					echo "Sending the top 10 processes that used most of your Memory Space to the email you provided. . . ."
					e_Sender=MemCheck.TechExam@gmail.com
			
			
					#e_Msg=$(top -b | awk '!(NR<=6) {print}' | head -10)
				
					e_Subj=$(date +'%Y%m%d %H:%M')
		

					{
						echo To: $e
						echo From: $e_Sender
						echo Subject: $e_Subj
						echo -e Hi Team,\n\nPlease see the details below.\n\n
							top -b | awk '!(NR<=6) {print}' | head -10
						echo -e \n\nThank you.
					} | ssmtp $e
					echo "Email Sent!"

				elif [ $u_MemSpace -ge 6 ] && [ $u_MemSpace -le 9 ]; then
					echo "ALERT: Memory Space is $u_MemSpace%. Status: WARNING"
				else
					echo "Memory Space is $u_MemSpace %. Status: OKAY"
					exit 0;
			    fi
		else
			usage
		fi
		
		#!/bin/bash

		u_MemSpace_dbl=$(free | grep -i Mem | awk '{print $3/$2*100}')
		u_MemSpace=${u_MemSpace_dbl%.*}
		usage(){
			echo "USAGE: $0 [-c 90] [-w 60] [-e <email address>]"
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

		echo $c $w $e


		if [ $c -eq 90 ] && [ $w -eq 60 ]; then
				if [ $u_MemSpace -ge 9 ] && [ $u_MemSpace -le 100 ]; then
					echo "ALERT: Memory Space is in $u_MemSpace%. Status: CRITICAL!"
					echo "Sending the top 10 processes that used most of your Memory Space to the email you provided. . . ."
					e_Sender=MemCheck.TechExam@gmail.com
			
			
					#e_Msg=$(top -b | awk '!(NR<=6) {print}' | head -10)
				
					e_Subj=$(date +'%Y%m%d %H:%M')
		

					{
						echo To: $e
						echo From: $e_Sender
						echo Subject: $e_Subj
						echo -e Hi Team,\n\nPlease see the details below.\n\n
							top -b | awk '!(NR<=6) {print}' | head -10
						echo -e \n\nThank you.
					} | ssmtp $e
					echo "Email Sent!"

				elif [ $u_MemSpace -ge 6 ] && [ $u_MemSpace -le 9 ]; then
					echo "ALERT: Memory Space is $u_MemSpace%. Status: WARNING"
				else
					echo "Memory Space is $u_MemSpace %. Status: OKAY"
					exit 0;
			    fi
		else
			usage
		fi
		

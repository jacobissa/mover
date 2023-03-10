#!/usr/local/bin/bash
cd /app/source
echo "-----------------------------------------------------------"
echo "MOVER has been started and is watching the source directory"
echo "-----------------------------------------------------------"
echo "          TZ           =     ${TZ}"
echo "          PATTERN      =     ${PATTERN}"
echo "          INTERVAL     =     ${INTERVAL}"
echo "-----------------------------------------------------------"
while true
do
	for ITEM in ${PATTERN}
	do
		if [ -e "${ITEM}" ]
		then
			LOG=/app/logs/$(date -I).log
			DATETIME=$(date -R)
			TIMESTAMP=$(date +"%Y%m%d%H%M%S")
			if [ ! -f ${LOG} ]
			then
				touch ${LOG}
				echo "A new log file has been created: ${LOG}"
				echo "-----------------------------------------------------------"
			fi
			echo "${DATETIME}" |& tee -a ${LOG}
			echo "'${ITEM}' has been found in the source directory" |& tee -a ${LOG}
			if [ -e "/app/target/${ITEM}" ]
			then
				echo "'${ITEM}' already exists in the target directory" |& tee -a ${LOG}
				mv -v -f "/app/target/${ITEM}" "/app/target/${ITEM}_${TIMESTAMP}" |& tee -a ${LOG}
			fi
			mv -v -f "${ITEM}" /app/target/ |& tee -a ${LOG}
			echo "-----------------------------------------------------------" |& tee -a ${LOG}
		fi
	done
	sleep ${INTERVAL}
done
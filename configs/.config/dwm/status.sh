#! /bin/sh

# Output before ; is to the right, after is to the left

BATDIR=$( find /sys/class/power_supply -name 'BAT*' | sed '1q' )

df -h | grep -q '\/home$' && HASHOME=true

while true; do
	[ -z "${BATDIR}" ] || BATSTR="🔋 $( cat "${BATDIR}"/capacity )% $( cat "${BATDIR}"/status ) | "

	VOLSTR="🔉 $(amixer sget Master | awk -F"[][]" '/dB/ { print $2 }')"

	DATESTR="📅 $( date +%a\ %d\ %b\ %R:%S )"

	ADDRSTR="📶 $(ip addr |\
		awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }'|\
		paste -sd ' ')"
	[ "$ADDRSTR" = "📶 " ] && ADDRSTR="📶 No Internet"

	FREESTR="💾 $( free -m | awk '/Mem:/ { print $3 " / " $2 }' )"

	CPUSTR="🌀 $( awk '/cpu / {usage=($2+$4)*100/($2+$4+$5)} END { printf("%.0f", usage) }' /proc/stat )%"

	DISKSTR="📁 $( df -h | awk '/ \/$/ { print $3 " / " $2 }' )"
	[ -z "${HASHOME}" ] || DISKSTR="$DISKSTR | 🏠 $( df -h | awk '/ \/home$/ { print $3 " / " $2 }' )"

	# BATSTR is ugly to make it work if no battery is connected
	xsetroot -name " ${BATSTR}${VOLSTR} | ${DATESTR}; ${ADDRSTR} | ${FREESTR} | ${CPUSTR} | ${DISKSTR}"
	sleep 5
done

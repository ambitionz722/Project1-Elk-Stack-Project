#bash
#bash roulette_dealer_finder_by_time.sh 0310 02 PM

grep -i $2 $1* | awk '{print $5" "$6}'

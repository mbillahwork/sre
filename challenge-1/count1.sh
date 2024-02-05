jumlahFile=`ls *-access.log | wc -l`
#echo $jumlahFile

for ((  i = 1 ;  i <= $jumlahFile;  i++  ))do
awk -vDate="`date -d'TZ="UTC" now-10 minutes' +'%Y-%m-%d %H:%M:%S.%3N'`" '$1" "$2 > Date {print Date, $0}' $i-access.log >> log10minutes.log

jumlahLog500=$(cat log10minutes.log | cut -d '"' -f3 | cut -d ' ' -f2 | grep 500 | wc -l)
echo "There were $jumlahLog500 HTTP 500 errors in ./$i-access.log in the last 10 minutes."
rm log10minutes.log
done

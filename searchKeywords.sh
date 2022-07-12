i=1;
k=1;
if [ "$1" = "-all" ]
then
mkdir $2_$3;
grep -wi -e $2 -e $3  ~/final/tweet.txt | while read -r tweet
do
echo $tweet > tweet_$i.txt;
mv "tweet_$i.txt" $2_$3/"tweet_$i.txt";
i=$(( $i + 1 ))
done
else
mkdir $1;
grep -wi $1 ~/final/tweet.txt |while read -r tweet
do
echo $tweet > tweet_$i.txt;
mv tweet_$i.txt $1/tweet_$i.txt
i=$(( $i + 1 ))
done
if [ -z $2 ]
then
:
else
mkdir $2;
grep -wi $2 ~/final/tweet.txt |while read -r tweets
do
echo $tweets > tweet_$k.txt;
mv tweet_$k.txt $2/tweet_$k.txt;
k=$(( $k + 1 ))
done
fi
fi

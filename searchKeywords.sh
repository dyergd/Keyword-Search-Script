i=1; #counter that determines the number of tweets that contain the search term
k=1; #another counter that determines the number of tweets that contain the search term

#if the first option in the statement is -all
#the script will take the 2 search terms and create a folder that contains tweets using either term
if [ "$1" = "-all" ] 
then
    mkdir $2_$3; #creates a directory named after ther two search terms
    grep -wi -e $2 -e $3  ~/final/tweet.txt | while read -r tweet #grabs tweets contain either search term and puts them into a varible
    do
        echo $tweet > tweet_$i.txt; #each tweet is then copied into a text file
        mv "tweet_$i.txt" $2_$3/"tweet_$i.txt"; #the text file containing the tweet is then moved into the designated folder
        i=$(( $i + 1 ))
    done
else
    mkdir $1;
    grep -wi $1 ~/final/tweet.txt | while read -r tweet
do
    echo $tweet > tweet_$i.txt;
    mv tweet_$i.txt $1/tweet_$i.txt;
    i=$(( $i + 1 ))
done

if [ -z $2 ]
then
    :
else
    mkdir $2;
    grep -wi $2 ~/final/tweet.txt | while read -r tweets
do
    echo $tweets > tweet_$k.txt;
    mv tweet_$k.txt $2/tweet_$k.txt;
    k=$(( $k + 1 ))
done
fi
fi

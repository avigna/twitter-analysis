#!/bin/bash

# Command to run in the background
# nohup ./twarcScript.sh > output.log &

# START CRONOMETER
start=$SECONDS

# QUERY
# Either inline or file
queryOption="inline"
if [ $queryOption == "inline" ]
then
   queryString="(\"Kendrick Lamar\" (COMPTON) (😍 OR 😘)) (-is:retweet)"
   queryString=$queryString
elif [ $queryOption == "file" ]
then
   value=`cat queryStringFile.txt`
   queryString=$value
else
   echo "None of the condition met."
   queryString=""
fi

echo "Query:"
echo "$queryString"
echo

# TIMEFRAME
# Either "test", "date" or "archive"
timeframeOption="test"
# If using timeframeOption="date", specify:
startTimeString="2020-12-01T05:00:00"
endTimeString="2021-06-01T05:00:00"


# FILENAME
fileNameString="date_test.jsonl" # Ignored when timeframeOption="test"

# TWARC SEARCH
if [ $timeframeOption == "test" ]
then
   echo "Timeframe: test"
   echo "Running..."
   twarc2 search "$queryString" \
  --archive \
  --start-time "2020-01-01T00:00:00" \
  --end-time "2020-01-01T12:00:00" \
  > "test.jsonl"

elif [ $timeframeOption == "date" ]
then
   echo "Timeframe: date"
   echo "From $startTimeString to $endTimeString"
   echo "Running..."
   twarc2 search "$queryString" \
  --archive \
  --start-time $startTimeString \
  --end-time $endTimeString \
  > $fileNameString
elif [ $timeframeOption == "archive" ]
then
   echo "Timeframe: archive"
   echo "WARNING: this might be a long search"
   echo "Running..."
   twarc2 search "$queryString" \
  --archive \
  > $fileNameString   
else
   echo "None of the condition met."
   echo "No search done."
fi

# TIME
duration=$(( SECONDS - start ))
echo "Running time: $duration s"

#!/bin/bash

# Command to run in the background
# nohup ./twarcScript.sh > output.log &

# START CRONOMETER
start=$SECONDS

# QUERY
# Either inline or file
queryOption="file"
if [ $queryOption == "inline" ]
then
   queryString="(\"Kendrick Lamar\" (COMPTON) (😍 OR 😘)) (-is:retweet)"
   queryString=$queryString
elif [ $queryOption == "file" ]
then
   value=`cat queryStringFile.txt`
   queryString=$value
else
   echo "None of the condition met"
   queryString=""
fi

echo "Query:"
echo "$queryString"
echo

# TIMEFRAME
# Either "test", "date" or "archive"
timeframeOption="test"
# If using timeframeOption="date", specify:
startTimeString="2021-01-01T00:00:00"
endTimeString="2021-04-01T00:00:00"

# FILENAME
fileNameString="testRT.jsonl" # Ignored when timeframeOption="test"

# TWARC SEARCH
if [ $timeframeOption == "test" ]
then
   echo "Timeframe: test"
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time "2020-01-01T00:00:00" \
  --end-time "2020-01-01T12:00:00" \
  > "test.jsonl"

elif [ $timeframeOption == "date" ]
then
   echo "Timeframe: date"
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time $startTimeString \
  --end-time $endTimeString \
  > $fileNameString
elif [ $timeframeOption == "archive" ]
then
   echo "Timeframe: archive"
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  > $fileNameString   
else
   echo "None of the condition met"
fi

# TIME
duration=$(( SECONDS - start ))
echo "Running time: $duration s"

#!/bin/bash

# nohup ./twarcScript.sh > output.log &
start=$SECONDS

# Query
queryString="(\"Kendrick Lamar\" (😍 OR 😘)) -is:retweet"
queryString=$queryString
echo "Query: $queryString"
echo

# Timeframe
# Either "test", "date" or "archive"
timeframeOption="test"
# If useing timeframeOption="date", specify the following:
startTimeString="2021-01-01T00:00:00"
endTimeString="2021-04-01T00:00:00"


# Filename (if not testing)
fileNameString="testRT.jsonl"

# Twarc search
if [ $timeframeOption == "test" ]
then
   echo $testString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time "2020-01-01T00:00:00" \
  --end-time "2020-01-01T12:00:00" \
  > "test.jsonl"

elif [ $timeframeOption == "date" ]
then
   echo $testString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time $startTimeString \
  --end-time $endTimeString \
  > $fileNameString
elif [ $timeframeOption == "archive" ]
then
   echo $archiveString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  > $fileNameString   
else
   echo "None of the condition met"
fi

# Printing
echo "Timeframe:"
duration=$(( SECONDS - start ))
echo $duration
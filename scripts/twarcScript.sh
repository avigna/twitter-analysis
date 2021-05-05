#!/bin/bash

start=$SECONDS

testString="test"
dateString="date"
archiveString="archive"

# queryString="Kendrick Lamar -is:retweet"
queryString="(MéxicoChingón OR #MexicanosChingones OR \"nación mexicana\" OR mexicanidad OR \"pueblo mexicano\" OR ((mexicana OR mexicanas OR mexicano OR mexicanos OR #mexicana OR #mexicanas OR #mexicano OR #mexicanos) (\"la forma de ser de\" OR \"sentimiento de unidad\" OR \"somos unidos\" OR \"estamos unidos\" OR \"nos motiva\" OR aspiraciones OR lecciones OR \"lugar que ocupamos\" OR \"lugar que ocupan\" OR chingones OR chingonas OR creativos OR creativas OR \"muy inteligentes\" OR desmadrosos OR desmadrosas OR \"motivados por\" OR \"el pueblo\" OR \"efectos sociales en México\" OR \"efectos políticos en México\" OR \"efectos económicos en México\")) OR  ((\"la política en\" OR \"la economía en\" OR \"la salud en\" OR \"las relaciones internacionales en\" OR \"la seguridad en\" OR \"la educación en\" OR \"el bienestar en\" OR \"el turismo en\" OR \"la cultura en\" OR \"la situación actual en\") (México OR #México))) \"-RT\" -is:retweet"
echo "Query: $queryString"

option=$dateString
startTimeString="2020-01-01T00:00:00"
endTimeString="2020-02-01T00:00:00"
fileNameString="testRT.jsonl"

if [ $option == $testString ]
then
   echo $testString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time "2020-01-01T00:00:00" \
  --end-time "2020-01-01T12:00:00" \
  > "test.jsonl"

elif [ $option == $dateString ]
then
   echo $testString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  --start-time $startTimeString \
  --end-time $endTimeString \
  > $fileNameString
elif [ $option == $archiveString ]
then
   echo $archiveString
   twarc2 search "$queryString" \
  --archive \
  --flatten \
  > $fileNameString   
else
   echo "None of the condition met"
fi


duration=$(( SECONDS - start ))
echo $duration
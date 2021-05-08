#!/bin/bash

start=$SECONDS

testString="test"
dateString="date"
archiveString="archive"

# queryString="Kendrick Lamar -is:retweet"
NarrativaBusqueda1="(MéxicoChingón OR #MexicanosChingones OR \"nación mexicana\" OR mexicanidad OR \"pueblo mexicano\" OR ((mexicana OR mexicanas OR mexicano OR mexicanos OR #mexicana OR #mexicanas OR #mexicano OR #mexicanos) (\"la forma de ser de\" OR \"sentimiento de unidad\" OR \"somos unidos\" OR \"estamos unidos\" OR \"nos motiva\" OR aspiraciones OR lecciones OR \"lugar que ocupamos\" OR \"lugar que ocupan\" OR chingones OR chingonas OR creativos OR creativas OR \"muy inteligentes\" OR desmadrosos OR desmadrosas OR \"motivados por\" OR \"el pueblo\" OR \"efectos sociales en México\" OR \"efectos políticos en México\" OR \"efectos económicos en México\")) OR  ((\"la política en\" OR \"la economía en\" OR \"la salud en\" OR \"las relaciones internacionales en\" OR \"la seguridad en\" OR \"la educación en\" OR \"el bienestar en\" OR \"el turismo en\" OR \"la cultura en\" OR \"la situación actual en\") (México OR #México))) -is:retweet"
NarrativaBusqueda3="((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (\"México - Tenochtitlán\" OR \"La Conquista\" OR \"La Independencia\" OR yanquis OR \"Santa Anna\" OR \"vende patrias\" OR \"El Álamo\" OR \"Porfirio Díaz\" OR \"Benito Juárez\" OR juarista OR porfirista OR \"sismo de 1985\" OR \"terremoto del 85\" OR \"sismo de 2017\" OR Covidiota OR Covidiotas OR #Covidiota OR #Covidiotas OR #NiUnaMenos OR #ElVioladorEresTú OR #EstadoOpresor OR #El9NadieSeMueve OR #El9NingunaSeMueve OR #UnDíaSinMujeres OR #UnDíaSinNosotras OR #MarchaFeminista OR \"violencia en el país\" OR \"los feminicidios en el país\" OR \"la pobreza en México\" OR \"la riqueza en México\" OR \"la desigualdad en México\" OR \"los Niños Héroes\" OR \"gesta heroica de Veracruz\" OR \"Batalla de Puebla\" OR \"ocupación estadounidense\" OR \"el muro de Trump\" OR Ayotzinapa OR #NosFaltan43 OR \"nos faltan 43\" OR \"masacre de San Fernando\" OR \"la inseguridad en el país\")) -is:retweet"
NarrativaBusqueda5="(mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (\"sentimiento de unidad\" OR \"pueblo singular\" OR \"pueblo original\" OR \"cohesión nacional\" OR \"cúpula de poder\" OR \"óptica política\" OR \"jornadas épicas\" OR \"episodios heroicos\" OR \"aspiraciones\" OR \"organización social\" OR \"autoanálisis\" OR \"ser nacional\") -(#CONSEPP OR \"Cruz Azul\" OR @AlexPadilla4C4 OR @lopezobrador OR \"López Obrador\" OR \"botas de hule\" OR \"Selección\" OR AMLO OR RT) -is:retweet"

# HistoriaBusequeda1=""


queryString=$NarrativaBusqueda5
echo "Query: $queryString"
echo
echo "Timeframe:"

option=$testString
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
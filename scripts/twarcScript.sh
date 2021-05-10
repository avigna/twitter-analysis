#!/bin/bash

# nohup ./twarcScript.sh > output.log &
start=$SECONDS

testString="test"
dateString="date"
archiveString="archive"

# queryString="(\"Kendrick Lamar\" (😍 OR 😘)) -is:retweet"
NarrativaBusqueda1="(MéxicoChingón OR #MexicanosChingones OR \"nación mexicana\" OR mexicanidad OR \"pueblo mexicano\" OR ((mexicana OR mexicanas OR mexicano OR mexicanos OR #mexicana OR #mexicanas OR #mexicano OR #mexicanos) (\"la forma de ser de\" OR \"sentimiento de unidad\" OR \"somos unidos\" OR \"estamos unidos\" OR \"nos motiva\" OR aspiraciones OR lecciones OR \"lugar que ocupamos\" OR \"lugar que ocupan\" OR chingones OR chingonas OR creativos OR creativas OR \"muy inteligentes\" OR desmadrosos OR desmadrosas OR \"motivados por\" OR \"el pueblo\" OR \"efectos sociales en México\" OR \"efectos políticos en México\" OR \"efectos económicos en México\")) OR  ((\"la política en\" OR \"la economía en\" OR \"la salud en\" OR \"las relaciones internacionales en\" OR \"la seguridad en\" OR \"la educación en\" OR \"el bienestar en\" OR \"el turismo en\" OR \"la cultura en\" OR \"la situación actual en\") (México OR #México))) -is:retweet"
NarrativaBusqueda2="((\"La Cuarta Transformación es\" OR \"la 4T es\" OR \"la #4T es\" OR \"la 4T está siendo\" OR \"la #4T está siendo\" OR \"La Cuarta Transformación está siendo\" OR \"La Cuarta Transformación está logrando\" OR \"la 4T está logrando\" OR \"la #4T está logrando\" OR \"bajo la Cuarta Transformación es\" OR \"bajo la 4T\" OR \"bajo la #4T\" OR \"La Cuarta Transformación crea\" OR \"la 4T crea\" OR \"la #4T crea\" OR \"La Cuarta Transformación destruye\" OR \"la 4T destruye\" OR \"la #4T destruye\" OR \"La Cuarta Transformación me representa\" OR \"la 4T me representa\" OR \"la #4T me representa\" OR \"La Cuarta Transformación me da\" OR \"la 4T me da\" OR \"la #4T me da\" OR \"La Cuarta Transformación me provoca\" OR \"la 4T me provoca\" OR \"la #4T me provoca\") (😍 OR 😘 OR 😟 OR 😠 OR 😡 OR 🤬 OR 😣 OR 😖 OR 😫 OR 😩 OR 😨 OR 😰 OR 😯 OR 😦 OR 😧 OR 😢 OR 😥 OR😪 OR 🤤 OR 😓 OR 😭 OR 😾 OR 💪 OR ✊ OR 👍 OR 👎 OR ✌ OR 🤛 OR 🤜 OR 🤟 OR 👌 OR 💩 OR 🙌 OR 👏 OR ❤️ OR ❌ OR 💯 OR ✅)) -is:retweet"
NarrativaBusqueda3="((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (\"México - Tenochtitlán\" OR \"La Conquista\" OR \"La Independencia\" OR yanquis OR \"Santa Anna\" OR \"vende patrias\" OR \"El Álamo\" OR \"Porfirio Díaz\" OR \"Benito Juárez\" OR juarista OR porfirista OR \"sismo de 1985\" OR \"terremoto del 85\" OR \"sismo de 2017\" OR Covidiota OR Covidiotas OR #Covidiota OR #Covidiotas OR #NiUnaMenos OR #ElVioladorEresTú OR #EstadoOpresor OR #El9NadieSeMueve OR #El9NingunaSeMueve OR #UnDíaSinMujeres OR #UnDíaSinNosotras OR #MarchaFeminista OR \"violencia en el país\" OR \"los feminicidios en el país\" OR \"la pobreza en México\" OR \"la riqueza en México\" OR \"la desigualdad en México\" OR \"los Niños Héroes\" OR \"gesta heroica de Veracruz\" OR \"Batalla de Puebla\" OR \"ocupación estadounidense\" OR \"el muro de Trump\" OR Ayotzinapa OR #NosFaltan43 OR \"nos faltan 43\" OR \"masacre de San Fernando\" OR \"la inseguridad en el país\")) -is:retweet"
NarrativaBusqueda4="((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (😍 OR 😘 OR 😟 OR 😠 OR 😡 OR 🤬 OR 😣 OR 😖 OR 😫 OR 😩 OR 😨 OR 😰 OR 😯 OR 😦 OR 😧 OR 😢 OR 😥 OR 😪 OR 🤤 OR 😓 OR 😭 OR 😾 OR 💪 OR ✊ OR👍 OR 👎 OR ✌ OR 🤛 OR 🤜 OR 🤟 OR 👌 OR 💩 OR 🙌 OR 👏 OR ❤️ OR ❌ OR 💯 OR ✅) -(\"asquerosa campaña\" OR \"de oficio\" OR cinturón OR subcampeón OR marido)) -is:retweet"
NarrativaBusqueda5="((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (\"sentimiento de unidad\" OR \"pueblo singular\" OR \"pueblo original\" OR \"cohesión nacional\" OR \"cúpula de poder\" OR \"óptica política\" OR \"jornadas épicas\" OR \"episodios heroicos\" OR \"aspiraciones\" OR \"organización social\" OR \"autoanálisis\" OR \"ser nacional\") -(#CONSEPP OR \"Cruz Azul\" OR @AlexPadilla4C4 OR @lopezobrador OR \"López Obrador\" OR \"botas de hule\" OR \"Selección\" OR AMLO OR RT)) -is:retweet"

HistoriaBusqueda1="(#SoyMestizo OR ((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (Genocidio OR genocidios OR catolicismo OR católicos OR guadalupana OR guadalupanos OR guadalupano OR malinchistas OR malinchista OR malinchismo OR aztecas OR náhuatl OR mestizo OR \"Guerra de independencia\" OR \"Miguel Hidalgo\" OR Iturbide OR juarismo OR cristeros OR liberales OR conservadores OR antiyaquismo OR porfiriato OR porfirismo OR revolucionario OR caudillos OR \"lucha de clases\" OR obreros OR rebelión OR \"pobres contra ricos\" OR Obregón OR \"Victoriano Huerta\" OR \"nuestra historia\" OR \"historia oficial\" OR \"Porfirio Díaz\" OR \"Santa Anna\" OR \"vende patrias\" OR neoliberales OR #RevoluciónMexicana OR \"Revolución Mexicana\" OR \"Benito Juárez\" OR mexica OR mexicas OR #mexica OR #mexicas OR \"Hernán Cortés\" OR #HernánCortés OR \"La Conquista\" OR Tenochtitlán OR \"Cristóbal Colón\" OR #CristóbalColón OR #Tenochtitlán)) NOT (\"casitas de campaña\" OR \"torbellino de dolor\" OR \"gran calidad\" OR \"mejores obreros\" OR \"enfermos de cáncer\" OR \"gran calidad\" OR \"mejor forma\" OR refinería OR \"Covid-19\" OR Covid OR #Covid19 OR #COVID OR #CrimenesDeLesaHumanidad OR #MargaritaAlCongreso OR \"segundo mejor presidente\" OR \"vieja pendeja\" OR \"video columna\" OR @lopezobrador_ OR RT)) -is:retweet"
HistoriaBusqueda2="((#SoyMestizo OR ((mexicana OR mexicanas OR mexicanos OR mexicano OR #mexicana OR #mexicano OR #mexicanos OR #mexicanas) (Moctezuma OR #Moctezuma OR \"Monumento a Cuauhtémoc\" OR #MonumentoACuauhtémoc OR \"Nueva España\" OR #NuevaEspaña OR \"2021 Año de la Independencia\" OR \"Vicente Guerrero\" OR #VicenteGuerrero OR \"Plan de Iguala\" OR #PlanDeIguala OR \"Ceremonia del Perdón\" OR #CeremoniaDelPerdón OR \"Grito de Independencia\" OR #GritoDeIndependencia OR \"Consumación de Independencia\" OR #ConsumaciónDeIndependencia OR \"José María Morelos y Pavón\" OR #JoséMaríaMorelosYPavón OR \"Tratados de Córdoba\" OR #TratadosDeCórdoba OR \"Emiliano Zapata\" OR #EmilianoZapata OR \"Revolución Mexicana\" OR #RevoluciónMexicana OR \"Santa Anna\" OR #SantaAnna OR \"guerra México-Estados Unidos\" OR \"Río Nueces\" OR #RíoNueces OR \"Batalla del Álamo\" OR #BatallaDelÁlamo OR \"2 de octubre no se olvida\" OR #2DeOctubreNoSeOlvida OR #2DeOctubre OR #Tlatelolco1968 OR #México68 OR #MatanzaDeTlatelolco OR #MasacreDeTlatelolco OR \"movimiento estudiantil de 1968\")) -(\"casitas de campaña\" OR \"torbellino de dolor\" OR \"gran calidad\" OR \"mejores obreros\" OR \"enfermos de cáncer\" OR \"gran calidad\" OR \"mejor forma\" OR \"refinería\" OR \"Covid-19\" OR \"Covid\" OR #Covid19 OR #COVID OR #CrimenesDeLesaHumanidad OR #MargaritaAlCongreso OR \"segundo mejor presidente\" OR \"vieja pendeja\" OR \"video columna\" OR @lopezobrador_ OR \"Beatriz Gutiérrez\" OR \"Learjet 45XR\" OR \"maniobras de rescate\" OR \"duda felipe ángeles\" OR \"Elecciones de 2021\" OR RT))) -is:retweet"
HistoriaBusqueda3="(\"PRI robó más\" OR ((\"Partido Nacional Revolucionario\" OR PNR OR #PNR OR #PartidoNacionalRevolucionario OR \"Plutarco Elías Calles\" OR \"Lázaro Cárdenas\" OR \"Partido de la Revolución Mexicana\" OR PRM OR #PRM OR #PartidoDeLaRevoluciónMexicana OR \"Emilio Portes Gil\" OR \"Partido Revolucionario Institucional\" OR PRI OR #PRI OR #PartidoRevolucionarioInstitucional OR \"Adolfo Ruiz Cortines\" OR \"Miguel Alemán\" OR \"Gustavo Díaz Ordaz\" OR priismo OR priísmo OR priista OR príista OR #priismo OR \"Viejo PRI\" OR \"Luis Echeverría\") (pasado OR \"en 1928\" OR \"en 1938\" OR \"en 1929\" OR \"en 1943\" OR \"en 1946\" OR \"en 1939\" OR \"en 1947\" OR \"en 1953\" OR \"en 1963\" OR \"en 1968\" OR \"en 1963\" OR dictadura OR dictablanda)) -(\"pleno ejercicio\" OR \"plaza de educadora\" OR \"nueva mesa\" OR \"baños de pureza\" OR \"coalición PAN, PRI y PRD\" OR \"Felipe Calderón\" OR @FelipeCalderon OR @lopezobrador_ OR \"alianza PRI\" OR refinería OR \"mejor presidente\" or \"próximas elecciones\" OR \"gobierno de morena\" OR \"PRI, PAN y PRD\" OR @alitomorenoc OR \"próximo proceso\" OR \"acusada de propagación de epidemia\" OR \"alto rango\" OR \"uso presupuesto\" OR \"morena elecciones\" OR \"gran trabajo de logística\" OR Alito OR \"lopezobradorismo\" OR \"mata de mango\" OR \"red de prostitución\" OR \"equipo de colaboradores\" OR \"mejores condiciones\" OR RT)) -is:retweet"
HistoriaBusqueda4="(((\"Tratado de Libre Comercio de América del Norte\" OR \"Admisión de México al GATT\" OR \"Tratado de Libre Comercio México y la Unión Europea\" OR \"Acuerdo México Japón\") (\"1 de enero 1994\" OR \"en 1992 se firmó\" OR \"en 1986\" OR \"1 de julio de 2000\" OR \"1 de abril 2005\")) OR ((\"en el pasado\" OR \"en nuestro pasado\" OR \"nos marcó\" OR \"nos definió\" OR \"fuimos marcados por\" OR \"nos persigue nuestro pasado\" OR \"nos define nuestro pasado\" OR \"condenados por nuestro pasado\") (\"la corrupción\" OR \"la falta de unión\" OR \"las divisiones\" OR \"la lucha de poder\" OR \"la violencia\" OR \"la desigualdad\" OR \"los logros colectivos\" OR \"la libertad\" OR \"la democracia\" OR \"dependencia a Estados Unidos\" OR \"el racismo\")) -(\"feroz acoso\" OR censos OR \"patético caso\" OR \"gran escala\" OR \"gente que se la pasaron incluso mejor\" OR #Violentómetro OR \"Quienes nos acusan con mentiras\" OR \"sensus fidei\" OR \"Yásnaya Aguilar\" OR \"el narcotráfico en su primera línea\" OR Venezuela OR \"pobre diablo\" OR \"pura saliva\" OR \"simples gatos\" OR RT)) -is:retweet"
HistoriaBusqueda5="(((\"mexicana en contra de\" OR \"mexicanas en contra de\" OR \"mexicanos a favor de\" OR \"mexicano a favor de\" OR \"mexicana a favor de\" OR \"mexicanas a favor de\" OR \"mexicanos en contra de\" OR \"mexicano en contra de\" OR \"mexicana apoyo\" OR \"mexicanas apoyamos\" OR \"mexicana defiendo\" OR \"mexicanas defendemos\" OR \"mexicana creo en\" OR \"mexicanas creemos en\" OR \"mexicana detesta\" OR \"mexicanas detestamos\" OR \"mexicana me opongo\" OR \"mexicanas nos oponemos\" OR \"mexicana no quiero\" OR \"mexicanas no queremos\" OR \"mexicano apoyo\" OR \"mexicanos apoyamos\" OR \"mexicano defiendo\" OR \"mexicanos defendemos\" OR \"mexicano creo en\" OR \"mexicanos creemos en\" OR \"mexicano detesta\" OR \"mexicanos detestamos\" OR \"mexicano me opongo\" OR \"mexicanos nos oponemos\" OR \"mexicano no quiero\" OR \"mexicanos no queremos\") (mitos OR mentiras OR \"puros cuentos\" OR demagogia OR falsedad OR engaño OR autoengaño OR \"la historia oficial\" OR \"contar bien la historia\" OR \"contar bien toda la historia\")) -(\"buenos días\" OR \"anciano sátrapa\" OR \"grupo de idiotas\" OR RT)) -is:retweet"

queryString=$HistoriaBusqueda5
echo "Query: $queryString"
echo
echo "Timeframe:"

option=$testString
startTimeString="2021-01-01T00:00:00"
endTimeString="2021-04-01T00:00:00"
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
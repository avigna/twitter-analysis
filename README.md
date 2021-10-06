# twitter-analysis

<!-- ## Contents
 - [Overview](#Overview)
 - [Queries](#Queries)
 - [Resources](#Resources)
 - [Contact](#Contact)
 - [License](#License) -->

## Overview
The purpose of this public repository is to do collection and analysis of Twitter data.
In the current version, the repository consists uniquely on scripts that search and save Tweets in .jsonl format. 
For that we will need to install one of the following two packages:
  - [Twarc v2.3.12](https://twarc-project.readthedocs.io/en/latest/twarc2/): this package, which we suggest to use as default, need to be installed in order to make Tweet queries using the shell script /twitter-analysis/scripts/twarcScript.sh.

Additionally, the file /twitter-analysis/scripts/readJsonlFiles.ipynb is a jupyter notebook to make quick searches and queries through any .jsonl file.


## Queries: basics, tips, and examples
This repository was created following the release of Twitter's [Academic Research product track](https://developer.twitter.com/en/solutions/academic-research).
The main advantage or the Academic Research product track is that you get full access to archival data. 
It seems that it includes deleted and private tweets, but an official reference is needed to backup this statement.
While this is a powerful tool and gives access to a lot of data, the main problem with it is that it comes under [Twitter API v2](https://developer.twitter.com/en/docs/twitter-api/early-access).
Twitter API v2 will eventually be a great tool, but it is currently under developement.
This means that a lot of the resources, tools and syntax that are commonly used in v1 are, currently, either not as robust or not accessible at all.
This might eventually be addressed by the developers, but it currently results in a warning for any user using this repository and any reference to resources based on v1.

### Basics
Tweet searches, like most other searches and query services, and arguably most of modern computing, rely on the foundations of [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).
Boolean algebra uses operators AND, OR and NOT.
These operators have a special syntax in Twarc.
Some examples of a query, which will be in quote marks, are the following:

1. The AND operator is included as a space, so the query "Kendrick AND Lamar" should be written as "Kendrick Lamar" or "(Kendrick) (Lamar)". Moreover, the parenthesis serve to cluster or isolate each element of the query, which is particularly useful for long queries.
2. The OR operator is included literally and in caps, so the query "Superman or Batman" should be written as "Superman OR Batman" and, for better readibility "(Superman) OR (Batman)".
3. The NOT operator in included as a dash, so the query "NOT happy"should be written as "-(happy)".

### Tips
  - You only have 1,024 characters available for each query.
  - If in doubt, always use parentheses to encompass terms. However, beware that parentheses takes 2 characters.
  - Remember that, in this implementation of the searching script, quotation marks take 2 characters rather than 1; this is because you need to use a backslash ("\\") before the quotation marks. This is true except for the main-query quotation marks.
  - In order to save characters, don't use quotation marks on individual words.
  - Beware of formating, e.g., quotation marks should be straight "" and not curved “”.

### Examples
---
Example 1: 

#### Query: "(Kendrick OR Lamar) (Compton) -(BLM)" 

should look for tweets that include the words "Kendrick" or "Lamar" and the word "Compton" but not the acronym "BLM".

The use of quote marks is very important in queries and needs to be correctly implemented to work in the current version of the /twitter-analysis/scripts/twarcScript.sh shell script. As shown in Ex. 1, the main query uses quote marks. However, the use of quote marks is useful to make string queries.

---
Example 2: 

#### Query: "(\\"Kendrick Lamar\\" OR \\"Kanye West\\" OR \\"Jay-Z\\")"

should look tweets that look for full phrases containing "Kendrick Lamar", "Kanye West" or "Jay-Z", and will avoid spelling correction. Note that, given that these phrases are inside the main-query quotation marks, any additional quotation marks that pile-up words need to have an inverted dash before the straight double commas. In other words, avoid any weirdly formatted, e.g., curly, quotation marks. Remember that all characters, but the main-query quotation marks, count in the 1,024 character limit for a search query.

There are additional Twitter search operators that can be used for specific purposes.

---
Example 3:

#### Query: "(\\"Kendrick Lamar\\") (lang:es) (place_country:US) (-is:retweet)"

should look for full phrases containing "Kendrick Lamar", that Twitter has classified to be in Spanish and located in the US, and that are not retweets.

---
Example 4:

#### Query: "(\\"Kendrick Lamar\\" OR \\"Kanye West\\" OR \\"Jay-Z\\") (😍 OR 😘) (lang:es) (place_country:MX) (-is:retweet)"

---

## Scripts
The main script to do queries is located on `/twitter-analysis/scripts/twarcScript.sh`.
The function of the script if to do a specific query on a certain time frame and store the results in a jsonl file.
There are two query options: `inline` and `file` queries.
The `inline` query searches for whatever is specified as a `queryString` in the `twarcScript.sh`.
The `file` query reads the content of `/twitter-analysis/scripts/queryStringFile.txt` and uses it to do the query.
*CAUTION*: The `file` option is currently faulty.
The part of the script that deals with the content of the query looks like the following:

```
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
```

In order to choose the timeframe for the query, one must choose between a `test`, a `date` or an `archive` search.
The `test` search looks for 12 hrs of archival Twitter data in order to get a small but representative sample of a query.
The `date` search looks for user defined start and end times to do the search.
Finally, the `archive` search looks for all of Twitter data.
The part of the script that deals with the time frame looks like the following:

```
# TIMEFRAME
# Either "test", "date" or "archive"
timeframeOption="test"
# If using timeframeOption="date", specify:
startTimeString="2021-01-01T00:00:00"
endTimeString="2021-04-01T00:00:00"
```

Where the `startTimeString` and `endTimeString` are only used when `timeframeOption="date"`.


## Resources
[Twitter analysis using this repo](https://www.eluniversal.com.mx/opinion/ingrid-alvarez/diplomacia-digital-de-ministros-tweets-y-bots): newspaper column using Twitter data to analyse a particular event surrounding Mexican politics (Spanish). See also this [Tweet](https://twitter.com/alejandro_vigna/status/1443571108922363916) for a high-resolution plot.

[Learn twarc](https://scholarslab.github.io/learn-twarc/): mostly for v1, but some overlap with v2. Hopefully a complete and robust documentation for v2 soon.

https://twittercommunity.com/: forums of users discussing their experiences, questions, and solutions while data mining on Twitter.

[Search Tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/search/introduction): Twitter Developer official "get started" on how to search Tweets.

[Rules and Filtering](https://developer.twitter.com/en/docs/twitter-api/enterprise/rules-and-filtering/operators-by-product): rules and filters that are available for the Enterprise version of Twitter. Most of them probably work on Twarc2 with the Academic Research product track, or at least they don't throw an error. This is a very good resource for advanced searches, but, again, beware of compatibility.

[Twitter advanced search](https://github.com/igorbrigadir/twitter-advanced-search): Igor Brigadir's through document with a list of operators and examples for Twitter queries. 

[Geofenced Searches on Twitter: A Case Study Detailing South Asia’s Covid Crisis](https://www.bellingcat.com/resources/2021/05/19/geofenced-searches-on-twitter-a-case-study-detailing-south-asias-covid-crisis/): a nice article where some alternative approaches and tools are shown and discussed in some detail.


## Contact
Please email your comments, queries, and suggestions to: avignagomez@nbi.ku.dk


## License
[MIT](https://choosealicense.com/licenses/mit/)

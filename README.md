# twitter-analysis

## Overview
The purpose of this public repository is to do collection and analysis of Twitter data.
In the current version, the repository consists uniquely on scripts that search and save Tweets in .jsonl format. 
For that we will need to install one of the following two packages:
  - [Twarc2](https://twarc-project.readthedocs.io/en/latest/twarc2/): this package, which we suggest to use as default, need to be installed in order to make Tweet queries using the shell script /twitter-analysis/scripts/twarcScript.sh.
  - [searchtweets-v2](https://pypi.org/project/searchtweets-v2/): alternatively, this package can be installed to make Tweet queries using the python scripts in /twitter-analysis/scripts/searchtweets/. However, it has been proven to be less reliable than other packages, and might be soon deprecated and deleted. For now, we keep it as an alternative.

Additionally, the file /twitter-analysis/scripts/readJsonlFiles.ipynb is a jupyter notebook to make quick searches and queries through any .jsonl file.

## Queries: basics and resources
This repository was created following the release of Twitter's [Academic Research product track](https://developer.twitter.com/en/solutions/academic-research).
The main advantage or the Academic Research product track is that you get full access to archival data. 
It seems that it includes deleted and private tweets, but an official reference is needed to backup this statement.
While this is a powerful tool and gives access to a lot of data, the main problem with it is that it comes under [Twitter API v2](https://developer.twitter.com/en/docs/twitter-api/early-access).
Twitter API v2 will eventually be a great tool, but it is currently under developement.
This means that a lot of the resources, tools and syntax that are commonly used in v1 are, currently, either not as robuts or not accessible at all.
This might eventually be addressed by the developers, but it currently results in a warning for any user using this repository and any reference to resources based on v1.

### Basics
Tweet searches, like most other searches and query services, and arguably most of modern computing, rely on the foundations of [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).
Boolean algebra uses operators AND, OR and NOT.
These operators have a special syntax in Twarc.
Some examples of a query, which will be in quote marks, are the following:

The query "Kendrick AND Lamar" should be written as "Kendrick Lamar" or "(Kendrick) (Lamar)", where the space serves as the AND operator. Moreover, the parenthesis serve to cluster or isolate each element of the query, which is particularly useful for long queries.


2, and therefore the way they should be included /twitter-analysis/scripts/twarcScript.sh, is not verbatim.

### Resources
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

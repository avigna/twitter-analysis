import numpy as np
import subprocess
import sys
import os
import pickle
import itertools 
from subprocess import call
import time

# Check if we are using python 3
python_version = sys.version_info[0]
print("python_version =", python_version)

class pythonProgramOptions:
    """
    A class to store and access program options in python
    """

    # Do 'python /PATH/search_tweets.py -h' to see all options
    #-- Define variables
    # [--credential-file CREDENTIAL_FILE]
    # [--credential-file-key CREDENTIAL_YAML_KEY]
    # [--env-overwrite ENV_OVERWRITE]
    # [--config-file CONFIG_FILENAME]
    # [--query QUERY]
    # [--start-time START_TIME]
    # [--end-time END_TIME]
    # [--since-id SINCE_ID]
    # [--until-id UNTIL_ID]
    # [--results-per-call RESULTS_PER_CALL]
    # [--expansions EXPANSIONS]
    # [--tweet-fields TWEET_FIELDS]
    # [--user-fields USER_FIELDS]
    # [--media-fields MEDIA_FIELDS]
    # [--place-fields PLACE_FIELDS]
    # [--poll-fields POLL_FIELDS]
    # [--atomic]
    # [--max-tweets MAX_TWEETS]
    # [--max-pages MAX_PAGES]
    # [--results-per-file RESULTS_PER_FILE]
    # [--filename-prefix FILENAME_PREFIX]
    # [--no-print-stream]
    # [--print-stream]
    # [--extra-headers EXTRA_HEADERS]
    # [--debug]

    executable = 'python3 search_tweets.py'
    credential_file = './.twitter_keys.yaml'
    # query = '\" TEXT \"'
    query = '\" (#MéxicoChingón OR #MexicanosChingones OR nación mexicana OR mexicanidad OR pueblo mexicano OR ((mexicana OR mexicanas OR mexicano OR mexicanos OR #mexicana OR #mexicanas OR #mexicano OR #mexicanos) (la forma de ser de OR sentimiento de unidad OR somos unidos OR estamos unidos OR nos motiva OR aspiraciones OR lecciones OR lugar que ocupamos OR lugar que ocupan OR chingones OR chingonas OR creativos OR creativas OR muy inteligentes OR desmadrosos OR desmadrosas OR motivados por OR el pueblo OR efectos sociales en México OR efectos políticos en México OR efectos económicos en México)) OR ((la política en OR la economía en OR la salud en OR las relaciones internacionales en OR la seguridad en OR la educación en OR el bienestar en OR el turismo en OR la cultura en OR la situación actual en) (México OR #México))) -RT \"'
    start_time = '2021-04-01T00:00'
    end_time = '2021-04-11T00:00'
    tweet_fields = '\"created_at,author_id\"'
    filename_prefix = 'Narrativa_Busqueda1_crossTest'
    printCommand = ''

    queryString = filename_prefix+"_query.txt"
    with open(queryString, "w") as text_file:
        text_file.write("%s" % query)

    def stringChoices(self):
        stringChoices = [
            self.credential_file,
            self.query,
            self.start_time,
            self.end_time,
            self.tweet_fields,
            self.filename_prefix,
            self.printCommand
        ]

        return stringChoices

    def stringCommands(self):
        stringCommands = [
            '--credential-file',
            '--query',
            '--start-time',
            '--end-time',
            '--tweet-fields',
            '--filename-prefix',
            '--no-print-stream'
        ]

        return stringCommands


    def generateCommandLineOptionsDict(self):
        """
        Parameters
        -----------
        self : pythonProgramOptions
            Contains program options
    
        Returns
        --------
        commands : str or list of strs
        """
    
        stringChoices = self.stringChoices()
        stringCommands = self.stringCommands()
        nString = len(stringChoices)
        assert len(stringCommands) == nString
    
        ### Collect all options into a dictionary mapping option name to option value

        command = {'executable' : self.executable}
        for i in range(nString):
            if not stringChoices[i] == None:
                command.update({stringCommands[i] : stringChoices[i]})
    
        return command


def combineCommandLineOptionsDictIntoShellCommand(commandOptions):
    """
    Write out the compas input parameters into a shell string.
    Ensure the Compas executable is first, and not repeated.
    Options are non-ordered.
    """

    shellCommand = commandOptions['executable']
    del commandOptions['executable'] 
    for key, val in commandOptions.items():
        shellCommand += ' ' + key + ' ' + val

    # shellCommand += ' | jq \'.\' > DataTest1.txt'        

    return shellCommand


if __name__ == "__main__":

    start_time = time.time()
    #-- Get the program options
    programOptions = pythonProgramOptions()
    commandOptions = programOptions.generateCommandLineOptionsDict()

    #-- Convert options into a shell string
    shellCommand = combineCommandLineOptionsDictIntoShellCommand(commandOptions)

    #-- Run exectute COMPAS shell string
    print(shellCommand)
    call(shellCommand,shell=True)
    print(time.time() - start_time, 's')

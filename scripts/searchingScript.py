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
    query = '\" Mexico -RT \"'
    start_time = '2021-04-01T00:00'
    end_time = '2021-04-11T00:00'
    tweet_fields = 'created_at'
    filename_prefix = 'Narrativa_Busqueda1_test_emoji'

    # outputData = 'DataTest1.txt'

    logfile_common_envelopes       = None

    # def booleanChoices(self):
    #     booleanChoices = [
    #         self.enable_warnings
    #     ]

    #     return booleanChoices

    # def booleanCommands(self):
    #     booleanCommands = [
    #         '--enable-warnings'
    #     ]

    #     return booleanCommands

    # def numericalChoices(self):
    #     numericalChoices = [
    #         self.number_of_systems
    #     ]

    #     return numericalChoices

    # def numericalCommands(self):
    #     numericalCommands = [
    #         '--number-of-systems'
    #     ]

    #     return numericalCommands

    def stringChoices(self):
        stringChoices = [
            self.credential_file,
            self.query,
            self.start_time,
            self.end_time,
            self.tweet_fields,
            self.filename_prefix
        ]

        return stringChoices

    def stringCommands(self):
        stringCommands = [
            '--credential-file',
            '--query',
            '--start-time',
            '--end-time',
            '--tweet-fields',
            '--filename-prefix'        
        ]

        return stringCommands

    # def listChoices(self):
    #     listChoices = [
    #         self.log_classes,
    #         self.debug_classes
    #     ]

    #     return listChoices

    # def listCommands(self):
    #     listCommands = [
    #         '--log-classes',
    #         '--debug-classes'
    #     ]

        # return listCommands


    def generateCommandLineOptionsDict(self):
        """
        This function generates a dictionary mapping COMPAS options to their specified 
        values (or empty strings for boolean options). These can be combined into a string
        and run directly as a terminal command, or passed to the stroopwafel interface
        where some of them may be overwritten. Options not to be included in the command 
        line should be set to pythons None (except booleans, which should be set to False)
    
        Parameters
        -----------
        self : pythonProgramOptions
            Contains program options
    
        Returns
        --------
        commands : str or list of strs
        """
        # booleanChoices = self.booleanChoices()
        # booleanCommands = self.booleanCommands()
        # nBoolean = len(booleanChoices)
        # assert len(booleanCommands) == nBoolean
    
        # numericalChoices = self.numericalChoices()
        # numericalCommands = self.numericalCommands()
        # nNumerical = len(numericalChoices)
        # assert len(numericalCommands) == nNumerical
    
        stringChoices = self.stringChoices()
        stringCommands = self.stringCommands()
        nString = len(stringChoices)
        assert len(stringCommands) == nString
    
        # listChoices = self.listChoices()
        # listCommands = self.listCommands()
        # nList = len(listChoices)
        # assert len(listCommands) == nList


        ### Collect all options into a dictionary mapping option name to option value

        command = {'executable' : self.executable}
    
        # for i in range(nBoolean):
        #     if booleanChoices[i] == True:
        #         command.update({booleanCommands[i] : ''})
    
        # for i in range(nNumerical):
        #     if not numericalChoices[i] == None:
        #         command.update({numericalCommands[i] : str(numericalChoices[i])})
    
        for i in range(nString):
            if not stringChoices[i] == None:
                command.update({stringCommands[i] : stringChoices[i]})
    
        # for i in range(nList):
        #     if listChoices[i]:
        #         command.update({listCommands[i] : ' '.join(map(str,listChoices[i]))})
    
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

GreatSPN Smart Connector for Chiminey
=====================================
GreatSPN allows formal model checking of a system modeled as petri net.  'GreatSPN Smart Connector for Chiminey' allows payload parameter sweep over GreatSPN petri net models. Chiminey facilitates scheduling computes over the cloud for parallel execution of these GreatSPN models.

Once 'GreatSPN Smart Connector' is activated in Chiminey, Chiminey portal then allows to configure and submit a GreatSPN job for execution.

GreatSPN Smart Connector(SC) install
-------------------------------------
The GreatSPN SC installs GreatSPN binary in each Cloud VM. During activation of GreatSPN SC, the user is required to provide the GreatSPN binay built for linux x64. Please place the GreatSPN binary in the 'package' directory of chiminey install. For details description refer to installation steps in https://github.com/alahmedabdullah/greatspnconnector/blob/master/SETUP.md file.

The Input Directory
-------------------
A connector in Chiminey system specifes a 'Input Location' through 'Create Job' tab of the Chimney-Portal. Files located in the 'Input Location' directory is loaded to each VM for cloud execution. The content of 'Input Location' may vary for different runs. Chiminey allows parameteisation of the input envrionment. Any file with '_template' suffix located in the input directory is regarded as template file. Chiminey internally replaces values of the template tags based on the 'payload parameter sweep' provied as Json Dictionary from 'Create Job' tab in the Chiminey portal.

The input directory is provided with a template file 'run.sh_template' which is availabe in 'input_greatspn' directory of GREATSPN SC install. All the template tags specified in  the run.sh_template file will be internally replaced by Chiminey with corresponding values that are passed in from 'Chiminey Portal' as Json dictionary. The 'run.sh_template' is  also renamed to 'run.sh' with all template tags replaced with corresponding values.

For example let us assume following shell commands are used to execute a GreatSPN model cycpoll.net and ranpoll1.net

```
$ disab_lp cycpoll
$ pinvar cycpoll
$ disab_lp ranpoll1
$ pinvar ranpoll1
```
Output files for the target GreatSPN model are created in the same directory where model file is located. To execute these greatSPN .net models over the Greapt-SPN modules from the Chimiley portal, an appropiate JSON dictionary need to be passed in. 

The JSON dictionary has to be passed in from 'Payload parameter sweep' field from Chiminey-Portal's 'Create Job' tab. Following ia an example JSON dictionary to execute above command through this Smart Connector 

```
{ "greatspn_module_name" :  [ "pinvar", "disab_lp" ], "model_name" :  [ "ranpoll1", "cycpoll" ] }

```
Note that the {{greatspn_module_names}} and {{model_names}} are the tag name defined in the 'run.sh_template'. These template tags are replaced by appropiate value passed in through JSON dictionary.


Configure, Create and Execute a GreatSPN Job
---------------------------------------------
'Create Job' tab in 'Chiminey Portal' lists 'greatspn' form for creation and submission of greatspn job. The 'greatspn' form requires definition of 'Compute Resource Name' and 'Storage Location'. Appropiate 'Compute Resource' and 'Storage Resource' need to be defined  through 'Settings' tab in the 'Chiminey portal'.

Payload Parameter Sweep
-----------------------
Payload parameter sweep for 'GreatSPN Smart Connector' in the Chiminey System may be performed by specifying appropiate JSON dictionary in 'Payload parameter sweep' field  of the 'greatspn' form. 

Following ia an example JSON dictionary to execute "pinvar", "disab_lp" modules of GreatSPN model-checker through this Smart Connector:
```
{ "greatspn_module_name" :  [ "pinvar", "disab_lp" ], "model_name" :  [ "ranpoll1", "cycpoll" ] }
```

Above would create four individual process. If maximum one cloud VMs  is allocated for the job - four GreatSPN tasks will be executed in the same VM, input fields in 'Cloud Compute Resource' form has to be:

```
Number of VM instances : 1
Minimum No. VMs : 1
```

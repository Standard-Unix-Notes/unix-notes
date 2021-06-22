# Managing Notebooks

## DEFAULT and USE notebook pointers

By default *notes* will use the notebook pointed to by the 'USE' 
symlink. 

Running the command *notes config* will display both the contents of 
the 'config' file and also where the USE and DEFAULT links are pointing 
to.

The DEFAULT notebook pointer is the notebook that notes will change the 
USE pointer to if no argument is supplied to the *notebook use* 
command.

This allows you to temporarily switch to another notebook easily:

```shell
$ notebook use work

... change the working notebook to 'work'

$ note add work project

... notes adds a note called 'work_project' to the 'work' notebook

$ notebook use

... notes switches back to the DEFAULT notebook pointer (initially 
'notes')

```


## Notebooks Commands

The *notes init* command creates your first notebook called *notes*. It 
also creates two pointers called 'DEFAULT' and 'USE'. Initially they 
will point to the initial notebook *notes*. 

If you want to use multiple notebooks you should create as many as you 
need using the *notebook add* command (see below). 

You should choose which one will be your main notebook and use 
*notebook default* to point DEFAULT to this notebook. You can then set 
the USE pointer (using *notebook use* command) to move between the 
notebooks each time you want to use a different notebook. You can 
return to your DEFAULT notebook at any time by issuing the *notebook 
use* without any notebook name.

Any note book names specified in either the command line OR when 
prompted (for rename and copy operations) will be scanned for spaces 
and then the spaces replaced with underscores. So if you enter 
*notebook add my new notebook* you will create 'my_new_notebook'.


### Sub-command default

This command is used to set the DEFAULT notebook.

```shell
$ notes default work notebook
```

This sets the DEFAULT notebook to 'work_notebook/' 


### Sub-command use

The 'USE' pointer points to the notebook currently in use. You can 
change this at any time by issuing the *notebook use* command:

```shell
$ notebook use work notebook
```

This command sets the current notebook to 'work_notebook'. All *notes* 
commands will then operate on this notebook.

To switch issue another *notebook use* command specifying the next 
notebook to use.

If you omit the notebook then *notebook* will set the 'USE' notebook to 
whatever the 'DEFAULT' notebook is set to allowing you to quick go back 
and forth between your DEFAULT notebook and any number of current 'USE' 
notebooks.


### Sub-command list | ls

This will list all of the notebooks that you have created together with 
the initial notebook *notes* created by *notes init*.


### Sub-command add | insert

You can have as many notebooks as you wish. To add a notebook simply 
issue the command:

```shell
$ notes add  work notebook
```

This command will create a new notebook 'work_notebook'. The current 
notebook will remain unchanged and you will need to issue the command 
*notebook use  work notebook* to switch to this notebook.


### Sub-command rename | mv

This sub-command is used to rename an existing notebook.

```shell
$ notebook rename  original notebook name
```

The notebook 'original_notebook_name.gpg' will be renamed. The user 
will be prompted to enter a new name for the notebook and the 
containing directory (relating to the notebook name) is renamed.


### Sub-command copy | cp

You may duplicate a notebook together with all the containing notes:

```shell
$ notebook copy original notebook
```

This command will copy 'original_notebook.gpg' to a new notebook. The 
user will be prompted for a new notebook name. All notes within the 
original notebook will be copied to the new notebook without decrypting 
the notes first.


### Sub-command delete | rm

To delete a specific notebook:

```shell
$ notebook rm  my work notes
```

This command will delete the notebook 'my_work_notes'. 


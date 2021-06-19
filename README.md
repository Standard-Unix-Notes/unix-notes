# Standard(?) Unix Notes

## Background
I have tried a number of different note systems over the years, from 
online notes to Vim-wiki and Org-Mode and even just plain old text files. 
All have their benefits and issues.   

More recently I have taken to GPG encrypting my notes in a process to 
improve my overall security and privacy.  

Whilst migrating my passwords into *Pass* the Standard Unix Password 
Manager I was intrigued by the simplicity and ease of use in adding, 
managing and using passwords under this system.  

Then this notes system started to brew in the back of my head. What if 
I replaced the password functionality of *pass* with a notes system. 
Sure I could include my notes into *pass* with it's multi-line ability. 
But as notes were added it would make accessing and managing my 
passwords more difficult. So I decided I really needed to keep my 
passwords and notes separate.      

I decided to take the *pass* shell script and gut it, rename the 
functions and implement a system to encrypt/decrypt notes.  

I use Yubikeys for my encryption and so have ensured that this script 
works with the Yubikey 5 NFC, Yubikey 4 and the Yubikey NEO.

## Features
 
- Secure encrypted notes
- Support for GPG resident keys on Yubikey and PIV cards
- Easily add, rename, copy and delete notes
- Import text files as notes directly into your working notebook
- Switch between notebooks easily 
- Multiple notebooks support. Easily add, rename, copy and delete notebooks 


## Licence

This application is licensed under the 3 clause BSD licence. See 
LICENCE for details.

## Contributing to the Project

Contributions are welcome. Please see CONTRIBUTING for details.

# Notes and Notebooks

This Notes system supports multiple notebooks. To manage your notes you 
simply use the *notes* command.  To manage your notebooks you use the 
notebook command.   


## Installing

The notes system can be installed from one of the following:

- *sudo make install* from a git clone or the release tarball
- *sudo dpkg -i unix-notes-(VER).deb* from the .deb package from the latest release

The installation will install a single Bourne shell script *notes* 
with another command *notebook* as a symbolic link to the *notes* 
shell script. In addition the *notes* system will install two man 
pages *notes(1)* and *notebook(1)* into your man pages directory.

Before using the system the system will need configuring.

If you do not have a GnuPG private key you should create one now before 
running the *notes init* command.


## Uninstalling

If you want to remove the *notes* system then you can perform one of 
the following actions:

- *sudo make uninstall* from either a git clone or the release tarball
- *sudo dpkg -r unix-notes-(VER).deb* from the .deb package from the 
latest release


## Setup and configuration

1. You should decide where you want to store your configuration file 
and your notebooks. To do this you must define either $XDG_DATA_DIR or 
$NOTESDIR in your environment. *Notes* will default to *~/.notes* if 
neither of these are defined.

2. You need to run the command *notes init* to initialise the system.

3. Finally, if you have more than one private key in your GPG keyring then 
*notes* selects the first one it finds. Check the 'config' file to see 
f this is the correct key. If it is not the key you wish to use, then 
you can issue the command *notes newkey KEYID* using the KEYID of the 
GnuPG key you wish to use.

### Config file and notebook storage

If you have **$XDG_DATA_DIR** defined in your environment then *notes* 
will create a .notes directory under $XDG_DATA_DIR and use this 
directory as it's home directory.

If $NOTESDIR is defined in your environment then *notes* will place all 
of its config and notebooks into that directory (This will override 
$XDG_DATA_DIR if that is defined).

If neither $XDG_DATA_DIR or $NOTESDIR is defined then the *notes* 
application will default to *~/.notes*

### Initial run *notes init*

The first thing you will want to do after deciding where you want to 
store your notes, notebooks and config file is to initialise the 
directories needed.

This can be done with a simple:

```shell
$ notes init
```

This will create the data directory if needed and the default 'notes' 
notebook. *Notes* will create two symlinks called 'DEFAULT' and 'USE' 
that point to the 'default' notebook and the 'currently using' 
notebook. Initially these will be pointing at the initial 'notes' 
notebook.


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


## Managing Notes

You manage your notes using the *notes* script. This script takes a 
number of sub-commands. If run without a sub-command then it will display 
a help screen showing the sub-commands available.

Any note names specified in either the command line OR when prompted 
(for rename and copy operations) will be scanned for spaces and then 
the spaces replaced with underscores. So if you enter *notes add my new 
note* you will create 'my_new_note'.  


### Sub-command config

Displays the 'config' file and also the DEFAULT and USE (current) 
notebooks.


### Sub-command newkey

The *notes* application will prompt for a new GPG KEYID to use. You may 
use either the full 40 character ID or the shorter 16 characters (the 
last 16 characters of the full KEYID).

After checking that the key is valid and that you have the private key 
on your keyring the application will process EVERY note in ALL 
notebooks.

The 'config' file will also be updated.

If you have your private key on a Yubikey then this will require the 
entering of your PIN number (which is cached).  

If you have enabled touch decryption protection then you will need to 
touch your Yubikey. With older Yubikey with firmware prior to 5.2.3 
this will mean you will need to touch the key for every file decrypted. 
With older Yubikeys you may wish to turn off the requirement for 
touching if you have a lot of notes.

```shell
$ ykman openpgp touch enc off
```

For newer Yubikeys with firmware 5.2.3 or later you can set a cached 
policy for touch.

```shell
$ ykman openpgp set-touch enc cached
```


### Sub-command add | insert

To add a note simply issue the command

```shell
$ notes add  note title here
```

This will create a new note with the filename 'note_title_here' and 
open your default editor ($EDITOR) to edit a the file. After saving and 
exiting the note will be encrypted with GnuPG using the key specified 
in the config file.


### Sub-command view | cat

To view a note you enter the command:

```shell
$ notes view  note title
```

This will decrypt the note 'note title.gpg' in the current notebook 
(see 'USE' pointer) with the private key specified in the 'config' 
file. GnuPG will output the decrypted note to the STDOUT.


### Sub-command edit|ed

To edit an encrypted note simply issue the command:

```shell
$ notes edit  note title 
```

*Notes* will decrypt the note titled 'note_title.gpg' into a temporary 
file and start your default editor ($EDITOR) to edit the note. After 
saving or quitting, *notes* will then encrypt the note again replacing 
the previous version and then delete the temporary file.


### Sub-command find

You can search all notes using the find command:

```shell
$ notes find licence plate
```

This command decrypts each file in turn to STDOUT and greps for 
"licence plate" in the output. 


### Sub-command delete | rm

To delete a note simply issue the command: 

```shell
$ notes delete  note title
```

This will delete the encrypted note named 'note title.gpg' from the 
current notebook.


### Sub-command list | ls 

To list what notes you have in the current notebook (USE) simply issue 
the command:  

```shell
$ notes list 
```

### Sub-command import

You can import files into your notebook:

```shell
$ notes import myfile.txt
```

This will import the file 'myfile.txt' into the current notebook as 
'myfile.txt.gpg'. 

KNOWN BUG:
Unlike other commands the 'import' sub-command currently has trouble 
retaining the full title of the note if the original filename being 
imported has a space in it. This is currently an issue with how the 
globing works. escaping the space with '\ ' or surrounding with quotes 
currently does not circumvent this issue. Until this bug is fixed I 
recommend that you either rename the file before you import to remove 
the space OR use the 'notes rename' to rename the note after importing.

#### Other file types

This supports all types of files but you may have later issues for 
files other than text based files or pdf files. This depends upon what 
applications you have that can support reading files from the STDIN. 
Alternatively you would have to redirect STDIN to a file to use the file.

Obviously certain sub-commands may not mean anything for non text files 
e.g. If you imported a .jpg file then you would need an image editor or 
viewer that will take STDIN as an input to pipe to.   

A good example here is pdf files. You can view pdf files piped into 
STDIN of the viewer zathura with: 

```shell
$ notes view  my secret note  | zathura -
```

However, you would not be able to edit the pdf file without exporting 
it to another file first.


### Sub-command copy | cp 

You can copy a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ notes copy original note file
```

This will copy the note 'original_note_file.gpg' to another note file. 
The user will be prompted for the name of the new note file. The 
original file is NOT decrypted in the process.


### Sub-command rename | mv

You can rename a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ notes rename original note file
```

This will rename the note 'original_note_file.gpg'. The user will be 
prompted for the new name for the new note file. Throughout the process 
the original file is NOT decrypted. 


## Managing Notebooks

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

# Using Yubikeys and PIV cards with Standard(?) Unix Notes

Notes will work with any encryption hardware that GnuPG supports. 
That includes recent Yubikeys and similar devices.

It is also planned to add the capability to use PIV cards (and 
therefore the PIV slots on the Yubikey) in a future release as this 
will require some switching within the functions to support two 
different commands for encryption and decryption.


## Yubikeys

GnuPG keys can be added to most recent Yubikeys. The Yubikey 5, Yubikey 
4 and Yubikey NEO ranges (both USB and USB-C) all can store a GnuPG 
key. 

Note here that The Yubikey 5 is faster than the others. The Yubikey 4 
does not support NFC. And the Yubikey NEO only supports RSA keys upto 
2048 bits and doesn't support the newer encryption algorithms but are 
still secure for basic encryption.

### Interaction with your Yubikey

As only the public key is used in the encryption the Yubikey is not 
needed for most operations EXCEPT where there is a decryption process 
(the 'add', 'edit', 'view' and 'newkey' sub-commands). Here the Yubikey 
will be asked for an interaction using a PIN entry and/or a touch 
depending on how you have setup the Yubikey.

The biggest pain point here in a large notebook is when you issue the 
'newkey' command as this will decrypt and encrypt every note in the 
notebook. If you have set the Yubikey up to require a PIN entry and a 
touch every time you decrypt then you will get irritated really quickly.

Typically the Yubikey pin entry process only requires the PIN to be 
entered every five minutes and will not prompt on every decryption. 

By default the GnuPG will not require a physical touch for a 
decryption. 

But if you have set it to require a physical touch then you will need 
to press the button for every decryption: when issuing the 'newkey' 
command the PIN entry will happen once (default behaviour) and the 
program will pause and the Yubikey will flash for a touch to decrypt 
each file. The flashing is the only indication that GnuPG is waiting 
for the Yubikey.   


#### Workaround for newer Yubikeys

If you have a newer Yubikey with a firmware of 5.2.3 or higher you can 
cache the button touch for 15 seconds.

To bypass this annoyance you can run the following command:

```shell
$ ykman openpgp set-touch enc cached
```

This will set the touch policy to cache touches for 15 seconds which 
should be enough time for most notebooks to be searched with only one 
touch.

Please note that you need YKMAN version 4 and above for this option to 
be available. Those working on Debian 10 based systems (BUSTER) will 
need to either get the repo from GitHub; install ykman from Debian 
TESTING or upgrade to Debian 11 when it becomes available.


### Recommended Yubikey guides 

We will not look at how to get your GnuPG keys onto the Yubikey here 
(see the DrDuh guide below, the GnuPG manual OR the support articles 
at Yubico.com).

A good guide for using Yubikeys with GnuPG can be found here:

> https://github.com/drduh/YubiKey-Guide

## PIV cards

Although the Yubikeys above support PIV credentials, encrypting and 
decrypting with a PIV credential requires the use of a different 
command for the encryption and decryption.

Currently the *notes* application at the initial release v1.0 only 
supports GnuPG encryption. I hope to include PIV based encryption keys 
in a future release by making the encryption and decryption code auto detect 
from the 'config' file.

Please let me know if you will find this useful.

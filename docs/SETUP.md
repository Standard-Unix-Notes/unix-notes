# Setup and configuration

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

## Config file and notebook storage

If you have **$XDG_DATA_DIR** defined in your environment then *notes* 
will create a .notes directory under $XDG_DATA_DIR and use this 
directory as it's home directory.

If $NOTESDIR is defined in your environment then *notes* will place all 
of its config and notebooks into that directory (This will override 
$XDG_DATA_DIR if that is defined).

If neither $XDG_DATA_DIR or $NOTESDIR is defined then the *notes* 
application will default to *~/.notes*

## Initial run *notes init*

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

If you use the command 

```shell
$ notes init git
```

Notes(1) will also setup the $NOTESDIR as a local git repository and 
will commit to the repo on every change.

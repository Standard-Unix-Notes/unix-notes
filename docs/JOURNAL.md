# Journalling

You manage your journal using the *journal* script. This script takes a 
number of sub-commands. If run without a sub-command then it will display 
a help screen showing the sub-commands available.

Journal(1) automatically selects today's date and year to work out which 
file it should open for editing.

Journal will use GNU shred(1) where available for deleting temporary files.

## Sub-command config

Displays the 'config' file, where the Jrouanl files are kept and also 
the DEFAULT and USE (current) notebooks.


## Sub-command newkey

The *journal* application will prompt for a new GPG KEYID to use. You may 
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
touching if you have a lot of journal.

```shell
$ ykman openpgp touch enc off
```

For newer Yubikeys with firmware 5.2.3 or later you can set a cached 
policy for touch.

```shell
$ ykman openpgp set-touch enc cached
```


## Sub-command add | insert

To add a note simply issue the command

```shell
$ journal add  
```

This opens the journal file for today for editing. It automatically adds 
a timestamp to the end of the file before editing in your favourite 
editor ($EDITOR). After editing the journal entry is encrypted again.

Each journal entry file is named with the date e.g. June_22.gpg and is 
placed in a subdirectory named after the year. 


## Sub-command view | cat

To view a note you enter the command:

```shell
$ journal view  [journal-entry]
```

This will decrypt a journal entry file and output it to STDOUT. If a 
journal entry file is specified on the command line then that is used 
instead of today's file.


## Sub-command edit | ed

To edit an encrypted note simply issue the command:

```shell
$ journal edit  [journal-entry] 
```

This will decrypt a journal entry file and open your editor ($EDITOR) to 
edit the journal file. Without a file specified on the command line, 
journal(1) will default to editing today's journal entry.

After editing the file is encrypted again.

## Sub-command find | search | grep

You can search all journal entries using the find command:

```shell
$ journal find licence plate
```

This command decrypts each journal entry file in turn to STDOUT and greps for 
"licence plate" in the output. 


## Sub-command delete | rm

To delete a journal entry simply issue the command: 

```shell
$ journal delete  journal-entry
```

This will delete the encrypted journal entry file.


## Sub-command list | ls | show

List journal entries for the specified year:

```shell
$ journal list  [YYYY] 
```

If no year [YYYY] is specified then journal(1) defaults to listing the 
entries from the current year.

## Sub-command import

You can import text files into your notebook:

```shell
$ journal import myfile.txt
```

This will import the file 'myfile.txt' into the end of today's journal 
file. 


## Sub-command copy | cp 

You can copy a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ journal copy journal-entry
```

Copy the journal entry file 'journal-entry' to another filename. 

The user will be prompted for the name of the new journal entry file. The 
original file is NOT decrypted in the process.


## Sub-command rename | mv

You can rename a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ journal rename  journal-entry
```

This will rename the journal entry file. The user will be prompted for 
the new name for the new journal entry file. Throughout the process the 
original file is NOT decrypted.


# Managing Notes

You manage your notes using the *notes* script. This script takes a 
number of sub-commands. If run without a sub-command then it will display 
a help screen showing the sub-commands available.

Any note names specified in either the command line OR when prompted 
(for rename and copy operations) will be scanned for spaces and then 
the spaces replaced with underscores. So if you enter *notes add my new 
note* you will create 'my_new_note'.  

If available *notes* will use GNU shred(1) to delete any temporary 
files. If unavailable it will default back to rm(1).

## Sub-command config

Displays the 'config' file and also the DEFAULT and USE (current) 
notebooks.


## Sub-command newkey

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


## Sub-command backup

Backup your notes and journal entries to a GPG encrypted tar file (in $HOME)

## Sub-command add | insert

To add a note simply issue the command

```shell
$ notes add  note title here
```

This will create a new note with the filename 'note_title_here' and 
open your default editor ($EDITOR) to edit a the file. After saving and 
exiting the note will be encrypted with GnuPG using the key specified 
in the config file.


## Sub-command view | cat

To view a note you enter the command:

```shell
$ notes view  note title
```

This will decrypt the note 'note title.gpg' in the current notebook 
(see 'USE' pointer) with the private key specified in the 'config' 
file. GnuPG will output the decrypted note to the STDOUT.


## Sub-command edit|ed

To edit an encrypted note simply issue the command:

```shell
$ notes edit  note title 
```

*Notes* will decrypt the note titled 'note_title.gpg' into a temporary 
file and start your default editor ($EDITOR) to edit the note. After 
saving or quitting, *notes* will then encrypt the note again replacing 
the previous version and then delete the temporary file.


## Sub-command find

You can search all notes using the find command:

```shell
$ notes find licence plate
```

This command decrypts each file in turn to STDOUT and greps for 
"licence plate" in the output. 


## Sub-command delete | rm

To delete a note simply issue the command: 

```shell
$ notes delete  note title
```

This will delete the encrypted note named 'note title.gpg' from the 
current notebook.


## Sub-command list | ls 

To list what notes you have in the current notebook (USE) simply issue 
the command:  

```shell
$ notes list 
```

## Sub-command import

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

### Other file types

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


## Sub-command copy | cp 

You can copy a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ notes copy original note file
```

This will copy the note 'original_note_file.gpg' to another note file. 
The user will be prompted for the name of the new note file. The 
original file is NOT decrypted in the process.


## Sub-command rename | mv

You can rename a note into another note file in the same notebook. Simply 
issue the command: 

```shell
$ notes rename original note file
```

This will rename the note 'original_note_file.gpg'. The user will be 
prompted for the new name for the new note file. Throughout the process 
the original file is NOT decrypted. 


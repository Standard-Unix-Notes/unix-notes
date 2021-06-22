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
- Bash Completion for sub commands and note/notebook names


## Licence

This application is licensed under the 3 clause BSD licence. See 
[LICENCE](LICENCE) for details.


## Contributing to the Project

Contributions are welcome. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## Notes and Notebooks

This Notes system supports multiple notebooks. 

- To manage your notes you simply use the *[notes](USING_NOTES.md)* command.
- To manage your notebooks you use the *[notebook](MANAGING_NOTEBOOKS.md)* command.


## Installing and Uninstalling

Adding or removing this software is easy. See [INSTALL.md](INSTALL.md) 
or [UNINSTALL.md](UNINSTALL.md) for details.


## Setup and configuration

After installation you need to setup the environment. Standard Unix 
Notes does this with environment variables and the *[notes 
init](USING_NOTES.md)* command.


## Managing Notes

The application manages notes in a similar way that Password-Store 
manages passwords. To add/edit/import/rename/copy/delete notes you use 
the appropriate sub-commands.

For example, to add a note you simply use 

```shell
$ notes add this is my note title
```

The *notes(1)* application automatically replaces spaces in the note title 
with underscores.

For full details of commands available see 
[USING_NOTES.md](USING_NOTES.md) for details or view the *notes(1)* man 
page.


## Changing GnuPG encryption keys

Encryption keys do not last forever. From time to time they expire or 
become unsafe for some reason. 

When you need to change the encryption key for a file you would normally 
decrypt and then re-encrypt it manually. Doing this for a series of 
files like you have in Notes would be a major pain. We have thought 
about this scenario and can automate it.

Notes has a special sub-command *newkey* to change the encryption keys 
of your notes. Using this command allows you to change the encryption 
keys for all of your notes at once rather than having to change them 
manually.

See [USING_NOTES.md](USING_NOTES.md) for details.


## Managing Notebooks

You can have multiple notebooks to organize your notes. Each notebook is 
just a plain UNIX directory and so could be managed by standard unix 
directory tools. 

But to make it easier we have provided a tool called *notebook* that has 
a series of subcommands for managing notebooks. See 
[MANAGING_NOTEBOOKS.md](MANAGING_NOTEBOOKS.md) for full details of the 
command and subcommands.


## Yubikey Integration

Standard Unix Notes supports GPG Keys on Yubikeys for GPG decryption. 
For more details see [YUBIKEYS.md](YUBIKEYS.md).


## PIV Integration

For more details on the proposed PIV integration see [PIV.md](PIV.md)

---

## RELEASE NOTES

See [RELEASE-NOTES.md](RELEASE-NOTES.md) for details.

## ROADMAP

See [ROADMAP.md](ROADMAP.md) for details.

## PACKAGING 

We currently package for the following:

- Source Tarball with makefile for installing 
- Debian .deb package suitable for Debian and Ubuntu based distributions

We are looking to package for other distributions depending on 
availability: see [PACKAGING.md](PACKAGING.md) for details.

## BUGS & SECURITY

See [SECURITY.md](SECURITY.md) for details on our security policy and 
[BUGS.md](BUGS.md) for reporting bugs.

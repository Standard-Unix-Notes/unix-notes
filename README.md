# Standard(?) Unix Notes

## Introduction
I have tried a number of different note systems over the years, from online notes to Vimwiki and OrgMode and even just plain old text files. All have their benefits and issues. 

More recently I have taken to GPG encrypting my notes in a process to improve my overall security and privacy. 
Whilst migrating my passwords into *Pass* the Standard Unix Password Manager I was intregued by the simplicity and ease of use in adding, managing and using passwords under this system.

Then this notes system started to brew in the back of my head. What if I replaced the password functionality of *pass* with a notes system. Sure I could include my notes into *pass* with it's multi-line ability. But as notes were added it would make accessing and managing my passwords more difficult. So I decided I really needed to keep my passwords and notes seperate. 

I decided to take the *pass* shell script and gut it, rename the functions and implement a system to encrypt/decrypt notes. 
## Features
 
- Secure encrypted notes
- Support for GPG resident keys on Yubikey and PIV cards
- Easily add, rename, copy and delete notes
- Import text files as notes directly into your working notebook
- Switch between notebooks easily 
- Multiple notebooks support. Easily add, rename, copy and delete notebooks

## Notes and Notebooks

This Notes system supports multiple notebooks. To manage your notes you simply use the *notes* command.  To manage your notebooks you use the notebook command.  




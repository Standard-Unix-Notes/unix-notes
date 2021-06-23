# Yubikeys

GnuPG keys can be added to most recent Yubikeys. The Yubikey 5, Yubikey 
4 and Yubikey NEO ranges (both USB and USB-C) all can store a GnuPG 
key. 

Note here that The Yubikey 5 is faster than the others. The Yubikey 4 
does not support NFC. And the Yubikey NEO only supports RSA keys upto 
2048 bits and doesn't support the newer encryption algorithms but are 
still secure for basic encryption.

## Interaction with your Yubikey

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


## Workaround for newer Yubikeys

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


## Recommended Yubikey guides 

We will not look at how to get your GnuPG keys onto the Yubikey here 
(see the DrDuh guide below, the GnuPG manual OR the support articles 
at Yubico.com).

A good guide for using Yubikeys with GnuPG can be found here:

> https://github.com/drduh/YubiKey-Guide


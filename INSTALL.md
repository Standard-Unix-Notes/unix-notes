# Installing Standard(?) Unix Notes

The installation will install a single Bourne shell script *notes* 
with another command *notebook* as a symbolic link to the *notes* 
shell script. In addition the *notes* system will install two man 
pages *notes(1)* and *notebook(1)* into your man pages directory.

Before using the system the system will need configuring.

If you do not have a GnuPG private key you should create one now before 
running the *notes init* command.

## Dependancies

Standard Unix Notes has the following dependancies:

- GnuPG version 2.0 or later
- SHA256 tools [Part of the coreutils package installed by default][1]

Optional Dependancies

- The shred command [Part of the coreutils in Linux, optional install in FreeBSD][1]


## Installing from Source Tarball

Standard Unix Notes supports ALL Unix and Unix-like operating systems 
including all the various BSD and Linux distributions.

The source tarball is available via a *git clone* or from a release. 

In the root directory of the tarball there is a makefile that has a 
script to install the application and man pages.

```shell
$ sudo make install
```

## Installing from Debian .pkg

For a given version VER run the following command in your Debian or 
Ubuntu based system:

```shell
$ sudo dpkg -i unix-notes-(VER).deb
```



PS.
See [UNINSTALL.md](UNINSTALL.md) for details on how to remove the application.

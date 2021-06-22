# Installing Standard(?) Unix Notes

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

PS.
See [UNINSTALL.md](UNINSTALL.md) for details on how to remove the application.

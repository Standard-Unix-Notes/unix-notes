
#			PACKAGING NOTES SCRIPT

We welcome contributions from others helping to package NOTES for 
different BSD/Linux distributions.


## CURRENTLY IMPLEMENTED

At of the timestamp of this file we have the following packaging 
systems implemented for the NOTES system:

- source tarball for use with 'sudo make install'
- Debian
- Ubuntu based systems should be able to use the Debian .deb package 


## CREATING PACKAGES FROM THE SOURCE TARBALL OR GIT CLONE

Each implemented packaging can be created from the source tarball or a 
git clone/download by changing directory to the appropriate 
distribution directory and running make. Obviously you should run the 
builds on the distribution the makefile is building for (Debian on 
Debian etc) unless your distribution includes the appropriate target OS 
packaging software.   

	DEBIAN / UBUNTU

	To create a Debian package from the source: 

	$ cd pkgs/debian
	$ make deb

	This will create a Debian .deb package and a *.sha256.txt file
	for the package. The .deb package and the .sha256.txt files
	will be created in the pkgs/debian directory.


## CURRENTLY PLANNED BY AUTHOR

I will be packaging for the following operating systems, based upon the 
OS I have easily available to me:

- FreeBSD


## OTHER PACKAGING DESIRED

We would love to see the scripts packaged for other operating systems 
including the following:

- Arch Linux 
- Manjaro Linux
- Fedora

We will incorporate packaging for any BSD/Linux that contributors would 
like to commit to building. 


## CONTRIBUTING TO PACKAGING

For ease of maintenance, packagers should create a sub directory under 
[repo]/pkgs named after the distribution (see pkgs/debian, pkgs/freebsd 
for example). 

Inside that directory there should be a makefile to create the package 
and all the appropriate files to create the distribution specific package 
file (.pkg, .deb, etc). 

It should be created in such a way that a simple 'make' in the folder 
to build the package according to the distribution requirements.

Please ensure that the package has the appropriate dependencies for end 
users. See the file DEPENDENCIES for details.


## CREATING A SOURCE TARBALL FROM THE MAIN SOURCE CODE DIRECTORY

If desired you can make a gzipped tarball of the distribution at the 
current HEAD of the repo by performing the following in the top 
directory of the source code:

$ make tarball

This will create a gzipped tarball 'unix-notes-(VERSION)-tar.gz' using 
the command 'git archive' command and also create a file 
'unix-notes-(VERSION)-sha256.txt' containing the SHA256 fingerprint of 
the tarball to help installation security.



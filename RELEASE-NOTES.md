#		     STANDARD(?) UNIX NOTES
	
#			RELEASE NOTES

1.8	
	- Added Bash completion 
	- fixes for SHA256 creation for FreeBSD sha256 
	  vs Linux sha256sum commands
	- A number of documentation corrections

1.6	
	- Fully expanded README.md giving base documentation
	- Search functionality added
	- Updated project documentation to markdown (excluding 
	  man pages)
	- makefiles now get $(VER) from GIT TAG
	- undocumented 'tree' subcommand (runs tree $NOTESDIR) 
          used in debugging features

1.0 	INITIAL RELEASE  
        - GPG encrypted notes, encrypt or view
        - add/delete/rename notes
        - multiple notebooks
        - add/delete/rename notebooks
        - re-encrypt with new GPG key
	- packaged in tarball
	- Debian .deb packaging

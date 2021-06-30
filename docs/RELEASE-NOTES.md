#		     STANDARD(?) UNIX NOTES
#			RELEASE NOTES

2.6
	- Added git support for notes, notebooks and the journal
	  (use 'notes init git' to setup)
	
2.5
	- Added spelling check to 'add' and 'edit' sub-commands
	- Added prompt in config commands for choice of spelling 
	  checker

2.4 
	- Added backup sub-command (creates GnuPG encrypted 
	  tarball in HOME)

2.3
	- Added GNU shred(1) for file deletion where available
	- fixed bug #26 (wrong extension for 'edit' -> .asc)

2.2
	- Migrated to ascii encoded notes. 
	- To migrate old files just run 'notes newkey <KEYID>' 
	  where  KEYID is your existing key from 'config'
	- Once you have checked that your old files have been 
	  converted you can use 
	  'find ~/.notes -name \*.gpg | xargs rm'   to delete

2.0 	
	- Added journal(1) for managing journals
	- documentation reorganisation
	- a number of minor fixes
	- changes to makefile package builds

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

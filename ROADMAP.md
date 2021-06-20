
			STANDARD(?) UNIX NOTES			
				
				ROADMAP

1.8 BASH COMPLETION and other changes
	- Bash completion added for sub commands and note/notebook names
    	- Documentation changes
	- Fixes for 'make tarball' to handle differences between Linux
	  sha256sum(1) and FreeBSD sha256(1) commands

1.6 EXPANDED FEATURES INCLUDING SEARCH
    	- Search through encrypted notes with grep (#19)
    	- Expanded documentation 
	- Added undocumented 'tree' subcommand for paging through 
	  the notes directory (#20)
	- Support for $NOTESDIR to override data store location (#16)
    	- Support for $XDG_DATA_DIR/.notes to store data (#15)
    	- Fixed bug with spaces in filenames (#2)

1.0 INITIAL RELEASE
	- GPG encrypted notes
	- add/delete/rename notes
	- multiple notebooks
	- add/delete/rename notebooks
	- re-encrypt with new GPG key
	- packaged as a tarball with SHA256 (#14)
    	- packaged as a .deb (#11)

IN NEXT RELEASE (IMPLEMENTED)

FUTURE FEATURES
	- dedicated diary/journal function
	- spell checking before encryption using aspell
	- multiuser encryption
	- different gpg keys per notebook
	- git integration
	- zsh completion
	- FreeBSD .PKG packaging
	- FreeBSD ports configuration
    	- shred functionality
    	- encrypted backup/restore
    	- PIV card support
    	- Issue #17 BUG - import truncates filename if spaces in filename

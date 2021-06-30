
			STANDARD(?) UNIX NOTES			
				
				ROADMAP

2.6 Added git support for notes(1), notebook(1) and journal(1)

2.5 Added spelling check to 'add' and 'edit' sub-commands

2.4 Added backup sub command

2.3 Use GNU shred(1) where available

2.2 Migrate to ascii encoded GPG files (see RELEASE-NOTES.md)

2.0 Journal functionality and other fixes 

	- Added journal(1) to the suite of scripts for managing your 
	  journal entries apart from your notes.
	- Reorganised documentation see 'docs' directory.
	- switched to ascii GPG encryption

1.8 BASH COMPLETION and other changes
	- Bash completion added for sub commands and note/notebook names
    	- Documentation changes
	- Fixes for 'make tarball' to handle differences between Linux
	  sha256sum(1) and FreeBSD sha256(1) commands

1.6 EXPANDED FEATURES INCLUDING SEARCH
    	- Search through encrypted notes with grep (#19)
    	- Expanded documentation 
	- Added undocumented 'tree' sub-command for paging through 
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
	- spell checking before encryption using aspell
	- multiuser encryption
	- different gpg keys per notebook
	- git integration
	- zsh completion
	- FreeBSD .PKG packaging
	- FreeBSD ports configuration
    	- PIV card support
    	- Issue #17 BUG - import truncates filename if spaces in filename

VER="`git tag | sort -rn | head -1 | tr -d 'v'`"
PKGBUILDDIR=unix-notes_$(VER)_all
BINDIR=usr/local/bin
PKGBINDIR=$(PKGBUILDDIR)/$(BINDIR)
MANPATH=usr/share/man/man1
PKGMANDIR=$(PKGBUILDDIR)/$(MANPATH)
PROGROOT=../..
DEBIAN=$(PKGBUILDDIR)/DEBIAN
BASHCOMPLETE="usr/share/bash-completion/completions"
PKGBASHCOMPLETE=$(PKGBUILDDIR)/$(BASHCOMPLETE)

## make help:                  Show help
help:
	@echo ""
	@echo Debian .deb packager makefile
	@echo ""
	@echo Please ensure that you have tagged the Git repo with the version
	@echo BEFORE you run 'make deb'
	@echo ""
	@sed -n s/^##//p makefile

var:
	@echo Git Tag (VER) = $(VER)
	@echo PKGBUILDIR = $(PKGBUILDDIR)
	@echo BINDIR = $(BINDIR)
	@echo PKGBINDIR = $(PKGBINDIR)
	@echo MANPATH = $(MANPATH)
	@echo PKGMANDIR = $(PKGMANDIR)
	@echo PROGROOT = $(PROGROOT)
	@echo PKGBASHCOMPLETE = $(PKGBASHCOMPLETE)

## make build:                 Build .DEB package
deb: clean prep build
	@echo Done.
## make clean:                 Clean up after package build
clean:
	-rm -rf $(PKGBUILDDIR) 

## make prep:                  Prepare environment for package build
prep:  clean
	-rm -rf $(PKGBUILDDIR)
	mkdir -p $(DEBIAN)
	mkdir -p $(PKGBINDIR)
	mkdir -p $(PKGMANDIR)
	mkdir -p $(PKGBASHCOMPLETE)
	sudo install -o root -m 755 $(PROGROOT)/notes $(PKGBINDIR)
	sudo install -o root -m 755 $(PROGROOT)/notebook $(PKGBINDIR)
	sudo install -o root -m 755 $(PROGROOT)/journal $(PKGBINDIR)
	sudo install -o root -m 644 $(PROGROOT)/docs/notes.1 $(PKGMANDIR)
	sudo install -o root -m 644 $(PROGROOT)/docs/notebook.1 $(PKGMANDIR)
	sudo install -o root -m 644 $(PROGROOT)/docs/journal.1 $(PKGMANDIR)
	sudo install -o root -m 644 $(PROGROOT)/bash/notes $(PKGBASHCOMPLETE)/notes
	sudo install -o root -m 644 $(PROGROOT)/bash/notebook $(PKGBASHCOMPLETE)/notebook
	sudo install -o root -m 644 $(PROGROOT)/bash/journal $(PKGBASHCOMPLETE)/journal
	install control $(DEBIAN)
	cd $(PKGBINDIR); ln -sf  notes notebook

## make build:                 Build .DEB package (VERSION calculated from GIT TAG)  
build: prep
	@echo building Debian package
	dpkg-deb --build $(PKGBUILDDIR)
	sha256sum  $(PKGBUILDDIR).deb | tee $(PKGBUILDDIR).deb.sha256.txt
	

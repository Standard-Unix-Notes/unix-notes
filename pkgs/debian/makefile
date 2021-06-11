
PROGNAME=unix-notes
VER=1.0
ARCH=all
PKGBUILDDIR=$(PROGNAME)_$(VER)_$(ARCH)
BINDIR=usr/local/bin
PKGBINDIR=$(PKGBUILDDIR)/$(BINDIR)
MANPATH=usr/share/man/man1
PKGMANDIR=$(PKGBUILDDIR)/$(MANPATH)
PROGROOT=../..
DEBIAN=$(PKGBUILDDIR)/DEBIAN

## make help:                  Show help
help:
	@sed -n s/^##//p makefile

var:
	@echo PROGNAME = $(PROGNAME)
	@echo VER = $(VER)
	@echo ARCH = $(ARCH)
	@echo PKGBUILDIR = $(PKGBUILDDIR)
	@echo BINDIR = $(BINDIR)
	@echo PKGBINDIR = $(PKGBINDIR)
	@echo MANPATH = $(MANPATH)
	@echo PKGMANDIR = $(PKGMANDIR)
	@echo PROGROOT = $(PROGROOT)

## make build:                 Build .DEB package
deb: clean prep build
	@echo Done.
## make clean:                 Clean up after package build
clean:
	-rm -rf $(PKGBUILDDIR) $(PKGBUILDDIR).deb $(PKGBUILDDIR).deb.sha256.txt

## make prep:                  Prepare environment for package build
prep:  clean
	-rm -rf $(PKGBUILDDIR)
	mkdir -p $(DEBIAN)
	mkdir -p $(PKGBINDIR)
	mkdir -p $(PKGMANDIR)
	sudo install -o root -m 755 $(PROGROOT)/notes $(PKGBINDIR)
	sudo install -o root -m 644 $(PROGROOT)/docs/notes.1 $(PKGMANDIR)
	sudo install -o root -m 644 $(PROGROOT)/docs/notebook.1 $(PKGMANDIR)
	install control $(DEBIAN)
	cd $(PKGBINDIR); ln -sf  notes notebook

## make build:                 Build .DEB package
build: prep
	@echo building Debian package
	dpkg-deb --build $(PKGBUILDDIR)
	sha256sum  $(PKGBUILDDIR).deb | tee $(PKGBUILDDIR).deb.sha256.txt
	

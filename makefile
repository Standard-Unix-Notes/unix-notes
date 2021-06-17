VER="`git tag | sort -rn | head -1 | tr -d 'v'`"
TARBALLLOC:=pkgs/tarball
PKGNAME:=unix-notes-$(VER)
TARBALL=$(PKGNAME)-tar
GZTARBALL=$(TARBALL).gz
SHATXT=$(PKGNAME)-sha256.txt

## make help                     Display help text
help:
	@echo ""
	@echo "Standard(?) Unix Notes"
	@echo ""
	@echo "GPG encrypted Notes system"
	@echo ""
	@echo Make now runs 'git tag' to work out the version for the tarball
	@echo ""
	@sed -n s/^##//p makefile

## make var                      Show makefile variables
var:
	@echo Latest Git tag {Version} = $(VER)
	@echo Tarball Location = $(TARBALLLOC)
	@echo Package Name = $(PKGNAME)
	@echo Tarball Name = $(TARBALL)
	@echo Gzipped Tarball = $(GZTARBALL)	
	@echo SHA text file = $(SHATXT)

## make install                  Install the Unix Notes application
install: manpages install_files

install_files:
	@echo do the install stuff
	sudo install -o root -m 755  notes /usr/local/bin/notes 
	sudo ln -sf /usr/local/bin/notes /usr/local/bin/notebook

manpages:
	@echo create the docs files to be installed
	gzip -c docs/notes.1  > tmp/notes.1.gz
	gzip -c docs/notebook.1  > tmp/notebook.1.gz
	sudo install -o root  -m 644 tmp/notes.1.gz /usr/share/man/man1
	sudo install -o root  -m 644 tmp/notebook.1.gz /usr/share/man/man1

clean: 
	@echo clean up after build
	-rm tmp/notes.1.gz
	-rm tmp/notebook.1.gz

## make uninstall                Uninstall the application
uninstall:
	@echo uninstall application
	-sudo rm -f /usr/share/man/man1/notes.1.gz
	-sudo rm -f /usr/share/man/man1/notebook.1.gz
	-sudo rm -f /usr/local/bin/notes
	-sudo rm -f /usr/local/bin/notebook

## make reinstall                Reinstall the application
reinstall:	uninstall install
	@echo reinstall application

## make tarball                  Package up into tarball
tarball:
	git archive v$(VER) -o $(TARBALL)
	gzip $(TARBALL)
	sha256 $(GZTARBALL) | tee $(SHATXT)
	mv $(GZTARBALL)  $(TARBALLLOC)
	mv $(SHATXT)  $(TARBALLLOC)

## make debian                   Create .deb
debian:
	make -C ./pkgs/debian  deb
	make -C ./pkgs/debian  clean



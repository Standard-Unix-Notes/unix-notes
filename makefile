VER="`git tag | sort -rn | head -1 | tr -d 'v'`"
TARBALLLOC:=pkgs/tarball
PKGNAME:=unix-notes-$(VER)
TARBALL=tmp/$(PKGNAME).tar
GZTARBALL=$(TARBALL).gz
SHATXT=tmp/$(PKGNAME).sha256.txt
OS="`uname`"

## make help                     Display help text
help:
	@echo ""
	@echo "Standard(?) Unix Notes"
	@echo ""
	@echo "GPG encrypted Notes & Journal system"
	@echo ""
	@echo Make now runs 'git tag' to work out the version for the tarball
	@echo ""
	@sed -n s/^##//p makefile

## make unit                     Run Unit Tests
unit:
	./unit-tests

## make ver                      Show version  tag
ver:
	@echo $(VER)

## make fix                      Create a fix versions and date in files c.f. git tag 
fix:
	@echo run \"fixversion fix\" to fix versions and dates to $(VER)

## make var                      Show makefile variables
var:
	@echo Latest Git tag {Version} = $(VER)
	@echo Operating System = $(OS)
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
	sudo install -o root -m 755 journal /usr/local/bin/journal
	sudo install -o root -m 644 bash/notes /usr/share/bash-completion/completions/notes
	sudo install -o root -m 644 bash/notebook /usr/share/bash-completion/completions/notebook
	sudo install -o root -m 644 bash/journal /usr/share/bash-completion/completions/journal

manpages:
	@echo create the docs files to be installed
	mkdir ./tmp
	gzip -c docs/notes.1  > tmp/notes.1.gz
	gzip -c docs/notebook.1  > tmp/notebook.1.gz
	gzip -c docs/journal.1 > tmp/journal.1.gz
	sudo install -o root  -m 644 tmp/notes.1.gz /usr/share/man/man1
	sudo install -o root  -m 644 tmp/notebook.1.gz /usr/share/man/man1
	sudo install -o root  -m 644 tmp/journal.1.gz  /usr/share/man/man1

clean: 
	@echo clean up after build
	-rm -rf tmp/*
	-rm -rf tests/*

## make uninstall                Uninstall the application
uninstall:
	@echo uninstall application
	-sudo rm -f /usr/share/man/man1/notes.1.gz
	-sudo rm -f /usr/share/man/man1/notebook.1.gz
	-sudo rm -f /usr/share/man/man1/journal.1.gz
	-sudo rm -f /usr/local/bin/notes
	-sudo rm -f /usr/local/bin/notebook
	-sudo rm -f /usr/local/bin/journal
	-sudo rm -f /usr/share/bash-completion/completions/notes
	-sudo rm -f /usr/share/bash-completion/completions/notebook
	-sudo rm -f /usr/share/bash-completion/completions/journal

## make reinstall                Reinstall the application
reinstall:	uninstall install
	@echo reinstall application

## make tarball                  Package up into tarball
tarball:
	git archive $(VER) -o $(TARBALL)
	gzip $(TARBALL)
	-test "$(OS)" = "Linux"  && sha256sum $(GZTARBALL) | tee $(SHATXT) 
	-test "$(OS)" = "FreeBSD"  && sha256 $(GZTARBALL) | tee $(SHATXT)
	mv $(GZTARBALL)  $(TARBALLLOC)
	mv $(SHATXT)  $(TARBALLLOC)

## make debian                   Create .deb
debian:
	make -C ./pkgs/debian  deb
	make -C ./pkgs/debian  clean



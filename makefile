## make help:			Display help text
help:
	@echo ""
	@echo "Standard(?) Unix Notes"
	@echo ""
	@echo "GPG encrypted Notes system"
	@echo ""
	@sed -n s/^##//p makefile
	@echo ""

## make install:			install the Unix Notes application
install: manpages install_files

install_files:
	@echo do the install stuff
	sudo install -o root -g root -m 755  notes /usr/local/bin/notes 
	sudo ln -s /usr/local/bin/notes /usr/local/bin/notebook

manpages:
	@echo create the docs files to be installed
	gzip -c docs/notes.1  > tmp/notes.1.gz
	gzip -c docs/notebook.1  > tmp/notebook.1.gz
	sudo install -o root -g root -m 644 tmp/notes.1.gz /usr/share/man/man1
	sudo install -o root -g root -m 644 tmp/notebook.1.gz /usr/share/man/man1

clean: 
	@echo clean up after build
	-rm tmp/notes.1.gz
	-rm tmp/notebook.1.gz

## make uninstall:		uninstall the application
uninstall:
	@echo uninstall application
	-sudo rm -f /usr/share/man/man1/notes.1.gz
	-sudo rm -f /usr/share/man/man1/notebook.1.gz
	-sudo rm -f /usr/local/bin/notes
	-sudo rm -f /usr/local/bin/notebook

## make reinstall:		reinstall the application
reinstall:	uninstall install
	@echo reinstall application

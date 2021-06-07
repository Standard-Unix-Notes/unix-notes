
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
install: docs install_files

install_file:
	@echo do the install stuff

docs:
	@echo create the docs files to be installed

clean: 
	@echo clean up after build

## make uninstall:		uninstall the application
uninstall:
	@echo uninstall application

## make reinstall:		reinstall the application
reinstall:	uninstall install
	@echo reinstall application

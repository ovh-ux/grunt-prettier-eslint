#### SYSTEM COMMAND ####
NODE=node
NPM=npm
GRUNT=grunt
GIT=git
CD=cd
ECHO=@echo
TAR=tar -zcvf
DEL=rm -rf
MAKE=make
MV=mv
RSYNC=rsync -av --delete --exclude=".git"

#### FOLDERS ####
NODE_DIR=node_modules
GRUNT_DEP=$(NODE_DIR)/grunt


#### MACRO ####
VERSION=`grep -Po '(?<="version": ")[^"]*' package.json`

#### OTHER ####
ifneq ($(strip $(bower_registry)),)
BOWER_PARAM=--config.registry=$(bower_registry)
endif


help:
	$(ECHO) "_____________________________"
	$(ECHO) "Current version is $(VERSION)"
	$(ECHO) "_____________________________"
	$(ECHO) " -- AVAILABLE TARGETS --"
	$(ECHO) "make clean                             => clean the sources"
	$(ECHO) "make install                           => install deps"
	$(ECHO) "make test                              => launch the tests"
	$(ECHO) "make version                           => get the current version"
	$(ECHO) "make build                             => build the project and generate build folder"
	$(ECHO) "make release type=patch|minor|major    => build the project, generate build folder, increment release and commit the source"
	$(ECHO) "_____________________________"

clean:
	$(DEL) $(NODE_DIR)

install:
	$(NPM) install

test:
	$(GRUNT) test

build:
	$(GRUNT)

version:
	$(ECHO) $(VERSION)

release: update-release build commit-release


#############
# Sub tasks #
#############

$(NODE_DIR)/%: install
	# DO NOT DELETE - this comment is needed because make does not process this step
	# if there's no task def; seems to be related to the % suffix.

clean-dist: $(GRUNT_DEP)
	$(GRUNT) clean

update-release: $(GRUNT_DEP)
	$(GRUNT) release --type=$(type)

commit-release: $(GRUNT_DEP)
	$(GRUNT) bump-commit

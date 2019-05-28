#
# $Id$
#
# @Copyright@
#
#                               Rocks(r)
#                        www.rocksclusters.org
#                        version 7.0 (Manzinita)
#
# Copyright (c) 2000 - 2017 The Regents of the University of California.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided
# with the distribution.
#
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement:
#
#       "This product includes software developed by the Rocks(r)
#       Cluster Group at the San Diego Supercomputer Center at the
#       University of California, San Diego and its contributors."
#
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of
# the associated name, interested parties should contact Technology
# Transfer & Intellectual Property Services, University of California,
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910,
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# @Copyright@
#

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk
.PHONY: $(SWIFTCLIENT_PACKAGES)


$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	( \
	  $(DESCRIBE_PKG); \
	) > $@


LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo "Apache" > $@

CACHE_DIR=$(REDHAT.ROOT)/cache

swiftclientdownload : $(SWIFTCLIENT_PACKAGES)
	for PYTHON_PACKAGE in $(SWIFTCLIENT_PKGS); do \
           echo "::: Downloading $(DL.SERVER)/$(DL.PATH)/$${PYTHON_PACKAGE} :::"; \
           if [ -f $${PYTHON_PACKAGE} ]; then \
                echo "::: $${PYTHON_PACKAGE} exists. Skipping... :::" ; \
           else \
                $(DL.CMD) $(DL.OPTS) $(DL.SERVER)/$(DL.PATH)/$${PYTHON_PACKAGE} ; \
                echo "::: Verifying size of $${PYTHON_PACKAGE} :::" ; \
                $(GREP.CMD) `$(STAT.CMD) --printf="%s" $${PYTHON_PACKAGE}` $(VERIFY.HASHES) ; \
                echo "::: Verifying hash of $${PYTHON_PACKAGE} :::" ; \
                $(GREP.CMD) `$(VERIFY.CMD) $(VERIFY.OPTS) $${PYTHON_PACKAGE} ` $(VERIFY.HASHES) ; \
                echo "" ; \
           fi; \
           echo "::: Unbundling $${PYTHON_PACKAGE} :::"; \
           $(TAR.CMD) $(TGZ.OPTS) $${PYTHON_PACKAGE}; \
           echo ""; \
        done


build: $(SRC_DIRS) swiftclientdownload
	@echo "::: Package $(NAME) build complete :::"
	
install:: $(SWIFTCLIENT_PACKAGES)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/lib/python2.7/site-packages
	$(PKGROOT_BIND_MOUNT)
	( \
          for PYTHON_DIR in $(SWIFTCLIENT_DIRS); do \
             cd $${PYTHON_DIR}; \
             export PYTHONPATH=$(PKGROOT)/lib/python$(PYVERSION)/site-packages; \
             python$(PYVERSION) setup.py build; \
	     python$(PYVERSION) setup.py install --prefix=$(PKGROOT); \
             cd ..; \
          done; \
          cd $(SOURCE_DIR); \
          export PYTHONPATH=$(PKGROOT)/lib/python$(PYVERSION)/site-packages; \
          python$(PYVERSION) setup.py build; \
	  python$(PYVERSION) setup.py install --prefix=$(PKGROOT); \
          files=`ls $(PKGROOT)/bin/*`; \
          for file in $$files;do \
             sed -i 's/\/bin\/python2.7/\/bin\/env python/' $$file; \
          done; \
	)
	$(PKGROOT_BIND_UMOUNT)
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf DESCRIPTION LICENSE $(SWIFTCLIENT_PACKAGES)

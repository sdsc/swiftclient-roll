ifndef ROLLPY
  ROLLPY = python
endif

ifndef PYVERSION
  PYVERSION = 2.7
endif

NAME           = sdsc-swiftclient_py$(PYVERSION)
VERSION        = 3.4.0
RELEASE        = 2
PKGROOT        = /opt/swiftclient

SRC_SUBDIR     = swiftclient

SOURCE_NAME    = python-swiftclient
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

SWIFTCLIENT_PACKAGES = setuptools-40.8.0 ipython-5.5.0 eggs-0.0.3 wcwidth-0.1.7 ptyprocess-0.6.0 ipython_genutils-0.2.0 jedi-0.13.2 prompt_toolkit-1.0.15 pathlib2-2.3.3 pexpect-4.6.0 pickleshare-0.7.5 decorator-4.3.0 parso-0.3.2 Pygments-2.3.1 backports.shutil_get_terminal_size-1.0.0 traitlets-4.3.2 backcall-0.1.0 Babel-2.5.0 certifi-2017.7.27.1 debtcollector-1.17.0 futures-3.1.1 iso8601-0.1.12 keystoneauth1-3.2.0 monotonic-1.3 netaddr-0.7.19 oslo.config-4.11.0 oslo.i18n-3.17.0 oslo.serialization-2.20.0 oslo.utils-3.28.0 positional-1.2.1 python-keystoneclient-3.13.0 python-swiftclient-3.4.0 PyYAML-3.13 requests-2.8.0 rfc3986-1.1.0 six-1.11.0 stevedore-1.25.0 wrapt-1.10.11 pbr-5.1.3 enum34-1.1.6 prompt_toolkit-1.0.15 simplegeneric-0.8.1


$(SWIFTCLIENT_PACKAGES):
	$(eval PYTHON_PACKAGE  = $(shell echo $@| sed 's/-[[:digit:]][[:digit:]][[:digit:]][[:digit:]].[[:digit:]].[[:digit:]][[:digit:]].[[:digit:]]\+//g'|sed 's/-[[:digit:]][[:digit:]].[[:digit:]].[[:digit:]]\+//g'|sed 's/-[[:digit:]].[[:digit:]][[:digit:]].[[:digit:]]\+//g'|sed 's/-[[:digit:]].[[:digit:]].[[:digit:]]\+//g' |sed 's/-[[:digit:]].[[:digit:]]\+//g'))
	$(eval PYTHON_PACKAGE_VERSION  = $(shell echo $@ | sed 's/$(PYTHON_PACKAGE)-//'))
	$(eval UPPER = $(shell echo $(PYTHON_PACKAGE) |tr a-z A-Z))
	$(eval $(UPPER)_NAME  = $(PYTHON_PACKAGE))
	$(eval $(UPPER)_SUFFIX = tar.gz)
	$(eval $(UPPER)_VERSION = $(PYTHON_PACKAGE_VERSION))
	$(eval $(UPPER)_PKG = $($(UPPER)_NAME)-$($(UPPER)_VERSION).$($(UPPER)_SUFFIX))
	$(eval $(UPPER)_DIR = $($(UPPER)_PKG:%.$($(UPPER)_SUFFIX)=%))
	$(eval SWIFTCLIENT_PKGS  += $($(UPPER)_PKG))
	$(eval SWIFTCLIENT_DIRS  += $($(UPPER)_DIR))


TAR_GZ_PKGS: $(SWIFTCLIENT_PACKAGES)

TAR_GZ_PKGS     = $(SOURCE_PKG)

RPM.EXTRAS      = AutoReq:No\n%global _python_bytecompile_errors_terminate_build 0
RPM.PREFIX      = $(PKGROOT)

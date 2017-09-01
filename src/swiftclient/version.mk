ifndef ROLLPY
  ROLLPY = python
endif

ifndef PYVERSION
  PYVERSION = 2.6
endif

NAME           = sdsc-swiftclient_py$(PYVERSION)
VERSION        = 3.4.0
RELEASE        = 1
PKGROOT        = /opt/swiftclient

SRC_SUBDIR     = swiftclient

SOURCE_NAME    = python-swiftclient
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

KEYSTONECLIENT_NAME    = python-keystoneclient
KEYSTONECLIENT_SUFFIX  = tar.gz
KEYSTONECLIENT_VERSION = 3.13.0
KEYSTONECLIENT_PKG     = $(KEYSTONECLIENT_NAME)-$(KEYSTONECLIENT_VERSION).$(KEYSTONECLIENT_SUFFIX)
KEYSTONECLIENT_DIR     = $(KEYSTONECLIENT_PKG:%.$(KEYSTONECLIENT_SUFFIX)=%)

FUTURES_NAME    = futures
FUTURES_SUFFIX  = tar.gz
FUTURES_VERSION = 3.1.1
FUTURES_PKG     = $(FUTURES_NAME)-$(FUTURES_VERSION).$(FUTURES_SUFFIX)
FUTURES_DIR     = $(FUTURES_PKG:%.$(FUTURES_SUFFIX)=%)

REQUESTS_NAME    = requests
REQUESTS_SUFFIX  = tar.gz
REQUESTS_VERSION = 2.8.0
REQUESTS_PKG     = $(REQUESTS_NAME)-$(REQUESTS_VERSION).$(REQUESTS_SUFFIX)
REQUESTS_DIR     = $(REQUESTS_PKG:%.$(REQUESTS_SUFFIX)=%)

STEVEDORE_NAME    = stevedore
STEVEDORE_SUFFIX  = tar.gz
STEVEDORE_VERSION = 1.25.0
STEVEDORE_PKG     = $(STEVEDORE_NAME)-$(STEVEDORE_VERSION).$(STEVEDORE_SUFFIX)
STEVEDORE_DIR     = $(STEVEDORE_PKG:%.$(STEVEDORE_SUFFIX)=%)

POSITIONAL_NAME    = positional
POSITIONAL_SUFFIX  = tar.gz
POSITIONAL_VERSION = 1.2.1
POSITIONAL_PKG     = $(POSITIONAL_NAME)-$(POSITIONAL_VERSION).$(POSITIONAL_SUFFIX)
POSITIONAL_DIR     = $(POSITIONAL_PKG:%.$(POSITIONAL_SUFFIX)=%)

OSLO.CONFIG_NAME    = oslo.config
OSLO.CONFIG_SUFFIX  = tar.gz
OSLO.CONFIG_VERSION = 4.11.0
OSLO.CONFIG_PKG     = $(OSLO.CONFIG_NAME)-$(OSLO.CONFIG_VERSION).$(OSLO.CONFIG_SUFFIX)
OSLO.CONFIG_DIR     = $(OSLO.CONFIG_PKG:%.$(OSLO.CONFIG_SUFFIX)=%)


KEYSTONEAUTH1_NAME    = keystoneauth1
KEYSTONEAUTH1_SUFFIX  = tar.gz
KEYSTONEAUTH1_VERSION = 3.2.0
KEYSTONEAUTH1_PKG     = $(KEYSTONEAUTH1_NAME)-$(KEYSTONEAUTH1_VERSION).$(KEYSTONEAUTH1_SUFFIX)
KEYSTONEAUTH1_DIR     = $(KEYSTONEAUTH1_PKG:%.$(KEYSTONEAUTH1_SUFFIX)=%)

DEBTCOLLECTOR_NAME    = debtcollector
DEBTCOLLECTOR_SUFFIX  = tar.gz
DEBTCOLLECTOR_VERSION = 1.17.0
DEBTCOLLECTOR_PKG     = $(DEBTCOLLECTOR_NAME)-$(DEBTCOLLECTOR_VERSION).$(DEBTCOLLECTOR_SUFFIX)
DEBTCOLLECTOR_DIR     = $(DEBTCOLLECTOR_PKG:%.$(DEBTCOLLECTOR_SUFFIX)=%)

OSLO.UTILS_NAME    = oslo.utils
OSLO.UTILS_SUFFIX  = tar.gz
OSLO.UTILS_VERSION = 3.28.0
OSLO.UTILS_PKG     = $(OSLO.UTILS_NAME)-$(OSLO.UTILS_VERSION).$(OSLO.UTILS_SUFFIX)
OSLO.UTILS_DIR     = $(OSLO.UTILS_PKG:%.$(OSLO.UTILS_SUFFIX)=%)

OSLO.SERIALIZATION_NAME    = oslo.serialization
OSLO.SERIALIZATION_SUFFIX  = tar.gz
OSLO.SERIALIZATION_VERSION = 2.20.0
OSLO.SERIALIZATION_PKG     = $(OSLO.SERIALIZATION_NAME)-$(OSLO.SERIALIZATION_VERSION).$(OSLO.SERIALIZATION_SUFFIX)
OSLO.SERIALIZATION_DIR     = $(OSLO.SERIALIZATION_PKG:%.$(OSLO.SERIALIZATION_SUFFIX)=%)

OSLO.I18N_NAME    = oslo.i18n
OSLO.I18N_SUFFIX  = tar.gz
OSLO.I18N_VERSION = 3.17.0
OSLO.I18N_PKG     = $(OSLO.I18N_NAME)-$(OSLO.I18N_VERSION).$(OSLO.I18N_SUFFIX)
OSLO.I18N_DIR     = $(OSLO.I18N_PKG:%.$(OSLO.I18N_SUFFIX)=%)

BABEL_NAME    = Babel
BABEL_SUFFIX  = tar.gz
BABEL_VERSION = 2.5.0
BABEL_PKG     = $(BABEL_NAME)-$(BABEL_VERSION).$(BABEL_SUFFIX)
BABEL_DIR     = $(BABEL_PKG:%.$(BABEL_SUFFIX)=%)

WRAPT_NAME    = wrapt
WRAPT_SUFFIX  = tar.gz
WRAPT_VERSION = 1.10.11
WRAPT_PKG     = $(WRAPT_NAME)-$(WRAPT_VERSION).$(WRAPT_SUFFIX)
WRAPT_DIR     = $(WRAPT_PKG:%.$(WRAPT_SUFFIX)=%)

ISO8601_NAME    = iso8601
ISO8601_SUFFIX  = tar.gz
ISO8601_VERSION = 0.1.12
ISO8601_PKG     = $(ISO8601_NAME)-$(ISO8601_VERSION).$(ISO8601_SUFFIX)
ISO8601_DIR     = $(ISO8601_PKG:%.$(ISO8601_SUFFIX)=%)

MONOTONIC_NAME    = monotonic
MONOTONIC_SUFFIX  = tar.gz
MONOTONIC_VERSION = 1.3
MONOTONIC_PKG     = $(MONOTONIC_NAME)-$(MONOTONIC_VERSION).$(MONOTONIC_SUFFIX)
MONOTONIC_DIR     = $(MONOTONIC_PKG:%.$(MONOTONIC_SUFFIX)=%)

NETADDR_NAME    = netaddr
NETADDR_SUFFIX  = tar.gz
NETADDR_VERSION = 0.7.19
NETADDR_PKG     = $(NETADDR_NAME)-$(NETADDR_VERSION).$(NETADDR_SUFFIX)
NETADDR_DIR     = $(NETADDR_PKG:%.$(NETADDR_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG) $(KEYSTONECLIENT_PKG) $(FUTURES_PKG) $(REQUESTS_PKG) $(STEVEDORE_PKG) $(POSITIONAL_PKG) $(OSLO.CONFIG_PKG) $(KEYSTONEAUTH1_PKG) $(DEBTCOLLECTOR_PKG) $(OSLO.UTILS_PKG) $(OSLO.SERIALIZATION_PKG) $(OSLO.I18N_PKG) $(BABEL_PKG) $(WRAPT_PKG) $(ISO8601_PKG) $(MONOTONIC_PKG) $(NETADDR_PKG)

RPM.EXTRAS     = AutoReq:No

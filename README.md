# SDSC "swiftclient" roll

## Overview

This roll bundles... swiftclient

For more information about the various packages included in the swiftclient roll please visit their official web pages:

- <a href="https://pypi.python.org/pypi/python-swiftclient" target="_blank"></a> is .


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate swiftclient source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler and mpi
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The scipy roll must be installed in order to access the python requests module


## Building

To build the swiftclient-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `swiftclient-*.disk1.iso`.  If you built
the roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


The roll supports specifying building with/for python versions other than
the one included with the o/s.  To use this feature, specify a `ROLLPY` make
variable that includes a space-delimited list of python modulefiles, e.g.,

```shell
% make ROLLPY=opt-python 2>&1 | tee build.log
```


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll swiftclient
% cd /export/rocks/install
% rocks create distro
% rocks run roll swiftclient | bash
```
 
In addition to the software itself, the roll installs swiftclient environment
module files in:

```shell
/opt/modulefiles/applications/swiftclient
```


## Testing

The swiftclient-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/swiftclient.t 
```


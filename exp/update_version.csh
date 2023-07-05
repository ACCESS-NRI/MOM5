#!/usr/bin/env csh

set root          = $cwd:h                            # The directory you created when you checkout
set code_dir      = $root/src                         # source code directory

# Set up the version string
set version='2023.06.001'

# The version of an executable can be found with the following command:
# strings <executable> | grep 'MOM_VERSION='
sed -e "s/{MOM_VERSION}/$version/g" $code_dir/version/version.F90.template > $code_dir/version/version.F90

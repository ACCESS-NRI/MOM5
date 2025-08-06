[![Build](https://github.com/ACCESS-NRI/MOM5/actions/workflows/ci.yml/badge.svg)](https://github.com/ACCESS-NRI/MOM5/actions/workflows/ci.yml)
[![Scheduled Build](https://github.com/ACCESS-NRI/MOM5/actions/workflows/scheduled.yml/badge.svg)](https://github.com/ACCESS-NRI/MOM5/actions/workflows/scheduled.yml)

# ACCESS-NRI Fork of Modular Ocean Model version 5 (MOM5)

This is the [ACCESS-NRI](https://www.access-nri.org.au) fork of the MOM5 Ocean Model.

The canonical MOM5 repository is here:

https://github.com/mom-ocean/MOM5

## ACCESS-NRI Fork Management

ACCESS-NRI maintains a MOM5 fork to enable and manage Continuous Integration testing and
release management for ACCESS-NRI support models. It is not envisaged that the code-base will diverge, so there is a process required to keep this fork up to date with changes in the canonical upsteam MOM5 repository.

The canonical MOM5 repository is tracked via the [upstream/master branch](https://github.com/ACCESS-NRI/MOM5/tree/upstream/master). 

To incorporate changes from the upstream MOM5 repository 
1. [sync the `upstream/master` branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork)
1. make a pull request to `master` from `upstream/master`
1. Review and fix any conflicts and then merge the PR


From the upsteam repository:

-----------

# The Modular Ocean Model

MOM is a numerical ocean model based on the hydrostatic primitive equations. Development of the model is managed through this Github site.

Contributions from users and developers are always welcomed. Any questions should be directed to the [mailing list](https://groups.google.com/forum/#!forum/mom-users).

To get started with MOM please consult the [quickstart guide](https://mom-ocean.github.io/docs/quick-start-guide/). More information can be found in the [online documentation](https://mom-ocean.github.io/)


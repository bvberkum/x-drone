x-drone
=======
Testbed for Drone CI pipelines

Issues
------
- Docker requires client/server API version to match. The cloud provider has
  1.24 server, but the drone images in the app stacks it deploys use 1.26 API
  from the latest Docker.

  Result: <https://github.com/drone/drone/issues/2048>
  ::

    ERROR: Error response from daemon: client is newer than server (client API
    version: 1.26, server API version: 1.24)

  Need to adjust either the image or the env reported version of Drone
  to match Docker 1.12 iso 1.13.0.
  <https://docs.docker.com/engine/api/v1.26/#section/Versioning>

  Probable solution, define custom stacks (kontena.io; x-kontena-stacks_), then
  get back to testing Drone.


.. _x-kontena-stacks: //github.com/bvberkum/x-kontena-stacks

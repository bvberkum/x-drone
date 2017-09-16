x-drone
=======
Testbed for Drone CI pipelines

Issues
------
- Docker requires client/server API version to match. The cloud provider has
  1.24 server, but the drone images in the app stacks it deploys have 1.26 API.
  Result: <https://github.com/drone/drone/issues/2048>


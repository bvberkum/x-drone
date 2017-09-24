x-drone
=======
Testbed for Drone CI pipelines


build-1, test-1, publish-1 (`freyr/acme`_\ :build-1)
  - Considering the authorisation issue with server-less ``drone exec`` and ``plugins/docker``.
    It does work with some docker post-scripting, but the login is manual. Not gotten it to work from env or secret files.

build-2, test-2, publish-2 (`freyr/acme`_\ :build-2)
  - Considering the drone containers themselves. Interestingly, there is some stuff going on under the hood.
  
    It looks like the entire script (the commands list of the previous pipeline step) is still embedded in the image.
    Restarting the step with our own entrypoint and command (and maybe workdir) fixes it up.


.. _`freyr/acme`: https://hub.docker.com/r/freyr/acme


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


- Using drone-cli for local builds::

    drone exec

  Works ok, but without server no secrets. So no matter what I tried, the ``plugins/docker`` image will not push to the docker hub registry.
 
  Besides, my use-case is committing the drone container. While the plugin is geared to building a dockerfile for the registry, which makes it another project.
  Howevever, the local ``drone exec`` I have now leaves well defined containers like `drone_step_0`. I wonder what it does on concurrent builds though.


.. _x-kontena-stacks: //github.com/bvberkum/x-kontena-stacks

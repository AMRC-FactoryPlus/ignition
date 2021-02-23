# Install Ignition on Central Server
Ignition is the `Primary Application` for the Factory+ architecture.

### Modules
Ensure that you place `MQTT-Recorder-signed.modl` and `MQTT-Engine-signed.modl` into the `ignition-modules` folder before deploying. These can be found from the Inductive Automation website.

### Mounted Volumes
Mounted volumes allow the container to persist data between restarts and are effectively a symbolic link to a path on the host OS. For the Ignition stack, we persist a number of volumes:

```yaml=
services:
  gateway:
    volumes:
      - gateway_data:/var/lib/ignition/data
      - /ignition-modules:/modules
      - gateway_db_drivers:/var/lib/ignition/user-lib/jdbc

volumes:
  gateway_data:
  gateway_db_drivers:
```

The first block of mappings tells the container where to mount the volumes internally so for the `- /ignition-modules:/modules` entry, we're telling the container to mount whatever is in the `/ignition-modules` directory on the host OS to the `/modules` directory when the container starts. This has the effect of loading 3rd party modules as per the Ignition Docker container [readme](https://hub.docker.com/r/kcollins/ignition).

In addition to directly mapping folders, it is possible to define `Docker Volumes` (more [here](https://docs.docker.com/storage/volumes/)). In the `docker-compose` file for Ignition above, we map three volumes to the container.

* **gateway_data** stores all configuration about the Ignition instance. If this volume was deleted the Ignition instance would be reset to 'factory defaults'.
* **gateway_db_drivers** stores the `mySQL` database drivers that are required to forward incoming data to the SQL database.

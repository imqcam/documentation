(dms-install)=
# Installing

The HTMDEC Data Management System (DMS) can be deployed on a single node or
multi-node Docker Swarm cluster. These instructions describe how to deploy the
system on a single-node system.

## Prerequisites
* Linux-based OS (currently deployed on RHEL 8.6, Ubuntu 22.04)
* Docker 17.04+ with Swarm mode enabled (see the [official Docker documentation](https://docs.docker.com/engine/install/))
* Registered Globus Auth application (see the [Globus documentation](https://docs.globus.org/api/auth/developer-guide/#register-app))
* Registered ORCID application (see the [ORCID documentation](https://info.orcid.org/documentation/integration-guide/registering-a-public-api-client/))
* Wildcard DNS with TLS termination

## Setup

Install prerequisites (Ubuntu):
```
apt-get install -y jq make davfs2 fuse libfuse-dev python3
pip install requests
```

Initialize Docker Swarm
```
docker swarm init
```

Add default user (1000) and group (100), if not present:
```
[[ -z $(getent group 100) ]] && sudo groupadd -g 100 wtgroup
[[ -z $(getent passwd 1000) ]] && sudo useradd -g 100 -u 1000 wtuser
```

Export Globus Oauth ID and secret:
```
export GLOBUS_CLIENT_ID=<client ID>
export GLOBUS_CLIENT_SECRET=<client secret>
```

Export ORCID ID and secret:
```
export ORCID_CLIENT_ID=<client ID>
export ORCID_CLIENT_SECRET=<client secret>
```

Clone the single-node deployment repository:

```
https://github.com/htmdec/deploy-htmdec
cd deploy-htmdec
```

Create the `traefik/acme` directory and install your SSL certificate:
```
mkdir traefik/acme
sudo chown root:root traefik/acme/acme.json
sudo chmod 0600 traefik/acme/acme.json
```

Bootstrap the DMS:
```
make dev
```

This will create the DMS instance with default settings.

To confirm things are working, all `REPLICAS` should show `1/1`
```
$ docker service ls
docker service ls
ID             NAME                 MODE         REPLICAS   IMAGE                                     PORTS
7xp0kw7m9lit   wt_girder            replicated   1/1        htmdec/girder:latest
sbxtg5x3kg2c   wt_dashboard         replicated   1/1        htmdec/ngx-dashboard:latest
nrkpnsz6napb   wt_instance-errors   replicated   1/1        htmdec/custom-errors:latest
9io87zcvueiw   wt_logger            replicated   1/1        htmdec/instance_logger:latest
m20e6pg02ga3   wt_celery_worker     global       1/1        htmdec/gwvolman:latest
6d6ao3t7xe1y   wt_dhwebhook         replicated   1/1        htmdec/dockerhub_webhook:htmdecdocs
yq8gv0sj37xx   wt_docs              replicated   1/1        htmdec/htmdec-docs:latest
mzq2k3wl6cj0   wt_images            replicated   1/1        registry:2.8
kqxf61c80vxj   wt_mongo             replicated   1/1        mongo:3.2
arvkuwbv867p   wt_redis             replicated   1/1        redis:7-bullseye
nnpm0z6ltiln   wt_registry          replicated   1/1        registry:2.8
90pn3kxxsgqj   wt_traefik           replicated   1/1        traefik:v2.4                              *:80->80/tcp, *:443->443/tcp, *:8080->8080/tcp
```

You should now be able to open a browser to `https://data.<your-domain>` to access your running instance of the DMS.

Modifications
---------
Anytime you modify `docker-stack.yml`, you will need to run `make dev` to see those changes reflected in Docker.

Uninstall
---------

The following will remove all services and delete the Docker volume data:

```
make clean
```

# TRaSH Development Docker Container

This is a container designed to be used with the TRaSH-Guides repository.

## Requirements

- Docker
- Cloned Repository

## Installation

### Docker

You can either use a `docker run` command or `compose` to get the container going.

```yaml
version: "2.1"
services:
  mkdocs:
    container_name: mkdocs
    image: "ghcr.io/zakkarry/mkdocs:latest"
    ports:
      - "8000:8000/tcp"
    volumes:
      - "/path/to/Guides/repo:/docs"
    working_dir: "/docs"
```

or simply `docker run`

```bash
docker run --rm -it -p 8000:8000 -v /path/to/Guides/repo:/docs ghcr.io/zakkarry/mkdocs:latest
```

### UnRAID

If you are using UnRAID and want to add the container to your dashboard, you can use the following terminal command.

```bash
/usr/local/emhttp/plugins/dynamix.docker.manager/scripts/docker create --name='mkdocs' --net='bridge' -e HOST_OS="Unraid" -e HOST_CONTAINERNAME="mkdocs" -l net.unraid.docker.managed=dockerman -l net.unraid.docker.webui='http://[IP]:[PORT:8000]/' -l net.unraid.docker.icon='https://d33wubrfki0l68.cloudfront.net/89531c90d1028bfd3b6e7b6ecf2560adc603e684/e98d6/assets/images/tool-icons/mark-text.png' -p '8000:8000/tcp' -v '/mnt/user/appdata/mkdocs/Guides':'/docs':'rw' 'ghcr.io/zakkarry/mkdocs:latest'
```

- Add `--user 99:100` before the "ghcr.io" link if you want to have this run as `nobody`.
- **YOU WILL NOT BE ABLE TO EDIT THIS TEMPLATE. MAKE SURE YOU MODIFY YOUR PATHS IF NECESSARY.**
  - You can remove the container and run this command again if you make a mistake.

### Cloning the Repo

Finally, You will need to clone the repo into the mount for /docs (`/mnt/user/appdata/mkdocs` or your `/docs` mount) using the following commands.

```bash
cd /mnt/user/appdata/mkdocs
git clone https://github.com/TRaSH-Guides/Guides.git
```

The mount for `/docs` should lead directly into the Guides folder after you clone. `mkdocs.yml` should be directly in `/docs`.

## Notes

- This image uses an override for the `strict` setting in `mkdocs.yml` via CLI. This results in not failing to build on broken links.
- The default mkdocs server will be run on port `8000`

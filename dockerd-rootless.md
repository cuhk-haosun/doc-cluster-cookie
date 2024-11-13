```python

## install
lidingyang@h1:~$ dockerd-rootless-setuptool.sh install


## sucess install info

[INFO] systemd not detected, dockerd-rootless.sh needs to be started manually:

PATH=/usr/bin:/sbin:/usr/sbin:$PATH dockerd-rootless.sh

[INFO] Creating CLI context "rootless"
Successfully created context "rootless"
[INFO] Using CLI context "rootless"
Current context is now "rootless"

[INFO] Make sure the following environment variable(s) are set (or add them to ~/.bashrc):
# WARNING: systemd not found. You have to remove XDG_RUNTIME_DIR manually on every logout.
export XDG_RUNTIME_DIR=/pool/wang/lidingyang/.docker/run
export PATH=/usr/bin:$PATH

[INFO] Some applications may require the following environment variable too:
export DOCKER_HOST=unix:///pool/wang/lidingyang/.docker/run/docker.sock


## add three exports to local bashrc


# ref
https://docs.docker.com/engine/security/rootless/#install


# startup code run once
export XDG_RUNTIME_DIR=/pool/wang/lidingyang/.docker/run
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///pool/wang/lidingyang/.docker/run/docker.sock
PATH=/usr/bin:/sbin:/usr/sbin:$PATH dockerd-rootless.sh &

# example code
docker run -it --rm   -v ./fastq:/mnt/in   ghcr.io/cuhk-haosun/code-docker-fastqc:latest
docker pull ghcr.io/cuhk-haosun/code-docker-fastqc:latest
```
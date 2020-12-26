

## Problem
```docker run hello-world``` case ``` ... aufs ... ``` error.

## Solution
[link to stackoverflow](https://stackoverflow.com/questions/30248794/run-docker-in-ubuntu-live-disk)

- Appending
    - ```--storage-driver=devicemapper``` or
    - ```--storage-driver=overlay``` 
    
    to the ```/lib/systemd/system/docker.service```:

```
...
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --storage-driver=devicemapper
...
```

- sysetmctl daemon-reload
- systemctl start docker
- docker run hello-world

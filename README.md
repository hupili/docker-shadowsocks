# docker-shadowsocks-cloud

A quick wrap of [oddrationale/docker-shadowsocks](https://github.com/oddrationale/docker-shadowsocks)
for easier multiple configurations management using `docker-compose`

## Usage

Configuration:

* Copy `docker-compose.yml.sample` to `docker-compose.yml`
* Modify the configurations.

Operation:

* Start all: `docker-compose up` or `docker-compose up -d` (running in background)
* End all: `docker-compose down`

## Administration

### Incremental Adding SS Users

Add a service:

```
  ss5:
    image: hupili/shadowsocks
    build: .
    ports:
      - "1988:3000"
    environment:
      SS_SERVER: 0.0.0.0
      SS_PORT: 3000
      SS_PASSWORD: imwNuDbE77RryP
      SS_ENCRYPTION: aes-256-cfb
```

Usually you only need to modify:

* `ss5` -- an identifier the user that is easy to remember and use.
* `SS_PASSWORD: imwNuDbE77RryP` -- The password.
* `"1988:3000"` -- `1988` is the external port for the user.

`docker-compose up -d` will incrementally launch new containers.
This is more efficient that up/down all the containers after each modification.

```
%docker-compose up -d 
dockershadowsockscloud_ss1_1 is up-to-date
dockershadowsockscloud_ss4_1 is up-to-date
dockershadowsockscloud_ss2_1 is up-to-date
dockershadowsockscloud_ss3_1 is up-to-date
Creating dockershadowsockscloud_ss5_1
```

Verify that the new container is working.

```
%docker ps
CONTAINER ID        IMAGE                COMMAND                  CREATED              STATUS              PORTS                    NAMES
640ddf49efaf        hupili/shadowsocks   "/bin/sh -c '/usr/loc"   21 seconds ago       Up 19 seconds       0.0.0.0:1988->3000/tcp   dockershadowsockscloud_ss5_1
80892d1faf0a        hupili/shadowsocks   "/bin/sh -c '/usr/loc"   About a minute ago   Up About a minute   0.0.0.0:1987->3000/tcp   dockershadowsockscloud_ss4_1
a4d3db6c0677        hupili/shadowsocks   "/bin/sh -c '/usr/loc"   2 minutes ago        Up 2 minutes        0.0.0.0:1986->3000/tcp   dockershadowsockscloud_ss3_1
60916d997b39        hupili/shadowsocks   "/bin/sh -c '/usr/loc"   2 minutes ago        Up 2 minutes        0.0.0.0:1984->3000/tcp   dockershadowsockscloud_ss2_1
3c114f2b581e        hupili/shadowsocks   "/bin/sh -c '/usr/loc"   2 minutes ago        Up 2 minutes        0.0.0.0:1985->3000/tcp   dockershadowsockscloud_ss1_1
```

### Modify User Password or Port

Similar to above. Only the modified container will be recreated:

```
%docker-compose up -d
Recreating dockershadowsockscloud_ss5_1
dockershadowsockscloud_ss1_1 is up-to-date
dockershadowsockscloud_ss4_1 is up-to-date
dockershadowsockscloud_ss2_1 is up-to-date
dockershadowsockscloud_ss3_1 is up-to-date
```


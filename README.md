## Usage

```
docker run -d --restart=always --net=host --name otter_node -e MANAGER=ip:port -e NID=1 -e MaxMem=3000m -p 2088:2088 -p 9092:9092 -p 2090:2090 plain/otter_node
```

## Docker Image

```
docker pull plain/otter_node
```
[https://hub.docker.com/r/plain/otter_node/](https://hub.docker.com/r/plain/otter_node/)

Builds initially based on https://github.com/dusty-nv/jetson-containers (MIT license)

## Docker Default Runtime

To enable access to the CUDA compiler (nvcc) during `docker build` operations, add `"default-runtime": "nvidia"` to your `/etc/docker/daemon.json` configuration file before attempting to build the containers:

``` json
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },

    "default-runtime": "nvidia"
}
```

You will then want to restart the Docker service or reboot your system before proceeding.

## Building the Containers

To rebuild the containers from a Jetson device running [JetPack 4.4](https://developer.nvidia.com/embedded/jetpack) or newer, first clone this repo:


Before proceeding, make sure you have set your [Docker Default Runtime](#docker-default-runtime) to `nvidia` as shown above.

$ ./scripts/docker_build_origami.sh origami

Check the image tag created (should be r35.1.0-pth1.13-py3 but could differ depending on JetPack version) 

$ sudo docker images

Run the container:
$ sudo docker run -it --rm --runtime nvidia --network host l4t-origami:r35.1.0-pth1.13-py3

Then test with the following:
$ cd /YOLOX
$ python3 tools/demo.py image -n yolox-s -c yolox_s.pth --path assets/dog.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device gpu

To test with a RTSP video feed:
python3 tools/demo.py video -n yolox-s -c yolox_s.pth --path rtsp://{USER}:{PASSWORD}@{ADDRESS} --conf 0.25 --nms 0.45 --tsize 640 --save_result --device gpu


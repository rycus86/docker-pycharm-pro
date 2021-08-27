Docker container to run PyCharm Professional Edition (https://www.jetbrains.com/pycharm/)

### Usage

```
docker run --rm \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.PyCharm:/home/developer/.PyCharm \
  -v ~/.PyCharm.java:/home/developer/.java \
  -v ~/.PyCharm.py3:/usr/local/lib/python3.9 \
  -v ~/.PyCharm.share:/home/developer/.local/share/JetBrains \
  -v ~/Project:/home/developer/Project \
  --name pycharm-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
rycus86/pycharm-pro:latest
```
#### For Windows hosts (simplified):
```
docker.exe run --rm -d ^
        --name pycharm-pro ^
        -e DISPLAY=YOUR_IP_ADDRESS:0.0 ^
        -v %TEMP%\.X11-unix:/tmp/.X11-unix ^
        -v %USERPROFILE%\pycharm-docker:/home/developer ^
        -v %USERPROFILE%\pycharm-docker\python3.9:/usr/local/lib/python3.9 ^
        rycus86/pycharm-pro:latest

```

Docker Hub Page: https://hub.docker.com/r/rycus86/pycharm-pro/

### Notes

You'll still need a license to use the application!

The IDE will have access to Python 3 and to Git.
Project folders need to be mounted like `-v ~/Project:/home/developer/Project`.
The actual name can be anything - I used something random to be able to start multiple instances if needed.

To use `pip` either use the terminal in PyCharm or install from the terminal from inside the container like `docker exec -it pycharm-running bash` then install using **pip**.

To run container on Windows hosted machines you will need to have some X server installed and launched (e.g. Xming)
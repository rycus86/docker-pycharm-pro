FROM debian

LABEL maintainer "Viktor Adam <rycus86@gmail.com>"

ARG PYCHARM_VERSION=2022.2
ARG PYCHARM_BUILD=222.4167.4

RUN apt-get update && apt-get install --no-install-recommends -y \
  python3 python3-dev python3-setuptools python3-pip \
  gcc git openssh-client curl less \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash developer

ARG pycharm_source=https://download.jetbrains.com/python/pycharm-professional-${PYCHARM_BUILD}.tar.gz
ARG pycharm_local_dir=.PyCharm${PYCHARM_VERSION}

WORKDIR /opt/pycharm

RUN curl -fsSL $pycharm_source -o /opt/pycharm/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

USER developer
ENV HOME /home/developer

RUN mkdir /home/developer/.PyCharm \
  && ln -sf /home/developer/.PyCharm /home/developer/$pycharm_local_dir

CMD [ "/opt/pycharm/bin/pycharm.sh" ]

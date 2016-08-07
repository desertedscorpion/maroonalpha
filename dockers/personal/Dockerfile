FROM emorymerryman/cloud9:0.0.1
RUN \
    dnf update --assumeyes && \
    dnf install --assumeyes gnupg pass findutils && \
    echo -e "[dockerrepo]\nname=Docker Repository\nbaseurl=https://yum.dockerproject.org/repo/main/fedora/\$releasever/\nenabled=1\ngpgcheck=1\ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo && \
    dnf update --assumeyes && \
    dnf install --assumeyes docker-engine docker-compose bash-completion git-tools gitflow pass gnupg gnupg2 && \
    dnf update --assumeyes && \
    dnf clean all
VOLUME ["/root"]
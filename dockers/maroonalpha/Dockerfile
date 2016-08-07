FROM emorymerryman/cloud9:0.0.1
RUN \
    dnf update --assumeyes && \
    echo -e "[dockerrepo]\nname=Docker Repository\nbaseurl=https://yum.dockerproject.org/repo/main/fedora/\$releasever/\nenabled=1\ngpgcheck=1\ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo && \
    dnf update --assumeyes && \
    dnf install --assumeyes docker-engine && \
    dnf update --assumeyes && \
    dnf clean all
CMD ["--listen", "0.0.0.0", "-p", "8080", "--auth", "user:password", "-w", "/workspace/maroonalpha"]
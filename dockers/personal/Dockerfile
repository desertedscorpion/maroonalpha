FROM emorymerryman/cloud9:0.0.1
RUN \
    dnf update --assumeyes && \
    dnf install --assumeyes gnupg pass findutils && \
    dnf update --assumeyes && \
    dnf clean all
VOLUME ["/root"]
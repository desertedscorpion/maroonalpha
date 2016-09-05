FROM alpine:3.4
COPY ["setup.sh", "run.sh", "/usr/local/sbin/"]
RUN ["/bin/sh", "/usr/local/sbin/setup.sh"]
EXPOSE 22
ENTRYPOINT ["/bin/sh", "/usr/local/sbin/run.sh"]
CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
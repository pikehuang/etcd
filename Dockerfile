ARG ARCH=amd64
FROM --platform=linux/${ARCH} pike-gz.tencentcloudcr.com/dev/tencentos/tencentos4-microdnf:latest

ADD etcd /usr/local/bin/
ADD etcdctl /usr/local/bin/
ADD etcdutl /usr/local/bin/

WORKDIR /var/etcd/
WORKDIR /var/lib/etcd/

EXPOSE 2379 2380

# Define default command.
CMD ["/usr/local/bin/etcd"]

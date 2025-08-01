ARG ARCH=amd64
FROM --platform=linux/${ARCH} pike-gz.tencentcloudcr.com/dev/tencentos/tencentos4-microdnf:latest

ADD ./bin/etcd /usr/local/bin/
ADD ./bin/etcdctl /usr/local/bin/
ADD ./bin/etcdutl /usr/local/bin/

WORKDIR /var/etcd/
WORKDIR /var/lib/etcd/

EXPOSE 2379 2380

# Define default command.
CMD ["/usr/local/bin/etcd"]

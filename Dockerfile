FROM pike-gz.tencentcloudcr.com/dev/tencentos/tencentos4-microdnf:latest

COPY ./bin/etcd /usr/local/bin/
COPY ./bin/etcdctl /usr/local/bin/
COPY ./bin/etcdutl /usr/local/bin/

WORKDIR /var/etcd/
WORKDIR /var/lib/etcd/

EXPOSE 2379 2380

# Define default command.
CMD ["/usr/local/bin/etcd"]

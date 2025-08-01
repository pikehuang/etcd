# 阶段 1：构建（包含 Go 工具链）
FROM golang:1.22 AS builder

WORKDIR /app

# 复制 go.mod 和 go.sum（利用 Docker 缓存加速依赖下载）
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN make build

FROM pike-gz.tencentcloudcr.com/dev/tencentos/tencentos4-microdnf:latest

COPY --from=builder /app/bin/etcd /usr/local/bin/
COPY --from=builder /app/bin/etcdctl /usr/local/bin/
COPY --from=builder /app/bin/etcdutl /usr/local/bin/

WORKDIR /var/etcd/
WORKDIR /var/lib/etcd/

EXPOSE 2379 2380

# Define default command.
CMD ["/usr/local/bin/etcd"]

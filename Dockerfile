<<<<<<< HEAD
  # syntax=docker/dockerfile:1
# - FROM golang:1.21-alpine
FROM golang:1.21-alpine AS base
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .

FROM base AS build-client
RUN go build -o /bin/client ./cmd/client

FROM base AS build-server
RUN go build -o /bin/server ./cmd/server

FROM scratch
# - COPY --from=0 /bin/client /bin/server /bin/
COPY --from=build-client /bin/client /bin/
COPY --from=build-server /bin/server /bin/
ENTRYPOINT [ "/bin/server" ]
=======
FROM golang:1.21-alpine
WORKDIR /src
COPY . .
# -o /bin/client => output location executable
# ./cmd/client => path for Go pkg or dir containing source code
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]

# Dockerfile instruction is building 
# a Go application named "client" from the source code 
# located in "./cmd/client" directory
# and it places the resulting executable 
# in "/bin" directory within the Docker image.
>>>>>>> bceefc60212637406bea933aabd6db5efb0a3277

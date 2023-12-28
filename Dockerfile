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
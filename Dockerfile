FROM golang:1.16-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer='benedikt.langer@hotmail.com'


# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY go.mod .
COPY main.go .


# List items in the working directory (ls)
RUN [ "ls" ]

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o /myapp
RUN cp /myapp /usr/myapp

#Expose port 8888
EXPOSE 8080

# Run the service myapp when a container of this image is launched
CMD /usr/myapp

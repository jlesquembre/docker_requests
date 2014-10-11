
# Get current script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate docker image, run only once
#docker build --tag="requests" .


docker run --rm \
       -v $DIR/certs:/etc/nginx/ssl \
       requests openssl req -x509 -nodes -days 365 -newkey rsa:4096  -subj "/O=devpi" \
           -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -config /openssl/openssl.cnf

docker run --rm -v $DIR/certs:/etc/nginx/ssl -p 8080:80 -p 8081:443 requests

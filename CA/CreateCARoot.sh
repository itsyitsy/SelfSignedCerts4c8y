openssl req -x509 -new -nodes -extensions v3_ca -subj '/O=Software AG/C=DE/CN=ThinEdgeCA' -key ./CA/ca-key.pem -days 1024 -out ./CA/ca-root.pem -sha512

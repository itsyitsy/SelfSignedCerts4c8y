openssl x509 -req -in ./device/device-csr.csr -CA ./CA/ca-root.pem -CAkey ./CA/ca-key.pem -CAcreateserial -out ./device/device-pub.pem -days 365 -sha512

echo "Basic Certificate Setup for c8y Thin Edge"
echo "Creating CA Certificate"
./CA/CreateCACert.sh
echo "Creating CA Root Certificate"
./CA/CreateCARoot.sh
echo "Creating Device Key"
./device/CreateDeviceKey.sh
echo "Creating Device Certificate Signing Request"
./device/CreateDeviceCSR.sh
echo "Signing Certificate Signing Request with CA Certificate"
./CA/signCSR.sh
echo "Finished all Certificates! You can now use ./CA/ca-root.pem to upload to c8y and use ./device/device-pub.pem as your device certificate."

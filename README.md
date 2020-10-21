# autorest-docker
Dockerfile for autorest 3.x with the needed .NET Core dependencies

## Why another Dockerfile
Because the image  on dockerhub  [azuresdk/atuorest](https://hub.docker.com/r/azuresdk/autorest) is an old version that uses 2.x autorest running NodeJs 8.x.  
This is based on the same [Dockerfile](https://github.com/Azure/autorest/blob/master/Dockerfile), but with pinned 3.x autorest version, NodeJs 10.x and the needed .NET Core dependencies.  
The autorest package also doesn't work with Ubuntu20.04. So that's why the Dockerfile is based od 18.04 (bionic).

## Usage
`docker run -v $(pwd):/src/ chmodx/autorest --input-file=/src/spec/myspec.yaml --csharp --namespace=MyApp.MyNamespace --output-folder=/src/`  
This will mount the current folder inside the container as `/src/`, use the myspec.yaml file and generate the csharp classess in the same folder.

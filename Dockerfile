FROM ubuntu:bionic 

# Required for install
RUN apt-get update && apt-get install -y curl libunwind8 libicu60 \
# Copied from: https://github.com/dotnet/dotnet-docker/blob/master/src/runtime-deps/2.1/bionic/amd64/Dockerfile#L8 
libc6 \
libgcc1 \
libgssapi-krb5-2 \
libicu60 \
liblttng-ust0 \
libssl1.0.0 \
libstdc++6 \
zlib1g 

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
	apt-get update && apt-get install -y nodejs && \
	npm install npm@latest -g

# Instal latest 3.x.x autorest 
RUN npm install -g autorest@"<4.0.0"
RUN autorest --reset --allow-no-input --csharp --ruby --python --java --go --nodejs --typescript --azure-validator --preview

# Set the locale to UTF-8
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ENTRYPOINT ["autorest"]

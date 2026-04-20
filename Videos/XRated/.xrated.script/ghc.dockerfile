FROM haskell:9.14

MAINTAINER timeblink <timeblink@icloud.com>

#CMD [echo "compiler: ghc-9.14.1" | tee -a /root/.stack/global-project/stack.yaml]

VOLUME ["/workspace"]
WORKDIR /workspace

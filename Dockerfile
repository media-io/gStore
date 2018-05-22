FROM alpine:3.6

RUN apk add --no-cache \
	g++ \
	make \
	readline-dev \
	boost-dev \
	curl-dev \
	ncurses-dev \
	openjdk8 \
	bash \
	git

RUN git clone https://github.com/media-io/gStore.git

WORKDIR /gStore

RUN ln -s /usr/lib/libncurses.so /usr/lib/libtermcap.so

RUN export PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/bin && \
	make

CMD ./bin/ghttp lubm 9000

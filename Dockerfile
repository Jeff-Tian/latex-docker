FROM alpine:latest
ARG scheme=full

ENV PATH="/opt/texlive/texdir/bin/x86_64-linuxmusl:${PATH}"

COPY \
  LICENSE \
  README.md \
  setup.sh \
  texlive.profile \
  texlive_pgp_keys.asc \
  /

ENV LANG=C.UTF-8 \
  JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre \
  PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
  TZ=Asia/Shanghai
RUN echo "" > /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/v3.8/main/" >> /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories \
  && apk update && apk add --no-cache openjdk8-jre ca-certificates tzdata ttf-dejavu tini \
  && rm -rf /var/cache/apk/* \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN /setup.sh ${scheme}

CMD ["/bin/bash"]

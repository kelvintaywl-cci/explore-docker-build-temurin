FROM eclipse-temurin:11
ARG SDK_VERSION

RUN echo 'hosts: files dns' > /etc/nsswitch.conf
RUN echo $SDK_VERSION
RUN addgroup --system temu && adduser --system --ingroup temu temu
USER temu
RUN curl https://get.daml.com | sh -s $SDK_VERSION \
    && printf "auto-install: false\nupdate-check: never\n" >> /home/temu/.temu/temu-config.yaml

ENV PATH="/home/temu/.temu/bin:${PATH}"
WORKDIR /home/temu

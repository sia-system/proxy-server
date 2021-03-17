FROM envoyproxy/envoy-alpine:v1.17.1

EXPOSE 8080
EXPOSE 8443

RUN mkdir /var/log/envoy

COPY envoy-config-managed.yaml /etc/envoy/envoy-config-managed.yaml

RUN chmod o+w /dev/stdout
RUN chmod o+w /dev/stderr
RUN chmod o+w /var/log/envoy

CMD /usr/local/bin/envoy -c /etc/envoy/envoy-config-managed.yaml -l debug

FROM envoyproxy/envoy-alpine:v1.14.1

EXPOSE 8080
EXPOSE 8443

RUN mkdir /var/log/envoy

RUN adduser -u 1000 --disabled-password --no-create-home app_user
RUN chown 1000 /var/log/envoy

COPY envoy-config-managed.yaml /etc/envoy/envoy-config-managed.yaml
RUN chown 1000 /etc/envoy

USER app_user

CMD /usr/local/bin/envoy -c /etc/envoy/envoy-config-managed.yaml -l debug

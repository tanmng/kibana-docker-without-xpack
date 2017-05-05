FROM docker.elastic.co/kibana/kibana:5.1.1
RUN bin/kibana-plugin remove x-pack
ENV KIBANA_CONF_DIR /kibanaconf
USER root
RUN mkdir -p ${KIBANA_CONF_DIR}/ && \
    chown kibana:kibana ${KIBANA_CONF_DIR}
USER kibana
RUN touch ${KIBANA_CONF_DIR}/kibana.yml && \
    mv /usr/share/kibana/config/kibana.yml /usr/share/kibana/config/kibana.yml_original && \
    ln -s ${KIBANA_CONF_DIR}/kibana.yml /usr/share/kibana/config/kibana.yml


VOLUME ${KIBANA_CONF_DIR}


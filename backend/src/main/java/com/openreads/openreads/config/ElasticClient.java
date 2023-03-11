package com.openreads.openreads.config;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ElasticClient {
    ElasticsearchClient client;

    @Bean
    public ElasticsearchClient elasticsearchClient() {
        if (client == null) {
            RestClient restClient = RestClient.builder(
                    new HttpHost("localhost", 9200)).build();

            ElasticsearchTransport transport = new RestClientTransport(
                    restClient, new JacksonJsonpMapper());

            client = new ElasticsearchClient(transport);
        }
        return client;
    }
}

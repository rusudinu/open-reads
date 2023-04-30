import keycloakConfig from "./keycloak.config";

export const environment = {
    production: false,
    apiUrl: 'http://localhost:8080',
    keycloak: keycloakConfig,
};

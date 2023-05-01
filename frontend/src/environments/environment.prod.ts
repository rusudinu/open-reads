import keycloakConfig from "./keycloak.config";

export const environment = {
	production: true,
  apiUrl: 'http://localhost:8080',
  keycloak: keycloakConfig,
};

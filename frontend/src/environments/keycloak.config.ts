import { KeycloakConfig } from 'keycloak-js';

const keycloakConfig: KeycloakConfig = {
  url: 'http://localhost:9001',
  realm: 'open-reads',
  clientId: 'open-reads',
};

export default keycloakConfig;

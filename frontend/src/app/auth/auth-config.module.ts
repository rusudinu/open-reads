import {NgModule} from '@angular/core';
import {AuthModule} from 'angular-auth-oidc-client';

import {UnauthorizedComponent} from './unauthorized.component';
import {CallbackComponent} from './callback.component';
import {ForbiddenComponent} from './forbidden.component';
import {environment} from "../../environments/environment";

@NgModule({
  imports: [AuthModule.forRoot({
    config: {
      postLoginRoute: '/',
      forbiddenRoute: '/forbidden',
      unauthorizedRoute: '/unauthorized',
      authority: environment.keycloak.KEYCLOAK_URL,
      redirectUrl: `${window.location.origin}/callback`,
      postLogoutRedirectUri: window.location.origin,
      clientId: environment.keycloak.KEYCLOAK_CLIENT,
      scope: 'openid profile roles', // 'openid profile offline_access ' + your scopes
      responseType: 'code',
      silentRenew: true,
      silentRenewUrl: `${window.location.origin}/silent-renew.html`,
      renewTimeBeforeTokenExpiresInSeconds: 10,
      secureRoutes: [environment.apiUrl]
    }
  })],
  declarations: [
    UnauthorizedComponent,
    CallbackComponent,
    ForbiddenComponent
  ],
  exports: [AuthModule]
})
export class AuthConfigModule {
}

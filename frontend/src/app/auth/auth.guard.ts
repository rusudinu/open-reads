import {inject} from '@angular/core';
import {ActivatedRouteSnapshot, Router, RouterStateSnapshot} from '@angular/router';
import {OidcSecurityService} from 'angular-auth-oidc-client';

import {take} from 'rxjs';
import {map} from 'rxjs/operators';
import {AuthService} from './auth.service';

export const roleAndAuthGuard = (route: ActivatedRouteSnapshot, state: RouterStateSnapshot) => {
  const oidcSecurityService = inject(OidcSecurityService);
  const router = inject(Router);
  const authService = inject(AuthService);


  return oidcSecurityService.getAccessToken().pipe(
    take(1),
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    map(data => authService.parseJwt(data)['realm_access']['roles']),
    map(roles => {
      // eslint-disable-next-line @typescript-eslint/no-unsafe-call
      if (roles.includes('not_authenticated')) {
        authService.redirectToKeycloak(route.url.join(''));
        return false;
      }
      if (route.data['roles'] && route.data['roles'].every((role: any) => !roles.includes(role))) {
        router.navigate(['/forbidden']);
        return false;
      }
      return true;
    })
  );
};

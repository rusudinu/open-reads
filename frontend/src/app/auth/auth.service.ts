import {Injectable} from '@angular/core';
import {OidcSecurityService} from 'angular-auth-oidc-client';
import {Observable, take} from 'rxjs';
import {map} from 'rxjs/operators';
import {User} from "../../model/User";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../environments/environment";

@Injectable()
export class AuthService {
  constructor(
    private oidcSecurityService: OidcSecurityService,
    private httpClient: HttpClient
  ) {
  }

  parseJwt(token: string): any {
    if (!token) {
      return {
        realm_access: {
          roles: ['not_authenticated']
        }
      };
    }
    const base64Url = token.split('.')[1];
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    const jsonPayload = decodeURIComponent(window.atob(base64).split('').map(c => `%${(`00${c.charCodeAt(0).toString(16)}`).slice(-2)}`).join(''));
    return JSON.parse(jsonPayload);
  }

  currentUserHasAnyOneOfRolesFromRoles(requestedRoles: string[], userRoles: string[]): boolean {
    return requestedRoles.some(role => userRoles.includes(role));
  }

  getUserRoles(): Observable<string[]> {
    return this.oidcSecurityService.getAccessToken().pipe(
      take(1),
      // eslint-disable-next-line @typescript-eslint/no-unsafe-return
      map(data => this.parseJwt(data)['realm_access']['roles'])
    ) as Observable<string[]>;
  }

  redirectToKeycloak(redirectPath: string): void {
    localStorage.setItem('originalUrl', redirectPath);
    this.oidcSecurityService.authorize();
  }

  public getUser(): Observable<User> {
    return this.httpClient.get<User>(environment.apiUrl + "/profile/me");
  }
}

import { HttpClient } from "@angular/common/http";
import { Injectable } from '@angular/core';
import { KeycloakService } from 'keycloak-angular';
import { KeycloakProfile, KeycloakTokenParsed } from 'keycloak-js';
import { Observable } from "rxjs";
import { environment } from "../../../environments/environment";
import { User } from "../../../model/User";

@Injectable()
export class AuthService {

  constructor(private keycloakService: KeycloakService, private httpClient: HttpClient) {
  }

  public getLoggedUser(): KeycloakTokenParsed | undefined {
    try {
      return this.keycloakService.getKeycloakInstance()
        .idTokenParsed;
    } catch (e) {
      console.error("Exception", e);
      return undefined;
    }
  }

  public isLoggedIn(): Promise<boolean> {
    return this.keycloakService.isLoggedIn();
  }

  public loadUserProfile(): Promise<KeycloakProfile> {
    return this.keycloakService.loadUserProfile();
  }

  public login(): void {
    this.keycloakService.login().then(r => this.getUser());
  }

  public logout(): void {
    this.keycloakService.logout(window.location.origin);
  }

  public redirectToProfile(): void {
    this.keycloakService.getKeycloakInstance().accountManagement();
  }

  public getRoles(): string[] {
    return this.keycloakService.getUserRoles();
  }

  public getUser(): Observable<User> {
    return this.httpClient.get<User>(environment.apiUrl + "/profile/me");
  }
}

import { Component, OnInit } from '@angular/core';
import { OidcSecurityService } from 'angular-auth-oidc-client';
import { Router } from '@angular/router';

@Component({
    selector: 'app-unauthorized',
    template: '<button (click)="login()" >LOGIN</button>'
})
export class UnauthorizedComponent implements OnInit {
    constructor(private readonly oidcSecurityService: OidcSecurityService, private router: Router) {
    }

    login() {
        this.oidcSecurityService.authorize();
    }

    // eslint-disable-next-line consistent-return
    ngOnInit(): void {
        this.oidcSecurityService.authorize();
    }
}

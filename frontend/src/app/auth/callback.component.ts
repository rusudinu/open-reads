import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OidcSecurityService } from 'angular-auth-oidc-client';

@Component({
    selector: 'app-callback',
    template: 'Loading...'
})
export class CallbackComponent implements OnInit {
    constructor(public oidcSecurityService: OidcSecurityService, private router: Router) {
    }

    ngOnInit(): void {
        this.oidcSecurityService.checkAuth()
            .subscribe(({
                            // eslint-disable-next-line @typescript-eslint/no-unused-vars
                            isAuthenticated, userData, accessToken, idToken, configId
                        }) => {
                const originalUrl = localStorage.getItem('originalUrl');
                if (originalUrl) {
                    localStorage.removeItem('originalUrl');
                    this.router.navigate([originalUrl]);
                }
                console.log('callback authenticated', isAuthenticated);
            });
    }
}

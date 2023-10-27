import {NgModule} from '@angular/core';
import {RouterModule, Routes} from "@angular/router";
import {BookComponent} from "./components/book/book.component";
import {HomeComponent} from "./components/home/home.component";
import {ProfileComponent} from "./components/profile/profile.component";
import {ShelveComponent} from "./components/shelve/shelve.component";
import {AddBookComponent} from "./components/add-book/add-book.component";
import {roleAndAuthGuard} from "./auth/auth.guard";
import {Roles} from "./models/roles";
import {UnauthorizedComponent} from "./auth/unauthorized.component";
import {CallbackComponent} from "./auth/callback.component";
import {ForbiddenComponent} from "./auth/forbidden.component";


const routes: Routes = [
  {
    path: '',
    component: HomeComponent,
    canActivate: [roleAndAuthGuard],
    data: {roles: [Roles.OIDC_USER, Roles.OIDC_ADMIN]},
  },
  {
    path: 'unauthorized',
    component: UnauthorizedComponent
  },
  {
    path: 'callback',
    component: CallbackComponent
  },
  {
    path: 'forbidden',
    component: ForbiddenComponent
  },
  {
    path: 'shelves',
    component: ShelveComponent,
    canActivate: [roleAndAuthGuard],
    data: {roles: [Roles.OIDC_USER, Roles.OIDC_ADMIN]},
  },
  {
    path: 'profile',
    component: ProfileComponent,
    canActivate: [roleAndAuthGuard],
    data: {roles: [Roles.OIDC_USER, Roles.OIDC_ADMIN]},
  },
  {
    path: 'book/:id',
    component: BookComponent,
    canActivate: [roleAndAuthGuard],
    data: {roles: [Roles.OIDC_USER, Roles.OIDC_ADMIN]},
  },
  {
    path: 'add-book',
    component: AddBookComponent,
    canActivate: [roleAndAuthGuard],
    data: {roles: [Roles.OIDC_ADMIN]},
  }
]

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    initialNavigation: 'enabledBlocking'
  })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}


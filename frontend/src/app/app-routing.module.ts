import { NgModule } from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { AuthGuard } from "./auth/auth.guard";
import { BookComponent } from "./components/book/book.component";
import { HomeComponent } from "./components/home/home.component";
import { ProfileComponent } from "./components/profile/profile.component";
import { ShelveComponent } from "./components/shelve/shelve.component";
import {AddBookComponent} from "./components/add-book/add-book.component";


const routes: Routes = [
  {
    path: '',
    component: HomeComponent,
  },
  {
    path: 'shelves',
    component: ShelveComponent,
    canActivate: [ AuthGuard ],
  },
  {
    path: 'profile',
    component: ProfileComponent,
    canActivate: [ AuthGuard ],
  },
  {
    path: 'book/:id',
    component: BookComponent,
    canActivate: [ AuthGuard ],
  },
  {
    path: 'add-book',
    component: AddBookComponent,
    canActivate: [ AuthGuard ],
    data: {
      role: 'ADMIN'
    }
  }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes, {
    initialNavigation: 'enabledBlocking'
  }) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {
}


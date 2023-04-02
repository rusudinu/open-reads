import { NgModule } from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { BookComponent } from "./components/book/book.component";
import { HomeComponent } from "./components/home/home.component";
import { ProfileComponent } from "./components/profile/profile.component";
import { ShelveComponent } from "./components/shelve/shelve.component";


const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'shelves',
    component: ShelveComponent
  },
  {
    path: 'profile',
    component: ProfileComponent
  },
  {
    path: 'book/:id',
    component: BookComponent
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


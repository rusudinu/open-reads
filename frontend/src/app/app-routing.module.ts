import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes } from "@angular/router";
import { HomeComponent } from "./components/home/home.component";
import { ProfileComponent } from "./components/profile/profile.component";
import { ShelveComponent } from "./components/shelve/shelve.component";


const routes: Routes = [
  {
    path: '/',
    component: HomeComponent
  },
  {
    path: 'shelves',
    component: ShelveComponent
  },
  {
    path: 'profile',
    component: ProfileComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class AppRoutingModule {
}

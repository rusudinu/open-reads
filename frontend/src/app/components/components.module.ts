import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ShelveComponent } from './shelve/shelve.component';
import { ProfileComponent } from './profile/profile.component';
import { HomeComponent } from './home/home.component';


@NgModule({
  declarations: [
    ShelveComponent,
    ProfileComponent,
    HomeComponent
  ],
  imports: [
    CommonModule
  ]
})
export class ComponentsModule {
}

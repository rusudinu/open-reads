import { HttpClient } from "@angular/common/http";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BookService } from "./book/book.service";
import { ShelveComponent } from './shelve/shelve.component';
import { ProfileComponent } from './profile/profile.component';
import { HomeComponent } from './home/home.component';
import { BookComponent } from './book/book.component';


@NgModule({
  declarations: [
    ShelveComponent,
    ProfileComponent,
    HomeComponent,
    BookComponent
  ],
  imports: [
    CommonModule
  ],
  providers: [ HttpClient]
})
export class ComponentsModule {
}

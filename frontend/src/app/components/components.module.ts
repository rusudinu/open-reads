import { HttpClient } from "@angular/common/http";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule } from "@angular/material/icon";
import { MatProgressSpinnerModule } from "@angular/material/progress-spinner";
import { SnackbarModule } from "../shared/snackbar/snackbar.module";
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
    CommonModule,
    SnackbarModule,
    MatIconModule,
    MatProgressSpinnerModule,
  ],
  providers: [ HttpClient, SnackbarModule ]
})
export class ComponentsModule {
}

import { HttpClient } from "@angular/common/http";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule } from "@angular/material/icon";
import { MatProgressSpinnerModule } from "@angular/material/progress-spinner";
import { SnackbarModule } from "../shared/snackbar/snackbar.module";
import { ProfileService } from "./profile/profile.service";
import { ShelveComponent } from './shelve/shelve.component';
import { ProfileComponent } from './profile/profile.component';
import { HomeComponent } from './home/home.component';
import { BookComponent } from './book/book.component';
import { AddBookComponent } from './add-book/add-book.component';
import {ReactiveFormsModule} from "@angular/forms";


@NgModule({
  declarations: [
    ShelveComponent,
    ProfileComponent,
    HomeComponent,
    BookComponent,
    AddBookComponent
  ],
    imports: [
        CommonModule,
        SnackbarModule,
        MatIconModule,
        MatProgressSpinnerModule,
        ReactiveFormsModule,
    ],
  providers: [ HttpClient, SnackbarModule, ProfileService ]
})
export class ComponentsModule {
}

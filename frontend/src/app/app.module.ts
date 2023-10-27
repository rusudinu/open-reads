import {HttpClient, HttpClientModule} from "@angular/common/http";
import {NgModule} from '@angular/core';
import {ReactiveFormsModule} from "@angular/forms";
import {MatIconModule} from "@angular/material/icon";
import {MatProgressSpinnerModule} from "@angular/material/progress-spinner";
import {BrowserModule} from '@angular/platform-browser';


import {AppComponent} from './app.component';
import {NgbCarouselModule, NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {AppRoutingModule} from './app-routing.module';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {BookService} from "./components/book/book.service";
import {ComponentsModule} from "./components/components.module";
import {SnackbarModule} from "./shared/snackbar/snackbar.module";
import {AuthConfigModule} from "./auth/auth-config.module";
import {AuthService} from "./auth/auth.service";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AuthConfigModule,
    MatProgressSpinnerModule,
    NgbModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatIconModule,
    SnackbarModule,
    ComponentsModule,
    ReactiveFormsModule,
    NgbModule,
    NgbCarouselModule
  ],
  providers: [BookService, HttpClient, AuthService],
  bootstrap: [AppComponent]
})
export class AppModule {
}


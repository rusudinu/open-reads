import { HttpClient, HttpClientModule, HttpHandler } from "@angular/common/http";
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterLinkActive, RouterOutlet } from "@angular/router";

import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BookService } from "./components/book/book.service";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    NgbModule,
    HttpClientModule,
    AppRoutingModule,
    RouterOutlet,
    RouterLinkActive,
    BrowserAnimationsModule
  ],
  providers: [ BookService, HttpClient ],
  bootstrap: [ AppComponent ]
})
export class AppModule {
}

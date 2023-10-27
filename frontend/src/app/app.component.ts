import {HttpClient} from "@angular/common/http";
import {Component, Inject, OnInit} from '@angular/core';
import {FormControl} from "@angular/forms";
import {Router} from "@angular/router";
import {debounceTime} from "rxjs";
import {environment} from "../environments/environment";
import {Book} from "../model/Book";
import {AuthService} from "./auth/auth.service";
import {OidcSecurityService} from "angular-auth-oidc-client";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  isNavbarCollapsed = true;

  searchControl = new FormControl();
  shouldShowSearchResults = false;
  searchedBookName: string = "";
  searchResults: Book[] = [];

  public loggedIn: boolean = false;
  public userProfile = {
    firstName: "test"
  };

  constructor(
    private router: Router,
    private httpClient: HttpClient,
    public authService: AuthService,
    public oidcSecurityService: OidcSecurityService,
  ) {

  }

  ngOnInit(): void {
    this.searchFilter();
    this.getUser();
  }

  async getUser() {
    this.loggedIn = await this.authService.isLoggedIn();
    if (this.loggedIn) {
      this.userProfile = await this.authService.loadUserProfile();
    }
  }

  public login(): void {
    this.oidcSecurityService.authorize();
  }

  public logout(): void {
    this.oidcSecurityService.logoff().subscribe();
  }

  searchFilter(): void {
    this.searchControl.valueChanges.pipe(debounceTime(500)).subscribe((value: string) => {
      if (this.searchedBookName == value || value.length == 0) {
        this.shouldShowSearchResults = false;
        return;
      }
      this.searchedBookName = value;
      this.search();
    });
  }

  onSearchResultClicked(book: Book): void {
    this.router.navigate([`/book/${book.id}`])
      .then(_ => this.shouldShowSearchResults = false);
  }

  search(): void {
    this.httpClient.get<Book[]>(environment.apiUrl + `/book/search/${this.searchedBookName}`).subscribe((books: Book[]) => {
      this.searchResults = books;
      if (books.length > 0)
        this.shouldShowSearchResults = true;
      else
        this.shouldShowSearchResults = false;
    });
  }
}

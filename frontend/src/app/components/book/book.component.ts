import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { environment } from "../../../environments/environment";
import { Book } from "../../../model/Book";
import { SnackbarService } from "../../shared/snackbar/snackbar.service";
import { BookService } from "./book.service";

@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: [ './book.component.scss' ]
})
export class BookComponent implements OnInit {
  book: Book;
  loading: Boolean = true;

  constructor(
    private route: ActivatedRoute,
    private snackbar: SnackbarService,
    private readonly bookService: BookService,
    private http: HttpClient,
  ) {
    this.book = {
      id: "-1",
      name: "",
      author: "",
      description: "",
      coverImageURL: "",
      genre: "NONFICTION"
    }
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.bookService.getBook(params['id']).subscribe((book: Book) => {
        this.book = book;
        this.loading = false;
      });
    });
  }

  markAsRead() {
    this.http.put(environment.apiUrl + '/book/mark-as-read/' + this.book.id, {}, {observe: 'response'}).subscribe((response) => {
      if (response.status === 200) {
        this.snackbar.success('Book marked as read successfully');
      } else {
        this.snackbar.error('Error marking book as read');
      }
    });
  }

  markAsCurrentlyReading() {
    this.http.put(environment.apiUrl + '/book/mark-as-reading/' + this.book.id, {}, {observe: 'response'}).subscribe((response) => {
      if (response.status === 200) {
        this.snackbar.success('Book marked as currently reading successfully');
      } else {
        this.snackbar.error('Error marking book as currently reading');
      }
    });
  }

  markAsWantToRead() {
    this.http.put(environment.apiUrl + '/book/mark-as-want-to-read/' + this.book.id, {}, {observe: 'response'}).subscribe((response) => {
      if (response.status === 200) {
        this.snackbar.success('Book marked as want to read successfully');
      } else {
        this.snackbar.error('Error marking book as want to read');
      }
    });
  }
}

import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
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
    private readonly bookService: BookService
  ) {
    this.book = {
      id: "-1",
      name: "",
      author: "",
      description: "",
      coverImageURL: "",
      genre:"NONFICTION"
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
    this.snackbar.error("Mark as read not implemented yet.");
  }

  markAsCurrentlyReading() {
    this.snackbar.success("Mark as currently reading not implemented yet.");
  }

  markAsWantToRead() {
    this.snackbar.warning("Mark as want to read not implemented yet.");
  }
}

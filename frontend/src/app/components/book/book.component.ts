import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Book } from "../../../model/Book";
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
    private readonly bookService: BookService
  ) {
    this.book = {
      id: "-1",
      title: "",
      author: "",
      description: "",
      photo_url: ""
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
}

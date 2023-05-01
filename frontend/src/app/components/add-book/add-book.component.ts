import { Component } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { Book } from "../../../model/Book";
import { environment } from "../../../environments/environment";
import { SnackbarService } from "../../shared/snackbar/snackbar.service";

@Component({
  selector: 'app-add-book',
  templateUrl: './add-book.component.html',
  styleUrls: [ './add-book.component.scss' ]
})
export class AddBookComponent {
  addBookForm: FormGroup;

  constructor(private http: HttpClient, private fb: FormBuilder,
              private snackbar: SnackbarService) {
    this.addBookForm = this.fb.group({
      bookName: [ '', Validators.required ],
      authorName: [ '', Validators.required ],
      imageUrl: [ '', Validators.required ],
      genre: [ '', Validators.required ],
      description: [ '', Validators.required ]
    });
  }


  private bookFormToBook(): Book {
    return {
      name: this.addBookForm.get('bookName')?.value,
      author: this.addBookForm.get('authorName')?.value,
      description: this.addBookForm.get('description')?.value,
      coverImageURL: this.addBookForm.get('imageUrl')?.value,
      genre: this.addBookForm.get('genre')?.value
    }
  }

  addBook() {
    console.log(this.bookFormToBook());
    this.http.post(environment.apiUrl + '/book', this.bookFormToBook(), {observe: 'response'}).subscribe((response) => {
      if (response.status === 200) {
        this.addBookForm.reset();
        this.snackbar.success('Book added successfully');
      } else {
        this.snackbar.error('Error adding book');
      }
    });
  }
}

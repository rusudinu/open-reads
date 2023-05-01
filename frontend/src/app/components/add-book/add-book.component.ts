import { Component } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Book} from "../../../model/Book";
import {environment} from "../../../environments/environment";

@Component({
  selector: 'app-add-book',
  templateUrl: './add-book.component.html',
  styleUrls: ['./add-book.component.scss']
})
export class AddBookComponent {
  addBookForm: FormGroup;

  constructor(private http: HttpClient, private fb: FormBuilder) {
    this.addBookForm = this.fb.group({
      bookName: ['', Validators.required],
      authorName: ['', Validators.required],
      imageUrl: ['', Validators.required],
      category: ['', Validators.required],
      description: ['', Validators.required]
    });
  }


  private bookFormToBook():Book{
    return {
      name:this.addBookForm.get('bookName')?.value,
      author:this.addBookForm.get('authorName')?.value,
      description:this.addBookForm.get('description')?.value,
      coverImageURL:this.addBookForm.get('imageUrl')?.value,
      category:this.addBookForm.get('category')?.value
    }
  }

  onSubmit() {
    this.http.post(environment.apiUrl + '/book', this.bookFormToBook()).subscribe(response => {
      console.log('Form submitted successfully', response);
      // Reset the form
      this.addBookForm.reset();
    }, error => {
      console.error('Error submitting form', error);
    });
  }
}

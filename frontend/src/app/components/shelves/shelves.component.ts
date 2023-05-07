import {Component} from '@angular/core';
import {Book} from "../../../model/Book";
import {User} from "../../../model/User";
import {FormBuilder, Validators} from "@angular/forms";
import {HttpClient} from "@angular/common/http";
import {SnackbarService} from "../../shared/snackbar/snackbar.service";
import {Router} from "@angular/router";
import {ProfileService} from "../profile/profile.service";

@Component({
  selector: 'app-shelves',
  templateUrl: './shelves.component.html',
  styleUrls: ['./shelves.component.scss']
})
export class ShelvesComponent {
  user: User | undefined;

  constructor(private profileService: ProfileService, private http: HttpClient, private router: Router) {
    this.profileService.getUser().subscribe(user => {
      this.user = user;
    });
  }

  bookClicked(book: Book) {
    this.router.navigate([`/book/${book.id}`])
  }
}

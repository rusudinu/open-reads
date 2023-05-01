import {Component, OnInit} from '@angular/core';
import {User} from "../../../model/User";
import {ProfileService} from "./profile.service";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {SnackbarService} from "../../shared/snackbar/snackbar.service";
import {Book} from "../../../model/Book";
import {Router} from "@angular/router";


@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit{
  user: User | undefined;
  friends: User[] = [];
  loading = true;
  showEdit: boolean = false;
  profileForm: FormGroup;

  constructor(private profileService: ProfileService, private fb: FormBuilder, private http: HttpClient, private snackbar: SnackbarService, private router: Router) {
    this.profileForm = this.fb.group({
      description: ['', Validators.required]
    });
    this.profileService.getUser().subscribe(user => {
      this.user = user;
      this.profileForm.patchValue({description: this.user.description});
      this.loading = false;
    });
  }

  ngOnInit(): void {
    this.getFriends();
  }

  getFriends(): void{
    this.http.get(environment.apiUrl + '/profile/friends').subscribe()
  }
  toggleEditProfile(): void {
    this.showEdit = !this.showEdit;
  }

  profileFormToDescription(): string {
    return this.profileForm.get('description')?.value;
  }

  toggleUpdateProfile() {
    // @ts-ignore
    this.user.description = this.profileFormToDescription();
    this.http.put(environment.apiUrl + "/profile/description", this.profileFormToDescription(), {observe: 'response'}).subscribe((response) => {
      if (response.status === 200) {
        this.profileForm.reset();
        this.toggleEditProfile();
        this.snackbar.success('Description updated successfully');
      } else {
        this.snackbar.error('Error updating description');
      }
    });
  }

  bookClicked(book: Book) {
    this.router.navigate([`/book/${book.id}`])
  }
}


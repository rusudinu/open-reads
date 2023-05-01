import { Component } from '@angular/core';
import { User } from "../../../model/User";
import { ProfileService } from "./profile.service";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: [ './profile.component.scss' ]
})
export class ProfileComponent {
  user: User | undefined;
  loading = true;

  constructor(private profileService: ProfileService) {
    this.profileService.getUser().subscribe(user => {
      this.user = user;
      this.loading = false;
    });
  }

}

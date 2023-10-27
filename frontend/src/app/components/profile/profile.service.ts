import {Injectable} from "@angular/core";
import {Observable} from "rxjs";
import {User} from "../../../model/User";
import {AuthService} from "../../auth/auth.service";

@Injectable()
export class ProfileService {
  constructor(private authService: AuthService) {
  }

  getUser(): Observable<User> {
    return this.authService.getUser();
  }
}


import {Injectable} from "@angular/core";
import {User} from "../../../model/User";

@Injectable()
export class ProfileService {
  private user: User = {
    id: -1,
    name: "John Doe",
    description: "Lorem Ipsum dolor sit amet",
    last_active: 1679150915,
    currently_reading: [{
      id: "1221323",
      title: "Barbie",
      author: "barbie",
      description: "i m a barbie girl",
      coverImageURL: "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/812kIrGJyEL.jpg",
    }],
    photo_url: "https://my.upb.ro/img/UPB-Bucuresti-logo.png",
  }

  getUserByID(id: number): User{
    return this.user;
  }
}


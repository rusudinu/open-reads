import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {environment} from "../../../environments/environment";
import {FeedEntry} from "../../../model/FeedEntry";

@Injectable()
export class HomeService {
  constructor(private http: HttpClient) {
  }

  getFeed(): Observable<FeedEntry[]> {
    return this.http.get<FeedEntry[]>(environment.apiUrl + "/feed")
  }
}

import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { environment } from "../../../environments/environment";

@Injectable()
export class BookService {
  constructor(
    private http: HttpClient,
  ) {
  }

  getBook(id: string): Observable<any> {
    return this.http.get(environment.apiUrl + "/book/" + id);
  }

}

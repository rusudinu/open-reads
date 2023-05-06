import {HttpClient} from "@angular/common/http";
import {Injectable} from "@angular/core";
import {Observable} from "rxjs";
import {environment} from "../../../environments/environment";
import {Book} from "../../../model/Book";

@Injectable()
export class BookService {
  constructor(
    private http: HttpClient
  ) {
  }

  getBook(id: string): Observable<any> {
    return this.http.get(environment.apiUrl + "/book/" + id);
  }

  getBookStatus(id: string): Observable<any> {
    return this.http.get(environment.apiUrl + "/book/status/" + id);
  }

  getBookRec(): Observable<Book[]> {
    return this.http.get<Book[]>(environment.apiUrl + "/book/recommended");
  }

}

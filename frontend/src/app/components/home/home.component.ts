import {Component, ViewChild} from '@angular/core';
import {Book} from "../../../model/Book";
import {BookService} from "../book/book.service";
import {NgbCarousel, NgbSlideEvent, NgbSlideEventSource} from "@ng-bootstrap/ng-bootstrap";
import {Router} from "@angular/router";
import {HomeService} from "./home.service";
import {FeedEntry} from "../../../model/FeedEntry";


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  books: Book[] | undefined;
  feedEntry: FeedEntry[] | undefined;
  paused = false;
  unpauseOnArrow = false;
  pauseOnIndicator = false;
  pauseOnHover = true;
  pauseOnFocus = true;
  @ViewChild('carousel', {static: true}) carousel: NgbCarousel | undefined;

  constructor(private bookService: BookService, private router: Router, private homeService: HomeService) {
    this.bookService.getBookRec().subscribe(recommendedBooks =>
      this.books = recommendedBooks)
    this.homeService.getFeed().subscribe(feed => this.feedEntry = feed)
  };

  togglePaused() {
    if (this.paused) {
      // @ts-ignore
      this.carousel.cycle();
    } else {
      // @ts-ignore
      this.carousel.pause();
    }
    this.paused = !this.paused;
  }

  onSlide(slideEvent: NgbSlideEvent) {
    if (
      this.unpauseOnArrow &&
      slideEvent.paused &&
      (slideEvent.source === NgbSlideEventSource.ARROW_LEFT || slideEvent.source === NgbSlideEventSource.ARROW_RIGHT)
    ) {
      this.togglePaused();
    }
    if (this.pauseOnIndicator && !slideEvent.paused && slideEvent.source === NgbSlideEventSource.INDICATOR) {
      this.togglePaused();
    }
  }


  bookTapped(id: string | undefined) {
    if (id === undefined) return;
    this.router.navigate([`/book/${id}`])
  }
}


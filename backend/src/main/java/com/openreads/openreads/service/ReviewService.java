package com.openreads.openreads.service;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.Review;
import com.openreads.openreads.model.ReviewDTO;
import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;
    private final BookService bookService;

    public Review saveBookReview(ReviewDTO reviewDTO, User user) {
        Review review = Review.builder()
                .user(user)
                .book(bookService.getBook(reviewDTO.getBookID()))
                .comment(reviewDTO.getComment())
                .rating(reviewDTO.getRating())
                .build();
        return reviewRepository.save(review);
    }
}

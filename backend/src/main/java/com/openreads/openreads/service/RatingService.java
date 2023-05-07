package com.openreads.openreads.service;

import com.openreads.openreads.model.Review;
import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class RatingService {
    private final ReviewRepository reviewRepository;
    private final UserProfileService userProfileService;
    private final BookService bookService;

    public Double getAverageRating(Long bookId) {
        return Objects.requireNonNullElse(reviewRepository.getAverageRating(bookId), 0.0);
    }

    public Double getMyRating(String preferredUsername, Long bookId) {
        return Objects.requireNonNullElse(reviewRepository.getMyRating(preferredUsername, bookId), 0.0);
    }

    public void rateBook(String username, Long bookId, Double rating) {
        User user = userProfileService.getUserProfile(username);
        if (user == null)
            return;
        reviewRepository.save(Review.builder()
                .user(user)
                .book(bookService.getBook(bookId))
                .rating(rating)
                .build());
    }
}

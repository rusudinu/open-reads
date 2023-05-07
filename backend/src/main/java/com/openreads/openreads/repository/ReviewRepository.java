package com.openreads.openreads.repository;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.Review;
import com.openreads.openreads.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.book.id = ?1")
    Double getAverageRating(Long bookId);

    @Query("SELECT r.rating FROM Review r WHERE r.user.username = ?1 AND r.book.id = ?2")
    Double getMyRating(String username, Long bookId);

    Review findByUserIdAndBook_Id(String userId, Long bookId);
}

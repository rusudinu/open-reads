package com.openreads.openreads.repository;

import com.openreads.openreads.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}

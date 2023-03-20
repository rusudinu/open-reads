package com.openreads.openreads.repository;

import com.openreads.openreads.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}

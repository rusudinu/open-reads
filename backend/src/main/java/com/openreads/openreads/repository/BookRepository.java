package com.openreads.openreads.repository;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByNameContaining(String keyword);

    @Query(value = "SELECT * FROM book WHERE genre = ?1 OR author = ?2 AND id NOT IN (SELECT read_id FROM open_reads_user_read WHERE user_id = ?3)", nativeQuery = true)
    List<Book> getRecommendedBooks(String genre, String author, String username);
}

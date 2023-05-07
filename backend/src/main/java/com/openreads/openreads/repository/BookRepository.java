package com.openreads.openreads.repository;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.BookStatus;
import com.openreads.openreads.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByNameContaining(String keyword);

    @Query(value = "SELECT * FROM book WHERE genre = ?1 OR author = ?2 AND id NOT IN (SELECT read_id FROM open_reads_user_read WHERE user_id = ?3)", nativeQuery = true)
    List<Book> getRecommendedBooks(String genre, String author, String username);

    @Query(value = "SELECT CASE WHEN EXISTS (SELECT * FROM open_reads_user_read WHERE user_id = ?1 AND read_id = ?2) THEN 'READ' WHEN EXISTS (SELECT * FROM open_reads_user_currently_reading WHERE user_id = ?1 AND currently_reading_id = ?2) THEN 'CURRENTLY_READING' WHEN EXISTS (SELECT * FROM open_reads_user_want_to_read WHERE user_id = ?1 AND want_to_read_id = ?2) THEN 'WANT_TO_READ' ELSE 'NONE' END", nativeQuery = true)
    BookStatus getBookStatus(String username, Long bookId);
}

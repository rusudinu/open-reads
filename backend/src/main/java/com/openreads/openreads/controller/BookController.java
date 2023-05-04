package com.openreads.openreads.controller;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.BookStatus;
import com.openreads.openreads.service.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/book")
public class BookController {
    private final BookService bookService;

    @GetMapping("/{id}")
    public Book getBook(@PathVariable Long id) {
        return bookService.getBook(id);
    }

    @GetMapping("/search/{keyword}")
    public List<Book> searchBook(@PathVariable String keyword) {
        return bookService.searchBook(keyword);
    }

    @PostMapping
    public Book saveBook(@RequestBody Book book) {
        return bookService.saveBook(book);
    }

    @GetMapping("/recommended")
    public List<Book> getRecommendedBooks(){
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return bookService.getRecommendedBooks((String) attributes.get("preferred_username"));
    }

    @PutMapping("/mark-as-reading/{bookId}")
    public void markAsReading(@PathVariable Long bookId) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        bookService.markAsReading((String) attributes.get("preferred_username"), bookId);
    }

    @PutMapping("/mark-as-read/{bookId}")
    public void markAsRead(@PathVariable Long bookId) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        bookService.markAsRead((String) attributes.get("preferred_username"), bookId);
    }

    @PutMapping("/mark-as-want-to-read/{bookId}")
    public void markAsWantToRead(@PathVariable Long bookId) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        bookService.markAsWantToRead((String) attributes.get("preferred_username"), bookId);
    }

    @GetMapping("/status/{bookId}")
    public BookStatus getBookStatus(@PathVariable Long bookId) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return bookService.getBookStatus((String) attributes.get("preferred_username"), bookId);
    }
}

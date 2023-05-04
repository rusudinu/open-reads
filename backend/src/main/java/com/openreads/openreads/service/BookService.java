package com.openreads.openreads.service;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {
    private final BookRepository bookRepository;
    private final UserProfileService userProfileService;

    public Book getBook(Long id) {
        return bookRepository.findById(id).get();
    }

    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    public List<Book> searchBook(String keyword) {
        return bookRepository.findByNameContaining(keyword.toLowerCase());
    }

    public void markAsReading(String username, Long bookId) {
        System.out.println(username);
        Book book = bookRepository.findById(bookId).get();
        User user = userProfileService.getUserProfile(username);
        if (user.getRead().contains(book)) {
            return;
        }
        user.getCurrentlyReading().add(book);
        userProfileService.saveUserProfile(user);
    }

    public void markAsRead(String username, Long bookId) {
        Book book = bookRepository.findById(bookId).get();
        User user = userProfileService.getUserProfile(username);
        if (user.getRead().contains(book)) {
            return;
        }
        user.getRead().add(book);
        user.getCurrentlyReading().remove(book);
        userProfileService.saveUserProfile(user);
    }

    public void markAsWantToRead(String username, Long bookId) {
        Book book = bookRepository.findById(bookId).get();
        User user = userProfileService.getUserProfile(username);
        if (user.getWantToRead().contains(book) || user.getRead().contains(book) || user.getCurrentlyReading().contains(book)) {
            return;
        }
        user.getWantToRead().add(book);
        userProfileService.saveUserProfile(user);
    }
}

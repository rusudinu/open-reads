package com.openreads.openreads.service;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {
    private final BookRepository bookRepository;

    public Book getBook(Long id) {
        return bookRepository.findById(id).get();
    }

    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    public List<Book> searchBook(String keyword) {
        return bookRepository.findByNameContaining(keyword.toLowerCase());
    }
}

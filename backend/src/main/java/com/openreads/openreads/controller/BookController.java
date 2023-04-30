package com.openreads.openreads.controller;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.service.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
}

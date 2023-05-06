package com.openreads.openreads.unit;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.BookRepository;
import com.openreads.openreads.service.BookService;
import com.openreads.openreads.service.UserProfileService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.*;

import static org.mockito.Mockito.*;
import static org.assertj.core.api.Assertions.*;

@SpringBootTest
public class BookServiceTest {
    @Autowired
    private BookService bookService;

    @MockBean
    private BookRepository bookRepository;

    @MockBean
    private UserProfileService userProfileService;

    @Test
    public void testGetBook() {
        // Given
        Long bookId = 1L;
        Book book = Book.builder().id(bookId).name("Test Book").build();
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(book));

        // When
        Book result = bookService.getBook(bookId);

        // Then
        assertThat(result).isEqualTo(book);
    }

    @Test
    public void testSaveBook() {
        // Given
        Book book = Book.builder().id(1L).name("Test Book").build();
        when(bookRepository.save(book)).thenReturn(book);

        // When
        Book result = bookService.saveBook(book);

        // Then
        assertThat(result).isEqualTo(book);
    }

    @Test
    public void testSearchBook() {
        // Given
        String keyword = "test";
        List<Book> books = Arrays.asList(
                Book.builder().id(1L).name("Test Book 1").build(),
                Book.builder().id(2L).name("Test Book 2").build(),
                Book.builder().id(3L).name("Another Book").build()
        );
        when(bookRepository.findByNameContaining(keyword.toLowerCase())).thenReturn(books.subList(0, 2));

        // When
        List<Book> result = bookService.searchBook(keyword);

        // Then
        assertThat(result).hasSize(2);
        assertThat(result.get(0).getName()).isEqualTo("Test Book 1");
        assertThat(result.get(1).getName()).isEqualTo("Test Book 2");
    }

    @Test
    public void testMarkAsReading() {
        // Given
        String username = "testUser";
        Long bookId = 1L;
        Book book = Book.builder().id(bookId).name("Test Book").build();
        User user = User.builder()
                .id("be0948c3-d056-43b6-ac52-a8e4b9a40ae4")
                .username(username)
                .currentlyReading(new ArrayList<>())
                .wantToRead(new ArrayList<>(Arrays.asList(book)))
                .read(new ArrayList<>())
                .build();

        when(userProfileService.getUserProfile(username)).thenReturn(user);
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(book));

        // When
        bookService.markAsReading(username, bookId);

        // Then
        assertThat(user.getRead()).isEmpty();
        assertThat(user.getWantToRead()).doesNotContain(book);
        assertThat(user.getCurrentlyReading()).contains(book);
        verify(userProfileService, times(1)).saveUserProfile(user);
    }


    @Test
    public void testMarkAsRead() {
        // Given
        String username = "testUser";
        Long bookId = 1L;
        Book book = Book.builder().id(bookId).name("Test Book").build();
        User user = User.builder()
                .id("be0948c3-d056-43b6-ac52-a8e4b9a40ae4")
                .username(username)
                .currentlyReading(new ArrayList<>(Arrays.asList(book)))
                .wantToRead(new ArrayList<>(Arrays.asList(book)))
                .read(new ArrayList<>()).build();
        when(userProfileService.getUserProfile(username)).thenReturn(user);
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(book));


        // When
        bookService.markAsRead(username, bookId);

        // Then
        assertThat(user.getRead()).contains(book);
        assertThat(user.getWantToRead()).doesNotContain(book);
        assertThat(user.getCurrentlyReading()).doesNotContain(book);
        verify(userProfileService, times
                (1)).saveUserProfile(user);

    }

    @Test
    public void testMarkAsWantToRead() {
        // Given
        String username = "testUser";
        Long bookId = 1L;
        Book book = Book.builder().id(bookId).name("Test Book").build();
        User user = User.builder().id("be0948c3-d056-43b6-ac52-a8e4b9a40ae4").username(username).currentlyReading(new ArrayList<>()).wantToRead(new ArrayList<>()).read(new ArrayList<>()).build();
        when(userProfileService.getUserProfile(username)).thenReturn(user);
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(book));


        // When
        bookService.markAsWantToRead(username, bookId);

        // Then
        assertThat(user.getRead()).isEmpty();
        assertThat(user.getWantToRead()).contains(book);
        assertThat(user.getCurrentlyReading()).isEmpty();
        verify(userProfileService, times(1)).saveUserProfile(user);
    }

}

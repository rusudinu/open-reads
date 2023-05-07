package com.openreads.openreads.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "open_reads_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String username;
    private String name;
    private String description;
    private String profileImageURL;
    private Long lastActionTimeStamp;
    private String friendsList = "";
    @ManyToMany
    private List<Book> currentlyReading = new ArrayList<>();
    @ManyToMany
    private List<Book> read = new ArrayList<>();
    @ManyToMany
    private List<Book> wantToRead = new ArrayList<>();

    public void addFriend(String username) {
        if (friendsList.contains(username))
            return;
        if (friendsList == null)
            friendsList = username + ",";
        friendsList += username + ",";
    }

    public List<String> getFriends() {
        if (friendsList == null || friendsList.isEmpty())
            return new ArrayList<>();
        return List.of(friendsList.split(","));
    }

    public Genre getFavouriteGenre() {
        List<Genre> genres = new ArrayList<>();
        for (Book book : read) {
            genres.add(book.getGenre());
        }
        for (Book book : currentlyReading) {
            genres.add(book.getGenre());
        }
        for (Book book : wantToRead) {
            genres.add(book.getGenre());
        }
        if (genres.isEmpty()) {
            return Genre.NONFICTION;
        }
        return genres.stream().reduce((genre, genre2) -> {
            if (genre == genre2) {
                return genre;
            }
            return Genre.NONFICTION;
        }).get();
    }

    public String getFavouriteAuthor(){
        List<String> authors = new ArrayList<>();
        for (Book book : read) {
            authors.add(book.getAuthor());
        }
        for (Book book : currentlyReading) {
            authors.add(book.getAuthor());
        }
        for (Book book : wantToRead) {
            authors.add(book.getAuthor());
        }
        if (authors.isEmpty()) {
            return "Andy Hunt";
        }
        return authors.stream().reduce((author, author2) -> {
            if (author.equals(author2)) {
                return author;
            }
            return "Andy Hunt";
        }).get();
    }
}

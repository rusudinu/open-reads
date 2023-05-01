package com.openreads.openreads.model;

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
    private String username;
    private String name;
    private String description;
    private String profileImageURL;
    private Long lastActionTimeStamp;
    @OneToMany
    private List<User> friendsList = new ArrayList<>();
    @OneToMany
    private List<Book> currentlyReading = new ArrayList<>();
    @OneToMany
    private List<Book> read = new ArrayList<>();
    @OneToMany
    private List<Book> wantToRead = new ArrayList<>();

}

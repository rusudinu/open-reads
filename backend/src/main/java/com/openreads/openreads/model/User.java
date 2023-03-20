package com.openreads.openreads.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "open_reads_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    private String name;
    private String description;
    private Long lastActionTimeStamp;
    @OneToMany
    private List<User> friendsList;
    @OneToMany
    private List<Book> currentlyReading;
    @OneToMany
    private List<Book> read;
    @OneToMany
    private List<Book> wantToRead;

}

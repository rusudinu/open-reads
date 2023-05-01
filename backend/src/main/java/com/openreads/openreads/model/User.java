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
    @OneToMany
    private List<Book> currentlyReading = new ArrayList<>();
    @OneToMany
    private List<Book> read = new ArrayList<>();
    @OneToMany
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
}

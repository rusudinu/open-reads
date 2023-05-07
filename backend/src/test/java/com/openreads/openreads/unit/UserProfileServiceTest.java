package com.openreads.openreads.unit;

import com.openreads.openreads.model.Book;
import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.BookRepository;
import com.openreads.openreads.repository.UserRepository;
import com.openreads.openreads.service.BookService;
import com.openreads.openreads.service.UserProfileService;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.*;

import static org.mockito.Mockito.*;
import static org.assertj.core.api.Assertions.*;

@SpringBootTest
public class UserProfileServiceTest {
    @Autowired
    private UserProfileService userProfileService;

    @MockBean
    private UserRepository userRepository;

    @Test
    public void testGetMyProfile() {
        // Given
        String username = "test";
        User user = User.builder().username(username).build();
        when(userRepository.findByUsername(username)).thenReturn(Optional.empty());
        when(userRepository.save(any(User.class))).thenReturn(user);

        // When
        User result = userProfileService.getMyProfile(username);

        // Then
        assertThat(result).isEqualTo(user);
    }

    @Test
    public void testGetUserProfile() {
        // Given
        String username = "test";
        User user = User.builder().username(username).build();
        when(userRepository.findByUsername(username)).thenReturn(Optional.of(user));

        // When
        User result = userProfileService.getUserProfile(username);

        // Then
        assertThat(result).isEqualTo(user);
    }

    @Test
    public void testSaveUserProfile() {
        // Given
        User user = User.builder().username("test").build();
        when(userRepository.save(user)).thenReturn(user);

        // When
        User result = userProfileService.saveUserProfile(user);

        // Then
        assertThat(result).isEqualTo(user);
    }

    @Test
    public void testUpdateUserDescription() {
        // Given
        String username = "test";
        String newDescription = "new description";
        User user = User.builder().username(username).description("old description").build();
        when(userRepository.findByUsername(username)).thenReturn(Optional.of(user));
        when(userRepository.save(any(User.class))).thenReturn(user);

        // When
        User result = userProfileService.updateUserDescription(username, newDescription);

        // Then
        assertThat(result).isEqualTo(user);
        assertThat(result.getDescription()).isEqualTo(newDescription);
    }

    @Test
    public void testGetFriends() {
        // Given
        String username = "test";
        User user = User.builder().username(username).friendsList("friend1,friend2").build();
        User friend1 = User.builder().username("friend1").build();
        User friend2 = User.builder().username("friend2").build();
        when(userRepository.findByUsername(username)).thenReturn(Optional.of(user));
        when(userRepository.findByUsername("friend1")).thenReturn(Optional.of(friend1));
        when(userRepository.findByUsername("friend2")).thenReturn(Optional.of(friend2));

        // When
        List<User> result = userProfileService.getFriends(username);

        // Then
        assertThat(result).containsExactlyInAnyOrder(friend1, friend2);
    }

}


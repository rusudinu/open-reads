package com.openreads.openreads.service;

import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserProfileService {
    private final UserRepository userRepository;

    public User getMyProfile(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        if (user.isPresent()) {
            return user.get();
        } else {
            User newUser = User.builder()
                    .id(UUID.randomUUID().toString())
                    .username(username)
                    .lastActionTimeStamp(System.currentTimeMillis())
                    .build();
            return userRepository.save(newUser);
        }
    }

    public User getUserProfile(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        return user.orElse(null);
    }

    public User saveUserProfile(User user) {
        return userRepository.save(user);
    }

    public User updateUserDescription(String username, String newDescription){
        Optional<User> user = userRepository.findByUsername(username);
        if (user.isPresent()) {
            User userToUpdate = user.get();
            userToUpdate.setDescription(newDescription);
            return userRepository.save(userToUpdate);
        } else {
            return null;
        }
    }
}

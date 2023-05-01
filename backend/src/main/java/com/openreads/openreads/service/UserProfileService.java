package com.openreads.openreads.service;

import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
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

    public User updateUserDescription(String username, String newDescription) {
        Optional<User> user = userRepository.findByUsername(username);
        if (user.isPresent()) {
            User userToUpdate = user.get();
            userToUpdate.setDescription(newDescription);
            return userRepository.save(userToUpdate);
        } else {
            return null;
        }
    }

    public void addFriend(String username, String friendUsername) {
        Optional<User> user = userRepository.findByUsername(username);
        Optional<User> friend = userRepository.findByUsername(friendUsername);
        if (user.isEmpty() || friend.isEmpty()) {
            return;
        }
        User userToUpdate = user.get();
        List<User> friendsList = userToUpdate.getFriendsList();
        if (!friendsList.contains(friend.get())) {
            friendsList.add(friend.get());
            userRepository.save(userToUpdate);
        }
        List<User> friendFriendsList = friend.get().getFriendsList();
        if (!friendFriendsList.contains(userToUpdate)) {
            friendFriendsList.add(userToUpdate);
            userRepository.save(friend.get());
        }
    }

}

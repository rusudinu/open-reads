package com.openreads.openreads.service;

import com.openreads.openreads.model.User;
import com.openreads.openreads.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserProfileService {
    private final UserRepository userRepository;

    public User getUserProfile(Long id) {
        return userRepository.findById(id).get();
    }

    public User saveUserProfile(User user) {
        return userRepository.save(user);
    }
}
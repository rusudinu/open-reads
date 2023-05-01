package com.openreads.openreads.controller;

import com.openreads.openreads.model.User;
import com.openreads.openreads.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/profile")
public class UserProfileController {
    private final UserProfileService userProfileService;

    @GetMapping("/me")
    public User getMyProfile(Authentication authentication) {
        return userProfileService.getMyProfile(authentication.getName());
    }

    @GetMapping("/{username}")
    public User getUserProfile(@PathVariable String username) {
        return userProfileService.getUserProfile(username);
    }

    @PostMapping
    public User saveUserProfile(@RequestBody User user) {
        return userProfileService.saveUserProfile(user);
    }
}

package com.openreads.openreads.controller;


import com.openreads.openreads.model.User;
import com.openreads.openreads.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/profile")
public class UserProfileController {
    private final UserProfileService userProfileService;

    @GetMapping("/{id}")
    public User getUserProfile(@PathVariable Long id) {
        return userProfileService.getUserProfile(id);
    }

    @PostMapping
    public User saveUserProfile(@RequestBody User user) {
        return userProfileService.saveUserProfile(user);
    }

}

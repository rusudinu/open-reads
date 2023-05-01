package com.openreads.openreads.controller;

import com.openreads.openreads.model.User;
import com.openreads.openreads.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/profile")
public class UserProfileController {
    private final UserProfileService userProfileService;

    @GetMapping("/me")
    public User getMyProfile() {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return  userProfileService.getMyProfile((String) attributes.get("preferred_username"));
    }

    @GetMapping("/{username}")
    public User getUserProfile(@PathVariable String username) {
        return userProfileService.getUserProfile(username);
    }

    @PostMapping
    public User saveUserProfile(@RequestBody User user) {
        return userProfileService.saveUserProfile(user);
    }

    @PutMapping
    public User updateUserDescription(@RequestBody String newDescription){
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return userProfileService.updateUserDescription((String) attributes.get("preferred_username"), newDescription);
    }
}

package com.openreads.openreads.controller;

import com.openreads.openreads.service.RatingService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/rating")
@RequiredArgsConstructor
public class RatingController {
    private final RatingService ratingService;

    @GetMapping("/{bookId}")
    public Double getAverageRating(@PathVariable Long bookId) {
        return ratingService.getAverageRating(bookId);
    }

    @GetMapping("/me/{bookId}")
    public Double getMyRating(@PathVariable Long bookId) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return ratingService.getMyRating((String) attributes.get("preferred_username"), bookId);
    }

    @PutMapping("/{bookId}/{rating}")
    public void rateBook(@PathVariable Long bookId, @PathVariable Double rating) {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        ratingService.rateBook((String) attributes.get("preferred_username"), bookId, rating);
    }
}

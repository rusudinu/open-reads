package com.openreads.openreads.controller;

import com.openreads.openreads.model.FeedEntry;
import com.openreads.openreads.service.FeedService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class FeedController {
    private final FeedService feedService;
    @GetMapping("/feed")
    public List<FeedEntry> getFeed() {
        Authentication authToken = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> attributes = ((JwtAuthenticationToken) authToken).getTokenAttributes();
        return feedService.getFeed((String) attributes.get("preferred_username"));
    }
}

package com.openreads.openreads.service;

import com.openreads.openreads.config.RedisCacheConfig;
import com.openreads.openreads.config.RedissonCacheNameMapper;
import com.openreads.openreads.model.FeedEntry;
import com.openreads.openreads.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FeedService {
    private final UserProfileService userProfileService;

    @Cacheable(value = RedisCacheConfig.USER_FEED, key = "{#username}", sync = true)
    public List<FeedEntry> getFeed(String username) {
        return userProfileService.getFriends(username).stream().map(friend -> {
            User user = userProfileService.getUserProfile(friend.getUsername());
            List<FeedEntry> temp = user.getRead().stream().map(book -> {
                FeedEntry feedEntry = new FeedEntry();
                feedEntry.setFriendName(friend.getUsername());
                feedEntry.setBookName(book.getName());
                feedEntry.setBookId(book.getId());
                feedEntry.setAuthor(book.getAuthor());
                feedEntry.setFriendImageUrl(user.getProfileImageURL());
                feedEntry.setBookImageUrl(book.getCoverImageURL());
                feedEntry.setBookDescription(book.getDescription());
                feedEntry.setStatusText(" started reading ");
                return feedEntry;
            }).collect(Collectors.toList());
            temp.addAll(user.getCurrentlyReading().stream().map(book -> {
                FeedEntry feedEntry = new FeedEntry();
                feedEntry.setFriendName(friend.getUsername());
                feedEntry.setBookName(book.getName());
                feedEntry.setAuthor(book.getAuthor());
                feedEntry.setBookId(book.getId());
                feedEntry.setFriendImageUrl(user.getProfileImageURL());
                feedEntry.setBookImageUrl(book.getCoverImageURL());
                feedEntry.setBookDescription(book.getDescription());
                feedEntry.setStatusText(" is currently reading ");
                return feedEntry;
            }).toList());

            temp.addAll(user.getWantToRead().stream().map(book -> {
                FeedEntry feedEntry = new FeedEntry();
                feedEntry.setFriendName(friend.getUsername());
                feedEntry.setBookName(book.getName());
                feedEntry.setAuthor(book.getAuthor());
                feedEntry.setBookId(book.getId());
                feedEntry.setFriendImageUrl(user.getProfileImageURL());
                feedEntry.setBookImageUrl(book.getCoverImageURL());
                feedEntry.setBookDescription(book.getDescription());
                feedEntry.setStatusText(" wants to read ");
                return feedEntry;
            }).toList());
            return temp;
        }).flatMap(List::stream).collect(Collectors.toList());
    }
}

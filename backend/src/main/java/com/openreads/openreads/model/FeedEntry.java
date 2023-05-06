package com.openreads.openreads.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FeedEntry {
    String friendName;
    String bookName;
    String author;
    String statusText;
    String friendImageUrl;
    String bookImageUrl;
    String bookDescription;
    Long bookId;
}

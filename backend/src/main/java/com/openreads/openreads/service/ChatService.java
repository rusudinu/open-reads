package com.openreads.openreads.service;

import com.openreads.openreads.dto.ChatDTO;
import com.openreads.openreads.model.LlamaResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ai.chat.ChatClient;


@Service
@RequiredArgsConstructor
public class ChatService {
    private final ChatClient chatClient;
    public LlamaResponse generateMessage(ChatDTO promptMessage) {
        final String llamaMessage = chatClient.call(String.format(promptMessage.getMessage()));
        return new LlamaResponse().setMessage(llamaMessage);
    }
}

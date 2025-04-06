package com.openreads.openreads.controller;

import com.openreads.openreads.dto.ChatDTO;
import com.openreads.openreads.model.LlamaResponse;
import com.openreads.openreads.service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ollama")
public class ChatController {
    private final ChatService chatService;
    @PostMapping("chat")
    public ResponseEntity<LlamaResponse> generate(
            @RequestBody ChatDTO ollamaDTO){
        final LlamaResponse aiResponse = chatService.generateMessage(ollamaDTO);
        return ResponseEntity.status(HttpStatus.OK).body(aiResponse);
    }
}

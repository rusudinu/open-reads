package com.openreads.openreads.repository;

import com.openreads.openreads.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}

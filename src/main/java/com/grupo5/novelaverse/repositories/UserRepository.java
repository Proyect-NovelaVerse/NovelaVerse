package com.grupo5.novelaverse.repositories;

import java.util.Optional;

import com.grupo5.novelaverse.models.User;



public interface UserRepository extends BaseRepository<User> {
    Optional<User> findByNickname(String nickname);
    User  findByEmail(String email);
}

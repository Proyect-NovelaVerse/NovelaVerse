package com.grupo5.novelaverse.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.repositories.UserRepository;

@Service
public class UserService extends BaseService<User> {

    private UserRepository repository;

    public UserService(UserRepository repository) {
        super(repository);
        this.repository = repository;
    }

    public User findByNickname(String nickname) {
        Optional<User> user = repository.findByNickname(nickname);
        if (user.isPresent()) {
            return user.get();
        } else {
            return null;
        }
    }

    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return repository.save(user);
    }

    public User findByEmail(String email) {
        return repository.findByEmail(email);
    }

    public boolean authenticateUser(String email, String password) {
        User user = repository.findByEmail(email);
        if (user == null) {
            return false;
        } else {
            if (BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public User getUserById(Long id) {
        return findById(id);
    }

}

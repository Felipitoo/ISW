package hello.repository;

import hello.entity.Type_User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface Type_UserRepo extends JpaRepository <Type_User, Integer> {
    
}
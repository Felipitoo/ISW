package hello.repository;

import hello.entity.External;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ExternalRepo extends JpaRepository <External, Integer> {
    
}
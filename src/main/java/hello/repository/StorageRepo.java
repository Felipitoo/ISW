package hello.repository;

import hello.entity.Storage;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StorageRepo extends JpaRepository <Storage, Integer> {
    
}
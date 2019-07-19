package hello.repository;

import hello.entity.Loan;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LoanRepo extends JpaRepository <Loan, Integer> {

}
package com.arjuncodes.springbootcrud.repository;

import  com.arjuncodes.springbootcrud.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student,Integer> {


}

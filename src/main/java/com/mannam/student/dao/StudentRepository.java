package com.mannam.student.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mannam.student.model.Student;
@Repository
public interface StudentRepository extends JpaRepository<Student, Long>{
	
}

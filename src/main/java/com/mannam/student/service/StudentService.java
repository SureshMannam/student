package com.mannam.student.service;

import java.util.List;

import com.mannam.student.exception.StudentNotFoundException;
import com.mannam.student.model.Student;

public interface StudentService {

	public void saveOrUpdate(Student student);

	public List<Student> findAll();

	public Student findById(long id) throws StudentNotFoundException;

	public void deleteById(long id) throws StudentNotFoundException;
}

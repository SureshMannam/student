package com.mannam.student.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannam.student.dao.StudentRepository;
import com.mannam.student.exception.StudentNotFoundException;
import com.mannam.student.model.Student;

@Service
public class StudentServiceImpl implements StudentService {
	private static final Logger logger = LoggerFactory.getLogger(StudentServiceImpl.class);

	@Autowired
	private StudentRepository studentRepository;

	@Override
	public void saveOrUpdate(Student student){
		studentRepository.save(student);
	}

	@Override
	public List<Student> findAll() {
		List<Student> studentList = studentRepository.findAll();
		if (studentList.size() > 0)
			return studentList;
		else
			return new ArrayList<Student>();
	}

	@Override
	public Student findById(long id) throws StudentNotFoundException {

		Optional<Student> student = studentRepository.findById(id);
		if (student.isPresent()) {
			return student.get();
		} else {
			throw new StudentNotFoundException("No Student record exist with that given id" + id);
		}
	}

	@Override
	public void deleteById(long id) throws StudentNotFoundException {
		Optional<Student> student = studentRepository.findById(id);
		if (student.isPresent()) {
			studentRepository.deleteById(id);
		} else {
			throw new StudentNotFoundException("No Student record exist with that given id" + id);
		}

	}

}

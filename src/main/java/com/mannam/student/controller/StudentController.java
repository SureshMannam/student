package com.mannam.student.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mannam.student.exception.StudentNotFoundException;
import com.mannam.student.model.Student;
import com.mannam.student.service.StudentService;

@Controller
public class StudentController {

	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	private StudentService studentService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(sdf, true));
	}

	@GetMapping("/")
	public ModelAndView getstudentList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("studentList", studentService.findAll());
		mav.setViewName("student_list");
		logger.info("Accessed student listing page [ size = " + studentService.findAll().size() + " ]");
		return mav;
	}

	@GetMapping("/edit/{id}")
	public ModelAndView Student(@PathVariable("id") String id) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("student", studentService.findById(Long.parseLong(id)));
		} catch (NumberFormatException | StudentNotFoundException e) {
			e.printStackTrace();
			logger.debug("Unable to find student with id" + id, e.getMessage());
		}
		logger.info("Accessed student update page for id[" + id + "]");
		mav.addObject("id", id);
		mav.setViewName("student_form");
		return mav;
	}

	@GetMapping("/studentform")
	public ModelAndView getStudentForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("student", new Student());
		mav.setViewName("student_form");
		logger.info("Accessed student creation page");
		return mav;
	}

	@PostMapping(value = "/save")
	public ModelAndView saveOrUpdateStudent(@Valid @ModelAttribute("student") Student student, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return new ModelAndView("student_form", "id", student.getId());
		} else {
			if (student != null) {
				// new student, add it else update it
				studentService.saveOrUpdate(student);
				redirectAttributes.addFlashAttribute("message", "Student record has been created/update successfully.");
				logger.info("student record inserted with id : " + student.getId());
			}
		}
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/delete/{id}")
	public ModelAndView removeStudent(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		try {
			studentService.deleteById(Long.valueOf(id));
		} catch (StudentNotFoundException e) {
			e.printStackTrace();
			logger.debug("Student record unable to find with id" + id, e.getMessage());
		}
		redirectAttributes.addFlashAttribute("message", "Student record has been deleted successfully.");
		logger.info("accessed student delete page");
		return new ModelAndView("redirect:/");
	}
}

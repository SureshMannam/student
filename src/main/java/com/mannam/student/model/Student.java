package com.mannam.student.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

@Entity
@Table(name = "STUDENT")
public class Student implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "NAME", nullable = false)
	@NotEmpty(message = "{name.not.empty}")
	@Size(max = 45, message = "{name.exceeds.length}")
	private String name;

	@Column(name = "ADDRESS")
	@Size(max = 45, message = "{address.exceeds.length}")
	private String address;

	@Column(name = "GENDER")
	private String gender = "M";

	@Column(name = "DOB")
	@Temporal(TemporalType.DATE)
	@Past(message = "{dob.must.past}")
	private Date dob;

	@Column(name = "EMAIL")
	@Email(message = "{email.not.valid}")
	@Size(max = 45, message = "{email.exceeds.length}")
	private String email;

	@Column(name = "MOBILE")
	@Size(max = 15, message = "{mobile.exceeds.length}")
	private String mobile;

	@Column(name = "PHONE")
	@Size(max = 15, message = "{phone.exceeds.length}")
	private String phone;

	public Student() {

	}

	public Student(Long id, String name, String address, String gender, Date dob, String email, String mobile,
			String phone) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.mobile = mobile;
		this.phone = phone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}

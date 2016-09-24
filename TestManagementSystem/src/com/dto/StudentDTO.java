package com.dto;

public class StudentDTO {

	private String id;
	private String birth;
	private String nation;
	private String sex;
	private String name;
	private String passwd;
	private String pw_question;
	private String pw_answer;
	private String person;
	private String email;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String rpost1;
	private String rpost2;
	private String raddr1;
	private String raddr2;
	
	public StudentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudentDTO(String id, String birth, String nation, String sex, String name, String passwd,
			String pw_question, String pw_answer, String person, String email, String post1, String post2, String addr1,
			String addr2, String rpost1, String rpost2, String raddr1, String raddr2) {
		super();
		this.id = id;
		this.birth = birth;
		this.nation = nation;
		this.sex = sex;
		this.name = name;
		this.passwd = passwd;
		this.pw_question = pw_question;
		this.pw_answer = pw_answer;
		this.person = person;
		this.email = email;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.rpost1 = rpost1;
		this.rpost2 = rpost2;
		this.raddr1 = raddr1;
		this.raddr2 = raddr2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPw_question() {
		return pw_question;
	}

	public void setPw_question(String pw_question) {
		this.pw_question = pw_question;
	}

	public String getPw_answer() {
		return pw_answer;
	}

	public void setPw_answer(String pw_answer) {
		this.pw_answer = pw_answer;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getRpost1() {
		return rpost1;
	}

	public void setRpost1(String rpost1) {
		this.rpost1 = rpost1;
	}

	public String getRpost2() {
		return rpost2;
	}

	public void setRpost2(String rpost2) {
		this.rpost2 = rpost2;
	}

	public String getRaddr1() {
		return raddr1;
	}

	public void setRaddr1(String raddr1) {
		this.raddr1 = raddr1;
	}

	public String getRaddr2() {
		return raddr2;
	}

	public void setRaddr2(String raddr2) {
		this.raddr2 = raddr2;
	}

	@Override
	public String toString() {
		return "StudentDTO [id=" + id + ", birth=" + birth + ", nation=" + nation + ", sex=" + sex + ", name=" + name
				+ ", passwd=" + passwd + ", pw_question=" + pw_question + ", pw_answer=" + pw_answer + ", person="
				+ person + ", email=" + email + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", rpost1=" + rpost1 + ", rpost2=" + rpost2 + ", raddr1=" + raddr1 + ", raddr2="
				+ raddr2 + "]";
	}
	
}

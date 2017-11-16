package www.dto;

import java.util.Date;

public class MemberVo {
	private String id; // 아이디
	private String password; // 비밀번호
	private String nick; // 닉네임
	private String name;	//이름
	private String gender; // 성별
	private String birth; // 생년월일
	private String email; // 이메일
	private String phone; // 연락처
	private String addr; // 주소
	private String pwq; // 비밀번호 질문
	private String answer; // 답변
	private String picture; // 사진경로
	private int reportcount; // 신고횟수
	private String joindate; // 가입일

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPwq() {
		return pwq;
	}

	public void setPwq(String pwq) {
		this.pwq = pwq;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}


	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", password=" + password + ", nick=" + nick + ", name=" + name + ", gender="
				+ gender + ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", addr=" + addr + ", pwq="
				+ pwq + ", answer=" + answer + ", picture=" + picture + ", reportcount=" + reportcount + ", joindate="
				+ joindate + "]";
	}

}

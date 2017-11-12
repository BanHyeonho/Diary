package www.dto;

import java.util.Date;

public class CommunityVo {

	private int idx; // 인덱스
	private   String id; // 아이디
	private   String nick; // 작성자
	private   String ctitle; // 글제목
	private   Date sdate; // 여행시작일
	private  Date edate; // 여행종료일
	private   Date cdate; // 작성일
	private   String place; // 지역
	private   int attendee; // 인원수
	private   String car; // 차량유무
	private	   String content; // 글내용
	private	   int creportconunt; // 신고횟수
	private	   int chitcount; // 조횟수
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getAttendee() {
		return attendee;
	}
	public void setAttendee(int attendee) {
		this.attendee = attendee;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCreportconunt() {
		return creportconunt;
	}
	public void setCreportconunt(int creportconunt) {
		this.creportconunt = creportconunt;
	}
	public int getChitcount() {
		return chitcount;
	}
	public void setChitcount(int chitcount) {
		this.chitcount = chitcount;
	}
	@Override
	public String toString() {
		return "CommunityVo [idx=" + idx + ", id=" + id + ", nick=" + nick + ", ctitle=" + ctitle + ", sdate=" + sdate
				+ ", edate=" + edate + ", cdate=" + cdate + ", place=" + place + ", attendee=" + attendee + ", car="
				+ car + ", content=" + content + ", creportconunt=" + creportconunt + ", chitcount=" + chitcount + "]";
	}
	
}
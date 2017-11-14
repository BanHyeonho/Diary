package www.dto;

import java.util.Date;

public class CommunityVo {

	private int idx; // 인덱스
	   private String id; // 아이디
	   private String nick; // 작성자
	   private String ctitle; // 글제목
	   private String sdate; // 여행시작일
	   private String edate; // 여행종료일
	   private String contents;//컨텐츠
	   private String cdate; // 작성일
	   private String cplace; // 지역
	   private int chitcount; //히트 카운터
	   private int creportcount; //리포트 카운터
	   private String car; //자동차 유무
	   private int attendee; //인원
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
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCplace() {
		return cplace;
	}
	public void setCplace(String cplace) {
		this.cplace = cplace;
	}
	public int getChitcount() {
		return chitcount;
	}
	public void setChitcount(int chitcount) {
		this.chitcount = chitcount;
	}
	public int getCreportcount() {
		return creportcount;
	}
	public void setCreportcount(int creportcount) {
		this.creportcount = creportcount;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public int getAttendee() {
		return attendee;
	}
	public void setAttendee(int attendee) {
		this.attendee = attendee;
	}
	@Override
	public String toString() {
		return "CommunityVo [idx=" + idx + ", id=" + id + ", nick=" + nick + ", ctitle=" + ctitle + ", sdate=" + sdate
				+ ", edate=" + edate + ", contents=" + contents + ", cdate=" + cdate + ", cplace=" + cplace
				+ ", chitcount=" + chitcount + ", creportcount=" + creportcount + ", car=" + car + ", attendee="
				+ attendee + "]";
	}
	
	


	

}

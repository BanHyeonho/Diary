package www.dto;

import java.util.Date;

public class CommunityVo {

	private int idx; // 인덱스
	private String id; // 아이디
	private String nick; // 작성자
	private String ctitle; // 글제목
	private String sdate; // 여행시작일
	private String edate; // 여행종료일
	private Date cdate; // 작성일
	private String cplace; // 지역
	private String attendee; //인원
	
	public String getAttendee() {
		return attendee;
	}
	public void setAttendee(String attendee) {
		this.attendee = attendee;
	}
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
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getCplace() {
		return cplace;
	}
	public void setCplace(String cplace) {
		this.cplace = cplace;
	}
	
	@Override
	public String toString() {
		return "CommunityVo [idx=" + idx + ", id=" + id + ", nick=" + nick + ", ctitle=" + ctitle + ", sdate=" + sdate
				+ ", edate=" + edate + ", cdate=" + cdate + ", cplace=" + cplace + ", attendee=" + attendee + "]";
	}
	


	

}

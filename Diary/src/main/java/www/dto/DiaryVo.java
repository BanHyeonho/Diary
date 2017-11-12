package www.dto;

import java.util.Date;

public class DiaryVo {

	private int idx; // 인덱스
	private String id; // 아이디
	private String nick; // 작성자
	private String dtitle; // 글제목
	private String place; // 여행지
	private String content; // 글내용
	private String mapposition; // 지도좌표
	private String dpicture; // 여행지사진경로
	private Date sdate; // 여행시작일
	private Date edate; // 여행종료일
	private Date ddate; // 작성일
	private int hitcount; // 조회수
	private int good; // 좋아요
	private int reportcount; // 신고횟수
	private String dpublic; // 글 공개/비공개

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

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMapposition() {
		return mapposition;
	}

	public void setMapposition(String mapposition) {
		this.mapposition = mapposition;
	}

	public String getDpicture() {
		return dpicture;
	}

	public void setDpicture(String dpicture) {
		this.dpicture = dpicture;
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

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}

	public String getDpublic() {
		return dpublic;
	}

	public void setDpublic(String dpublic) {
		this.dpublic = dpublic;
	}

	@Override
	public String toString() {
		return "DiaryVo [idx=" + idx + ", id=" + id + ", nick=" + nick + ", dtitle=" + dtitle + ", place=" + place
				+ ", content=" + content + ", mapposition=" + mapposition + ", dpicture=" + dpicture + ", sdate="
				+ sdate + ", edate=" + edate + ", ddate=" + ddate + ", hitcount=" + hitcount + ", good=" + good
				+ ", reportcount=" + reportcount + ", dpublic=" + dpublic + "]";
	}

}

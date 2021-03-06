package www.dto;

public class DiaryVo {

	private int idx; // 인덱스
	private String id; // 아이디
	private String nick; // 작성자 닉네임
	private String dtitle; // 글제목
	private String place; // 여행지
	private String contents; // 글내용
	private String mapposition; // 지도좌표
	private String dpicture; // 여행지사진경로
	private String sdate; // 여행시작일
	private String edate; // 여행종료일
	private String ddate; // 작성일
	private int dhitcount; // 조회수
	private int good; // 좋아요
	private int dreportcount; // 신고횟수
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}


	public int getDhitcount() {
		return dhitcount;
	}

	public void setDhitcount(int dhitcount) {
		this.dhitcount = dhitcount;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getDreportcount() {
		return dreportcount;
	}

	public void setDreportcount(int dreportcount) {
		this.dreportcount = dreportcount;
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
				+ ", contents=" + contents + ", mapposition=" + mapposition + ", dpicture=" + dpicture + ", sdate="
				+ sdate + ", edate=" + edate + ", ddate=" + ddate + ", dhitcount=" + dhitcount + ", good=" + good
				+ ", dreportcount=" + dreportcount + ", dpublic=" + dpublic + "]";
	}


}

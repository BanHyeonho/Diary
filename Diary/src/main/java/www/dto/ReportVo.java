package www.dto;

public class ReportVo {

	private int idx; // 인덱스
	private int linkedidx; // 신고된 글 인덱스
	private String reporter; // 신고자 닉네임
	private String title; // 글제목
	private String witerid; // 글쓴이 아이디
	private String type; // 신고타입 ex) 욕설,광고,선정성,기타
	private String reason; // 신고사유(이유)
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getLinkedidx() {
		return linkedidx;
	}
	public void setLinkedidx(int linkedidx) {
		this.linkedidx = linkedidx;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWiterid() {
		return witerid;
	}
	public void setWiterid(String witerid) {
		this.witerid = witerid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "ReportVo [idx=" + idx + ", linkedidx=" + linkedidx + ", reporter=" + reporter + ", title=" + title
				+ ", witerid=" + witerid + ", type=" + type + ", reason=" + reason + "]";
	}

	
}

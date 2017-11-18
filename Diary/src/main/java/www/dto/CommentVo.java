package www.dto;

import java.util.Date;

public class CommentVo {

	private int idx; // 인덱스
	private String nick; // 작성자
	private int linkedidx; // 참조인덱스
	private String contents; // 내용
	private Date cdate; // 작성일
	private int reportcount;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getLinkedidx() {
		return linkedidx;
	}
	public void setLinkedidx(int linkedidx) {
		this.linkedidx = linkedidx;
	}
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getReportcount() {
		return reportcount;
	}
	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	@Override
	public String toString() {
		return "CommentVo [idx=" + idx + ", nick=" + nick + ", linkedidx=" + linkedidx + ", contents=" + contents
				+ ", cdate=" + cdate + ", reportcount=" + reportcount + "]";
	}
	
}

package www.dto;

import java.util.Date;

public class CommentVo {

	private int idx; // 인덱스
	private String nick; // 작성자
	private int linkedidx; // 참조인덱스
	private String content; // 내용
	private Date date; // 작성일
	private int coreportcount; //신고회수
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCoreportcount() {
		return coreportcount;
	}
	public void setCoreportcount(int coreportcount) {
		this.coreportcount = coreportcount;
	}
	@Override
	public String toString() {
		return "CommentVo [idx=" + idx + ", nick=" + nick + ", linkedidx=" + linkedidx + ", content=" + content
				+ ", date=" + date + ", coreportcount=" + coreportcount + "]";
	}


}

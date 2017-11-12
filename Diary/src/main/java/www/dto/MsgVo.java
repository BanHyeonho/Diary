package www.dto;

public class MsgVo {
	private int idx; // 인덱스
	private String sender; // 보낸사람
	private String receiver; // 받는사람
	private String content; // 내용
	private String chk;		//쪽지 오면 1 아니면 0
	
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MsgVo [idx=" + idx + ", sender=" + sender + ", receiver=" + receiver + ", content=" + content + "]";
	}

}

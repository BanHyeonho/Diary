package www.dto;

public class HitCountVo {
	private int idx;	//인덱스
	private int didx;	//글인덱스
	private String id;	//조회한 아이디
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "HitCountVo [idx=" + idx + ", didx=" + didx + ", id=" + id + "]";
	}
	
	
}

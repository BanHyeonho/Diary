package www.dto;

public class GoodVo {
	int idx;	//인덱스
	int didx;	//글인덱스
	String id;	//추천누른 아이디
	
	@Override
	public String toString() {
		return "GoodVo [idx=" + idx + ", didx=" + didx + ", id=" + id + "]";
	}
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
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
	
}

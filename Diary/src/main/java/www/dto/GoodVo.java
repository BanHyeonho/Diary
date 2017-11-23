package www.dto;

public class GoodVo {
	int idx;	//인덱스
	int linkedidx;	//글인덱스
	String id;	//추천누른 아이디
	int good; //추천수
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	@Override
	public String toString() {
		return "GoodVo [idx=" + idx + ", linkedidx=" + linkedidx + ", id=" + id + ", good=" + good + "]";
	}

	
	
}

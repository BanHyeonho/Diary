package www.dto;

public class HitCountVo {
	private int idx;	//인덱스
	private int linkedidx;	//글인덱스
	private String id;	//조회한 아이디
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
	public int getLinkedidx() {
		return linkedidx;
	}
	public void setLinkedidx(int linkedidx) {
		this.linkedidx = linkedidx;
	}
	@Override
	public String toString() {
		return "HitCountVo [idx=" + idx + ", linkedidx=" + linkedidx + ", id=" + id + "]";
	}
	
	
	
}

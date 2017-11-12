package www.dto;

public class BlockVo {
	private int idx;	//인덱스
	private String blockId;	//차단한아이디
	private String id;		//내아이디
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "BlockVo [idx=" + idx + ", blockId=" + blockId + ", id=" + id + "]";
	}
	
}

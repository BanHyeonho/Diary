package www.dto;

public class BlockVo {
	private int idx;	//인덱스
	private String blockNick;	//차단한아이디
	private String id;		//내아이디
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBlockNick() {
		return blockNick;
	}
	public void setBlockNick(String blockNick) {
		this.blockNick = blockNick;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "BlockVo [idx=" + idx + ", blockNick=" + blockNick + ", id=" + id + "]";
	}
	
	
}

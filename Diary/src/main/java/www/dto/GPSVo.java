package www.dto;

public class GPSVo {
	private String id; //
	private String latitute;		//위도
	private String longitute;	//경도
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLatitute() {
		return latitute;
	}
	public void setLatitute(String latitute) {
		this.latitute = latitute;
	}
	public String getLongitute() {
		return longitute;
	}
	public void setLongitute(String longitute) {
		this.longitute = longitute;
	}
	@Override
	public String toString() {
		return "GPSVo [id=" + id + ", latitute=" + latitute + ", longitute=" + longitute + "]";
	}
	
}

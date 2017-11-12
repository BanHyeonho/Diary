package www.dto;

public class FollowVo {
	 private int idx;         //인덱스
	 private String Following;   //팔로우한사람
	 private String Followers;      //팔로우된사람
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFollowing() {
		return Following;
	}
	public void setFollowing(String following) {
		Following = following;
	}
	public String getFollowers() {
		return Followers;
	}
	public void setFollowers(String followers) {
		Followers = followers;
	}
	@Override
	public String toString() {
		return "FollowVo [idx=" + idx + ", Following=" + Following + ", Followers=" + Followers + "]";
	}
	 
}

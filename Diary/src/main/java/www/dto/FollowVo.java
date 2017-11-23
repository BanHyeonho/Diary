package www.dto;

public class FollowVo {
	 private int idx;         //인덱스
	 private String following;   //팔로우한사람
	 private String followers;      //팔로우된사람
	 private String followingId;   //팔로우한사람아이디
	 private String followersId;      //팔로우된사람아이디
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public String getFollowers() {
		return followers;
	}
	public void setFollowers(String followers) {
		this.followers = followers;
	}
	public String getFollowingId() {
		return followingId;
	}
	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}
	public String getFollowersId() {
		return followersId;
	}
	public void setFollowersId(String followersId) {
		this.followersId = followersId;
	}
	@Override
	public String toString() {
		return "FollowVo [idx=" + idx + ", following=" + following + ", followers=" + followers + ", followingId="
				+ followingId + ", followersId=" + followersId + "]";
	}
	 
	
	
}

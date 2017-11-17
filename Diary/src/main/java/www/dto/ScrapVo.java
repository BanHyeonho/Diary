package www.dto;

public class ScrapVo {
   private int idx;
   private int linkedidx;
   private String id;
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
   @Override
   public String toString() {
      return "ScrapVo [idx=" + idx + ", linkedidx=" + linkedidx + ", id=" + id + "]";
   }
   
   
}
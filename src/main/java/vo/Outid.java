package vo;

public class Outid {
   private String id;
   private String createdate;
   
   public Outid() {}
   
   public Outid(String id, String createdate) {
      super();
      this.id = id;
      this.createdate = createdate;
   }

   @Override
   public String toString() {
      return "Outid [id=" + id + ", createdate=" + createdate + "]";
   }

   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getCreatedate() {
      return createdate;
   }
   public void setCreatedate(String createdate) {
      this.createdate = createdate;
   }
}
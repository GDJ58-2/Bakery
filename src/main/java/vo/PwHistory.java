package vo;

public class PwHistory {
   private String customerId;
   private String pw;
   private String createdate;
   
   @Override
   public String toString() {
      return "PwHistory [customerId=" + customerId + ", pw=" + pw + ", createdate=" + createdate + "]";
   }

   //생성자
   public PwHistory() {}
   
   public PwHistory(String customerId, String pw, String createdate) {
      this.customerId = customerId;
      this.pw = pw;
      this.createdate = createdate;
   }

   public String getCustomerId() {
      return customerId;
   }

   public void setCustomerId(String customerId) {
      this.customerId = customerId;
   }

   public String getPw() {
      return pw;
   }

   public void setPw(String pw) {
      this.pw = pw;
   }

   public String getCreatedate() {
      return createdate;
   }

   public void setCreatedate(String createdate) {
      this.createdate = createdate;
   }
}
/*    */ package model;
/*    */ 
/*    */ import java.security.MessageDigest;
/*    */ import java.security.NoSuchAlgorithmException;
/*    */ 
/*    */ public class EncryptPassword
/*    */ {
/*  7 */   public static String state = null;
/*    */   
/*    */   public static String encrypt(String password)
/*    */   {
/* 11 */     String salt = "RandomStringForExtraSecurity@#$!%^&*(*)1234567890";
/* 12 */     MessageDigest md = null;
/*    */     try
/*    */     {
/* 14 */       md = MessageDigest.getInstance("md5");
/* 15 */       md.update((password + salt).getBytes());
/*    */       
/* 17 */       state = md.digest().toString();
/*    */       
/* 19 */       return state;
/*    */     }
/*    */     catch (NoSuchAlgorithmException e)
/*    */     {
/* 22 */       e.printStackTrace();
/*    */     }
/* 27 */     return state;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.EncryptPassword
 * JD-Core Version:    0.7.0.1
 */
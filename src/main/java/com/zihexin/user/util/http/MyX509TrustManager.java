package com.zihexin.user.util.http;

import javax.net.ssl.X509TrustManager;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

public class MyX509TrustManager implements X509TrustManager {

	
	
	private Certificate cert = null;  
	  
    public MyX509TrustManager() {  
        try {  
        	
        	//证书路径
//            FileInputStream fis = new FileInputStream(  
//                    "/Users/justyoung/Desktop/upload/Cloud3");  
//            BufferedInputStream bis = new BufferedInputStream(fis);  
  
    //        CertificateFactory cf = CertificateFactory.getInstance("X.509");  //x509标准
  
    //        while (bis.available() > 0) {  
             //   cert = cf.generateCertificate(bis);  
//              System.out.println(cert.toString());  
       //     }  
  //          bis.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
	
	
	
	@Override
	public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {

	}

	@Override
	public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
//        for (X509Certificate cert : chain) {  
//            if (cert.toString().equals(this.cert.toString()))  
//                return;  
//        }  
//        throw new CertificateException("certificate is illegal"); 
	}

	@Override
	public X509Certificate[] getAcceptedIssuers() {
		return  new X509Certificate[] { (X509Certificate) cert };
	}

}

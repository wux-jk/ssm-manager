package com.zihexin.user.util.http;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

public class MyVerifyHostName implements HostnameVerifier {

	@Override
	public boolean verify(String myIp, SSLSession arg1) {
//		if (myIp.equals("10.7.13.109")) //验证双方主机ip和名字
            return true;  
//        else  
//            return false;
	}

}

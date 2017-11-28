package com.zihexin.user.util.http;

import com.zihexin.user.util.cache.InterefaceCache;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.SecureRandom;

/* 
 * 利用HttpClient进行post请求的工具类 
 */
public class HttpClientUtil {

	private static SSLContext sslcontext;
	private static X509TrustManager tm;
	private static   PoolingHttpClientConnectionManager cm ;
	private static   RequestConfig requestConfig ;


	static {
		//配置文件取超时时间
		String config = InterefaceCache.getConfig("HTTP_TIMEOUT");

		//取不到超时时间  默认30秒
		int timeout = StringUtils.isEmpty(config)?30:Integer.valueOf(config);
		try {
			sslcontext = SSLContext.getInstance("TLS");
			tm = new MyX509TrustManager();
			sslcontext.init(null, new TrustManager[] { tm }, new SecureRandom());
			requestConfig = RequestConfig.custom() 
			        .setConnectTimeout(1000 * timeout).setConnectionRequestTimeout(1000 * timeout)  
			        .setSocketTimeout(1000 * timeout).build();
			
     cm = new PoolingHttpClientConnectionManager();
    // 将最大连接数增加到200
    cm.setMaxTotal(200);
    // 将每个路由基础的连接增加到20
    cm.setDefaultMaxPerRoute(20);
    // 将目标主机的最大连接数增加到50

   

    
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static String doPostHttps(String host, String message) {
		HttpEntity httpEntity = null;
		CloseableHttpResponse  response = null;
		CloseableHttpClient httpClient = null;
		try {

			   httpClient = HttpClients.custom().setSSLHostnameVerifier(new MyVerifyHostName()).setSSLContext(sslcontext)
					.build();
//				httpClient = HttpClients.custom().setSSLHostnameVerifier(new MyVerifyHostName()).setSSLContext(sslContext)
//						.build();
		    HttpHost localhost = new HttpHost(host, 80);
		    cm.setMaxPerRoute(new HttpRoute(localhost), 5000);
			StringEntity stringEntity = new StringEntity(message,"UTF-8");

			HttpPost httpPost = new HttpPost(host);
			httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");
			httpPost.setEntity(stringEntity);
			 response = httpClient.execute(httpPost);
			httpEntity = response.getEntity();
			httpEntity = new BufferedHttpEntity(httpEntity);
			String resultString = EntityUtils.toString(httpEntity);
			return resultString;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			System.out.println("-------------------httpClient对象是:"+httpClient.toString());
			if(httpClient!= null){
			try {
				response.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			}
		}
	}

	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		String message = "{\"channel_ID\":\"1001\",\"channel_SKU\":\"4720507\"}";

//		 String url = "https://202.85.211.63/itunes/communication/message";http://10.6.16.233:443/GiftCardServer
		// String url = "http://10.7.13.109:8080/itunes/communication/message";//10.7.13.109:8080
//		String url = "http://10.6.16.12:8089/csp/communication/message";//10.7.13.109:8080
		 String url = "http://10.7.13.56:8080/WelfareMall-management/product/queryProductDetail.cp ";//10.7.13.109:8080
		//String url = "http://10.6.5.114:8080/WelfareMall-management";

//		 String url = "http://10.6.16.29:443/GiftCardServer/services/giftCard";
//		 String url = "http://10.3.0.65:8080/GiftCardServer/services/giftCard";

		String doPost = HttpClientUtil.doPostHttp( url, message);
		try {
			System.out.println(URLDecoder.decode(doPost, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	public static String doPostHttp(String host, String message) {

		String resultString = null;
		HttpEntity httpEntity = null;
		CloseableHttpResponse  response = null;
		CloseableHttpClient httpClient = null;
		try {
			   httpClient = HttpClients.custom().setConnectionManager(cm).build();
			    HttpHost localhost = new HttpHost(host);
			    cm.setMaxPerRoute(new HttpRoute(localhost), 2000);
				StringEntity stringEntity = new StringEntity(message,"UTF-8");
			HttpPost httpPost = new HttpPost(host);
			//HttpGet httpPost= new HttpGet(host);
			// 添加参数
			httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");  
			httpPost.setEntity(stringEntity);
			httpPost.setConfig(requestConfig);
			// 设置编码
			    response = httpClient.execute(httpPost,HttpClientContext.create());
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != HttpStatus.SC_OK) {
				System.out.println("请求失败!返回码为："+statusCode);
				return null;
			}
			 httpEntity = response.getEntity();
			httpEntity = new BufferedHttpEntity(httpEntity);
			resultString = EntityUtils.toString(httpEntity);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if(httpClient!= null && response != null){
				try {
						response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return resultString;
	}

}
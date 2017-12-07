package com.zihexin.user.util;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.lang3.StringUtils;

public class StaticFileServerUtil {
	// private static final String BOUNDARYSTR = "XMKSSS***********";
	// private static final String BOUNDARY = "--" + BOUNDARYSTR + "\r\n";

	public static void main(String[] args) {
	sendPost("http://10.6.4.172:8080/upload/xxx.txt \n" +
			"\n","E:\\aa.txt");
		String ss="\\20150812\\50.jpg";
		String result = ss.replace("\\", "/");
		System.out.println(result);
	}

	public static String sendPost(String urlString, File file) {
		String result = "";
		HttpURLConnection urlConnection = null;
		FileInputStream fis = null;
		InputStream is = null;
		OutputStream os = null;
		BufferedOutputStream bos = null;
		BufferedReader br = null;
		String line;
		int capacity = 1024;

		byte[] bytes = new byte[capacity];
		try {
			// [start] ����HTTP����
			URL url;
			url = new URL(urlString);
			urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("POST");
			urlConnection.setDoOutput(true);
			urlConnection.setDoInput(true);
			urlConnection.setUseCaches(false);
			urlConnection.setInstanceFollowRedirects(false);
			urlConnection.setRequestProperty("Content-type","multipart/octet-stream");
			// urlConnection.setRequestProperty("Content-type",
			// "multipart/octet-stream;boundary=" + BOUNDARYSTR);
			urlConnection.connect();
			// [end] ����HTTP����

			// [start] ���ļ�����byte[]
			fis = new FileInputStream(file);


			// [start] ��������
			os = urlConnection.getOutputStream();

			int numReadByte = 0;
			while ((numReadByte = fis.read(bytes, 0, capacity)) > 0) {
				os.write(bytes, 0, numReadByte);
			}
			// [start] ��������

			// [start] ���շ���
			br = new BufferedReader(new InputStreamReader(
					urlConnection.getInputStream()));

			while ((line = br.readLine()) != null) {
				result += line;
			}
			// [start] ���շ���

			// [strat] ���ؽ��
			if (urlConnection.getResponseCode() != 200) {
				result = "err";
			}
			// [end] ���ؽ��

		} catch (IOException e) {
			e.printStackTrace();
			result = "err";
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
				if (is != null) {
					is.close();
				}
				if (os != null) {
					os.close();
				}
				if (bos != null) {
					bos.close();
				}
				if (br != null) {
					br.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			if (urlConnection != null) {
				urlConnection.disconnect();
			}
		}
		return result.replace("\\", "/");
	}

	/**
	 *
	 * @param urlString
	 *            ����·�� http://ip:port/upload/<your file name>
	 * @param filePath
	 *            �����ļ�·��
	 * @return ������ؽ��Ϊ "" �� "err"�� ��ʾ�ϴ�ʧ�� ���ؽ���� \ ��ϵͳ�ָ����� ��ʼ���������������ϵͳ�ָ���
	 *         ���ؽ�����ӣ�\20150808\bafa9900-3dd2-11e5-9811-7986ed18b280.doc
	 */
	private static String sendPost(String urlString, String filePath) {
		String result = "";
		if (StringUtils.isNotEmpty(urlString)
				&& StringUtils.isNotEmpty(filePath)) {
			File file = new File(filePath);
			result = sendPost(urlString, file);
		}
		return result;
	}
}

package com.zihexin.user.util.cache;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class InterefaceCache {

	/**
	 * 当前对象实例
	 */
	@SuppressWarnings("unused")
	public static InterefaceCache factoryCache = new InterefaceCache();

	private static ResourceLoader resourceLoader = new DefaultResourceLoader();

	/**
	 * 保存工厂配置
	 */
	private static Map<String, String> map = new ConcurrentHashMap<String, String>();

	static {
		InterefaceCache.loadProperties("classpath:intereface.properties");
	}

	InterefaceCache() {
	}

	/**
	 * 获取配置
	 */
	public static String getConfig(String key) {
		String value = map.get(key);
		return value != null ? value : StringUtils.EMPTY;
	}

	private static void loadProperties(String location) {

		Properties props = new Properties();

		Resource resource = null;
		InputStream is = null;
		try {
			resource = resourceLoader.getResource(location);
			is = resource.getInputStream();
			props.load(is);
		} catch (IOException ex) {
			ex.printStackTrace();
			return;
		} finally {
			IOUtils.closeQuietly(is);
		}
		Set<Entry<Object, Object>> entrySet = props.entrySet();
		for (Entry<Object, Object> entry : entrySet) {
			map.put(entry.getKey().toString(), entry.getValue().toString());
		}
	}

	public static Map<String, String> getMap() {
		return map;
	}

	public static void setMap(Map<String, String> map) {
		InterefaceCache.map = map;
	}

	public static void main(String[] args) {
		// new
		// ClassPathXmlApplicationContext("classpath:/spring/spring-mvc.xml");
		// FactoryCache factoryCache = new FactoryCache();
		System.out.println(InterefaceCache.getMap());
		// DefaultResourceLoader cs = new DefaultResourceLoader();

	}
}

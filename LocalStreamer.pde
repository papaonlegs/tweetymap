import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.json.JSONArray;

import com.mashape.client.exceptions.MashapeClientException;
import com.mashape.client.http.HttpClient;
import com.mashape.client.http.HttpMethod;
import com.mashape.client.http.callback.MashapeCallback;

public class LocalStreamer {

	private String publicKey;
	private String privateKey;

	public LocalStreamer(String publicKey, String privateKey) {
		this.publicKey = publicKey;
		this.privateKey = privateKey;
	}

	public JSONObject geoHashEncode(String lat, String lng, String key) throws MashapeClientException {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lat", lat);
		parameters.put("lng", lng);
		parameters.put("key", key);
		return (JSONObject) HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/geohash/encode/lat/{lat}/lng/{lng}/key/{key}", parameters, true, publicKey, privateKey, true);
	}

	public Thread geoHashEncode(String lat, String lng, String key, MashapeCallback mashapeCallback) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lat", lat);
		parameters.put("lng", lng);
		parameters.put("key", key);
		return HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/geohash/encode/lat/{lat}/lng/{lng}/key/{key}", parameters, true, publicKey, privateKey, true, mashapeCallback);
	}

	public JSONObject geolocateText(String txt, String key) throws MashapeClientException {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("txt", txt);
		parameters.put("key", key);
		return (JSONObject) HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/geolocate/txt/{txt}/key/{key}", parameters, true, publicKey, privateKey, true);
	}

	public Thread geolocateText(String txt, String key, MashapeCallback mashapeCallback) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("txt", txt);
		parameters.put("key", key);
		return HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/geolocate/txt/{txt}/key/{key}", parameters, true, publicKey, privateKey, true, mashapeCallback);
	}

	public JSONObject worldTime(String lat, String lng, String pattern, String key) throws MashapeClientException {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lat", lat);
		parameters.put("lng", lng);
		parameters.put("pattern", pattern);
		parameters.put("key", key);
		return (JSONObject) HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/worldtime/lat/{lat}/lng/{lng}/pattern/{pattern}/key/{key}", parameters, true, publicKey, privateKey, true);
	}

	public Thread worldTime(String lat, String lng, String pattern, String key, MashapeCallback mashapeCallback) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lat", lat);
		parameters.put("lng", lng);
		parameters.put("pattern", pattern);
		parameters.put("key", key);
		return HttpClient.doRequest(HttpMethod.GET, "http://api.localstreamer.com/mashape/worldtime/lat/{lat}/lng/{lng}/pattern/{pattern}/key/{key}", parameters, true, publicKey, privateKey, true, mashapeCallback);
	}

}

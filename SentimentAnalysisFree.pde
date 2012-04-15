import java.util.HashMap;
import java.util.Map;
import java.io.InputStream;


import org.json.JSONObject;
import org.json.JSONArray;

import com.mashape.client.exceptions.MashapeClientException;
import com.mashape.client.http.HttpClient;
import com.mashape.client.http.HttpMethod;
import com.mashape.client.http.callback.MashapeCallback;

public class SentimentAnalysisFree {

	private String publicKey;
	private String privateKey;

	public SentimentAnalysisFree(String publicKey, String privateKey) {
		this.publicKey = publicKey;
		this.privateKey = privateKey;
	}

	public JSONObject classifytext(String lang, String text, String exclude) throws MashapeClientException {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lang", lang);
		parameters.put("text", text);
		parameters.put("exclude", exclude);
		return (JSONObject) HttpClient.doRequest(HttpMethod.POST, "http://free-dev.cbanalytics.co.uk/sentiment/current/classify_text/", parameters, true, publicKey, privateKey, true);
	}

	public Thread classifytext(String lang, String text, String exclude, MashapeCallback mashapeCallback) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lang", lang);
		parameters.put("text", text);
		parameters.put("exclude", exclude);
		return HttpClient.doRequest(HttpMethod.POST, "http://free-dev.cbanalytics.co.uk/sentiment/current/classify_text/", parameters, true, publicKey, privateKey, true, mashapeCallback);
	}

	public JSONObject classifytext(String lang, String text) throws MashapeClientException {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lang", lang);
		parameters.put("text", text);
		return (JSONObject) HttpClient.doRequest(HttpMethod.POST, "http://free-dev.cbanalytics.co.uk/sentiment/current/classify_text/", parameters, true, publicKey, privateKey, true);
	}

	public Thread classifytext(String lang, String text, MashapeCallback mashapeCallback) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("lang", lang);
		parameters.put("text", text);
		return HttpClient.doRequest(HttpMethod.POST, "http://free-dev.cbanalytics.co.uk/sentiment/current/classify_text/", parameters, true, publicKey, privateKey, true, mashapeCallback);
	}

}

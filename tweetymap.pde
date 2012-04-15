//import TextProcessing;
//import org.json.JSONObject;

String getFrom = "http://webprojects.eecs.qmul.ac.uk/ec09240/twitter/tweets.php";
SentimentAnalysisFree saf;
LocalStreamer ls;
JSONObject analysed, localized;
String pubKey = "PUBr_R#REIO4wosZ8kSWrP3dsQwHaxlT";
String priKey = "PRI8nbm1kYfGK15qAPdHe37Lq0q507Qc";

void setup(){
  size(1200,200);
  PFont font = createFont("CourierNewPSMT", 12);
  textFont(font);
  saf = new SentimentAnalysisFree(pubKey,priKey);
  ls = new LocalStreamer(pubKey,priKey);
  try{
    analysed = saf.classifytext("en","I am happy");
    localized = ls.geolocateText("I am happy", "Glastonbury");
  }catch(Exception e){System.out.println(e);}
}

void draw(){
  text(analysed.toString(), 10, 10);
  text(localized.toString(), 10, 50);
}

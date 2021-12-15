// Page class
class Page {
  
  PImage img;  // stores image for the pg
  String text;  // stores text for the pg
  String[] choices;  // stores choices for the pg
  
  // constructor for pg with only text
  Page(String textContent) {
    text = textContent;
  }
  
  //  constructor for pg with text and choices
  Page(String textContent, String[] choicesContent) {
    text = textContent;
    choices =  choicesContent;
  }
  
  //  constructor for pg with image and text
  Page(PImage image, String textContent) {
    img = image;
    text = textContent;
  }
  
  //  constructor for pg with image, text, and choices
  Page(PImage image, String textContent, String[] choicesContent) {
    img = image;
    text = textContent;
    choices =  choicesContent;
  }
  
}

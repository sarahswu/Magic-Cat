PFont font;  // font variable
Page[] pgs = new Page[32];  // Object array of Page objects
int currPg = 1;  // counter for the current page
int lastPg = 0;  // records last page

// saves strings of choices
String[][] choices = { {"the paved road", "the dirt path", "walk back home"}, {"climb up the tree", "throw her treats at the dog", "sprint back home"}, {"throw her treats at the dog", "sprint back home"} };

String path;  // saves path choice
boolean resetPath = false;  // used to know when to reset path if player goes back <<<

String dogAction;  // saves dogAction choice
boolean resetDogAction = false;  // used to know when to reset dogAction if player goes back <<<

boolean goHome = false;  // used to skip to go home page


void setup() {
  fullScreen();  // makes screen fullscreen
  //size(900, 600); // used for testing

  // set up font
  font = createFont("DFWaWaSC-W5", 35);
  textFont(font);
  textAlign(CENTER);
  textSize(25);
  
  // load images
  imageMode(CENTER);
  PImage img2 = loadImage("Kiki.png");
  PImage img3 = loadImage("magic.png");
  PImage img4 = loadImage("master.png");
  PImage img7 = loadImage("bag.png");
  PImage img10 = loadImage("paths.png");
  PImage img11 = loadImage("city.png");
  PImage img12 = loadImage("forest.png");
  PImage img13 = loadImage("dog.png");
  PImage img15 = loadImage("orangecat.png");
  PImage img17 = loadImage("treats.png");
  PImage img19 = loadImage("shopkeeper.png");
  PImage img23 = loadImage("witch.png");
  PImage img28 = loadImage("fireplace.png");
  PImage img30 = loadImage("pie.png");
  
  
  // make page objects in page object array
  pgs[1] = new Page("Magic Cat\na story of a magical cat");
  pgs[2] = new Page(img2, "Once upon a time, there was a cat. Her name was Kiki.");
  pgs[3] = new Page(img3, "Kiki was no ordinary kitty. Kiki was a magical cat.");
  pgs[4] = new Page(img4, "Kiki lived in the forest with her master who found Kiki when she was still a young kitten.\n Kiki found out she was a magical cat from her Master. Her master told her she was a special cat.\n\nKiki loved her master very much.");
  pgs[5] = new Page("One day, Kiki's master was missing a very important ingredient.\n\nShe needed an Earth Apple.");
  pgs[6] = new Page("\"I'll go find an Earth Apple and bring it back!\" said Kiki with determinaiton.\n\n\"Are you sure?\" asked Kiki's master with a frown.\n\"It's a dangerous world out there for a small cat.\"");
  pgs[7] = new Page(img7, "\"No need to worry!\" exclaimed Kiki as she retrieved her bag and brought it to her master.\n\"I've done it with you before, so I know the way!\"");
  pgs[8] = new Page("Kiki's master grabbed some treats, money, and a note and placed them in the bag before\nlooping the bag over Kiki's head and placing it gently by Kiki's side.\n\n\"Alright, I trust you. Remember you can always come back if it gets too dangerous!\"");
  pgs[9] = new Page("Kiki set off in search of an Earth Apple.\n\nKiki was not yet afraid or worried because she recognized the path she was taking in between the tall trees.\n\nHowever, she then stumbled upon a fork in the road and she could not remember which\nway her master usually took.");
  pgs[10] = new Page(img10, "Which path should Kiki take?", choices[0]);
  pgs[11] = new Page(img11, "\"I have a good feeling this is the right way!\" Kiki exlaimed as she continued her hike down the paved road.\n\nIt was a warm, but breezy day and she could feel the slight coolness of the cement\nthrough the beans of her paws.\n\nKiki was soon no longer surrounded by trees but by buildings and houses.");
  pgs[12] = new Page(img12, "\"This path doesn't smell familiar,\" Kiki thought nervously as she continued her trek down the dirt path.\n\nIt was a warm, but breezy day and she could feel the warmth of the sun on the dirt through the beans of her paws.\n\nSoon, the trees surrounding Kiki became taller and denser and blocked the sun,\nmaking the dirt between Kiki's toes no longer warm.");
  pgs[13] = new Page(img13, "Suddenly, Kiki heard loud barking from her left and it was becoming louder and louder very quickly.\n\nKiki spun to her left to see a dog three times the size of Kiki charging straight at her!\nKiki ran from the large hound as fast as she could.\n\nFrom the corners of her eyes, she saw a tree with an orange cat sitting on one of its branches.");
  pgs[14] = new Page("What should Kiki do?", choices[1]);
  pgs[15] = new Page(img15, "Kiki scampered up the tree, seeking refuge in the branches with the orange cat.\nHowever, upon seeing the frightening hound, the orange cat freaked out and jumped down the tree,\nknocking Kiki to the ground in the process!");
  pgs[16] = new Page("What should Kiki do?", choices[2]);
  pgs[17] = new Page(img17, "Kiki reached into her bag and flung all her yummy treats at the dog.\n\nHe stopped to smell the treats scattered on the ground before taking a bite.\n\nThen, the dog started wagging its tail after tasting the tasty treats and\nKiki took her chance to sneak away.");
  pgs[18] = new Page("Kiki strolled along the road peacefully without any more trouble until she finally reached her destination...\n\nthe grocery store!\n\nElated, Kiki entered and greeted the shopkeeper.");
  pgs[19] = new Page(img19, "\"Meow! (Hello, sir!)\"\n\n\"Good afternoon, Kiki!\" the shopkeeper smiled warmly with his friendly mustache.\n\"Is it just you today?\"");
  pgs[20] = new Page("Purring, Kiki nudged the shopkeeper's legs with her head and body.\nThe shopkeeper laughed and bent down to open Kiki's bag.");
  pgs[21] = new Page("Inside, he found the note and money and proceeded to head further inside the store\nto retrieve Kiki’s long-awaited treasures before putting them in Kiki’s bag.\n\n\"Come again soon!\" exclaimed the shopkeeper as he waved goodbye.");
  pgs[22] = new Page("Kiki strolled along the path peacefully without any more trouble until\nshe reached a small clearing with a small cottage in the middle.\n\nKiki, tired, hungry, and a little lost, decided to knock on the door to get help.\n\nShe heard shuffling inside the cottage before the door swung open,\nrevealing a stout witch with a kind smile and rosy cheeks.");
  pgs[23] = new Page(img23, "\"Hello, there!\" the witch greeted Kiki.\n\"What business does a small kitty such as yourself have at my humble abode?\"\n\n\"My master has given me the task of getting an Earth Apple,\" Kiki explained.\n\"But I seem to have taken a  wrong turn.\"");
  pgs[24] = new Page("After hearing Kiki's story, the amiable witch turned around and headed back into her home.\n\nA few minutes later, the door reopened and the witch came back with an Earth Apple in her hand.");
  pgs[25] = new Page("Relieved and excited, Kiki thanked the witch, nudging the witch's legs with her head and body.\n\n\"Take care on your way back!\" exclaimed the witch as she waved goodbye.");
  pgs[26] = new Page("Feeling proud, Kiki hurriedly made her way back home, expecting praise from her master.\n\nThe sun had started to fall and after quite a long journey, Kiki could finally see the warm light\npouring out the windows of her home as she stepped onto the front porch.");
  pgs[27] = new Page("\"I'm home!\" Kiki called as she entered the house through her cat door.\n\n\"Welcome home, Kiki\" her master exclaimed, scooping the cat up into a warm hug.\nKiki melted in her master's arms and purred in content. \"You did such an amazing job!\"");
  pgs[28] = new Page(img28, "Kiki rested next to the fireplace while her master prepared her Earth Apple recipe.\n\nKiki was exhausted from her adventure and also quite hungry as her treats had been eaten by the dog.");
  pgs[29] = new Page("Finally, her master's creation was finished and Kiki began to salivate as the sweet smell hit her nose.\n\nShe dragged her tired paws to the kitchen and there it was in the middle of the table.");
  pgs[30] = new Page(img30, "Master's homemade apple pie!");
  pgs[31] = new Page("Kiki picked up the scent of her house and made her way back down the path toward her master.\nWhen Kiki arrived, her master welcomed her with a smile and a hug.\n\n\"Welcome back, Kiki! We can get an Earth Apple together another time.\"\n\nMaybe Kiki wasn't quite ready for such an adventure on her own yet.");
  
  
}

void draw() {
  background(#fff1e6);
  
  // display text
  fill(0);
  text(pgs[currPg].text, width/2, height/3);
  
  // display picture
  if (pgs[currPg].img != null) {
    image(pgs[currPg].img, width/2, height/4.3, 100, 100);
  }
  
  // display choices
  fill(#bdb2ff);
  if (pgs[currPg].choices != null) {
    float h = 0;
    for ( int i = 0; i < pgs[currPg].choices.length; i++) {
      text(pgs[currPg].choices[i], width/2, height/2 + h);
      h += 50;
    }
  }

  // display navigation buttons
  fill(#bdb2ff);
  if (currPg == 1) {  // only have >>> button on title page
    text(">>>", width/2, height/1.4);
  } else if (currPg == 30) {  // replace buttons with play again for last page
    text("play again", width/2, height/1.4);
  } else if (currPg == pgs.length-1) {  // replace button with play again for last/give up page
    text("play again", width/2, height/1.4);
    text("<<<", width/2, height/1.25);
  } else if (pgs[currPg].choices != null) {  // only have <<< button for choices page
    text("<<<", width/2, height/1.25);
  } else {  // normal text page
    text(">>>", width/2, height/1.4);
    text("<<<", width/2, height/1.25);
  }
  
  // skip to page after picking path pg depending on path picked
  if (path == "paved" && resetPath == false) {
    lastPg = currPg;
    currPg = 11;
    resetPath = true;
  } else if (path == "dirt" && resetPath == false) {
    lastPg = currPg;
    currPg = 12;
    resetPath = true;
  }
  
  // skip to page after picking dog action depending on action picked
  if (dogAction == "climb tree" && resetDogAction == false) {
    lastPg = currPg;
    currPg = 15;
    resetDogAction = true;
  } else if (dogAction == "throw treats1" && resetDogAction == false || dogAction == "throw treats2" && resetDogAction == false) {
    lastPg = currPg;
    currPg = 17;
    resetDogAction = true;
  }
  
  // skip to page after picking to go home/give up
  if (goHome == true) {
    lastPg = currPg;
    currPg = 31;
    goHome = false;
  }
  
  // points to test placement of clicks
  //strokeWeight(5);
  //point(width/2.12, height/1.38);
  //point(width/2.12, height/1.46);
  //point(width/1.9, height/1.38);
  //point(width/1.9, height/1.46);
  //point(width/2.12, height/1.22);
  //point(width/2.12, height/1.3);
  //point(width/1.9, height/1.22);
  //point(width/1.9, height/1.3);
  //point(width/2.3, height/2+10);
  //point(width/2.3, height/2-20);
  //point(width/1.77, height/2+10);
  //point(width/1.77, height/2-20);
  //point(width/2.3, height/2+60);
  //point(width/2.3, height/2+30);
  //point(width/1.77, height/2+60);
  //point(width/1.77, height/2+30);
  //point(width/2.3, height/2+110);
  //point(width/2.3, height/2+80);
  //point(width/1.77, height/2+110);
  //point(width/1.77, height/2+80);
  
}

// mouse clicked function for buttons
void mouseClicked() {
  if (mouseX > width/2.12 && mouseX < width/1.9 && mouseY < height/1.38 && mouseY > height/1.46 && pgs[currPg].choices==null) {  // if >>> is clicked
    if (currPg == pgs.length-1 || currPg == 30) {  // start over
      currPg = 1;
    } else {
      lastPg = currPg;
      if (currPg == 11) {  // skip alt scene/pgs
        currPg = 13;
      } else if (currPg == 17 && path == "dirt") { // skip alt scene/pgs
        currPg = 22;
      } else if (currPg == 21) {  // skip alt scene/pgs
        currPg = 26;
      } else {
        currPg++;
      }
    }
  } else if (mouseX > width/2.12 && mouseX < width/1.9 && mouseY < height/1.22 && mouseY > height/1.3) {  // if <<< is clicked
    if (currPg == 13) {  // skip alt scene/pgs
      if (path == "paved") {
        currPg = 11;
        lastPg = currPg-1;
      } else if (path == "dirt") {  // make lastPg skip alt scene/pgs
        currPg = 12;
        lastPg = 10;
      }
    } else if (currPg == 17 && dogAction == "throw treats1") {  // skip alt scene/pgs
        currPg = 14;
        lastPg = currPg-1;
    } else if (currPg == 22) {  // skip alt scenes/pgs
        currPg = 17;
        if (dogAction == "throw treats1") {  // throw treats1 is the first choice of dogAction of throwing treats
          lastPg = 14;
        } else if (dogAction == "throw treats2") {  // throw treats2 is the second choice of dogAction of throwing treats
          lastPg = currPg-1;
        }
    } else {  // normal <<< just goes back one pg
      currPg = lastPg;
      lastPg = currPg-1;
    }
  } else if (pgs[currPg].choices != null) {  // if choices page
    if (mouseX > width/2.3 && mouseX < width/1.77 && mouseY < height/2+10 && mouseY > height/2-20) {  // if first choice is clicked
      if (currPg == 10) {
        path = "paved";
        resetPath = false;
        //println(path);
      } else if (currPg == 14) {
        dogAction = "climb tree";
        resetDogAction = false;
      } else if (currPg == 16) {
        dogAction = "throw treats2";
        resetDogAction = false;
      }
    } else if (mouseX > width/2.3 && mouseX < width/1.77 && mouseY < height/2+60 && mouseY > height/2+30) {  // if second choice is clicked
      if (currPg == 10) {
        path = "dirt";
        resetPath = false;
        //println(path);
      } else if (currPg == 14) {
        dogAction = "throw treats1";
        resetDogAction = false;
      } else if (currPg == 16) {
        goHome = true;
      }
    } else if (mouseX > width/2.3 && mouseX < width/1.77 && mouseY < height/2+110 && mouseY > height/2+80) {  // if third choice is clicked
      if (currPg == 10 || currPg == 14) {
        goHome = true;
      }
    }
  }
}

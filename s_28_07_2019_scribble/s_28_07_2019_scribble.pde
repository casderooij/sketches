ArrayList<Scribble> sList;
PFont times;
String words = "Colonies always motile; spherical to sub-spherical, with 32-128 cells lying some distance from one another just within the periphery of the homogeneous, hyaline, gelatinous, colonial envelope and not connected by cytoplasmic strands. Cells differentiated into those that are purely vegetative in character and those capable of dividing to form daughter colonies. All but four cells of the colony reproductive or about half reproductive and half vegetative. Cells spherical to ovoid in shape. Vegetative cells with a cup-shaped chloroplast containing one pyrenoid; a large anterior eyespot; two cilia of equal length with two contractile vacuoles at their base. Reproductive cells at first like the vegetative cells, later with a more massive chloroplast that eventually contains several pyrenoids. The eyespot and cilia of reproductive cells disappearing when they are mature."; 

void setup () {
  size(500, 500);
  pixelDensity(2);
  
  times = createFont("Times-Roman", 32);
  textFont(times);
  
  sList = new ArrayList<Scribble>();
}

void draw () {
  background(255);
  
  fill(0, 100, 255);
  text(words, -10, -20, 600, 550);
  
  for (Scribble s : sList) {
    s.display();
  }
}

void mouseClicked () {
  sList.add(new Scribble(mouseX, mouseY));
}

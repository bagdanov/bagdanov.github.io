import java.awt.Rectangle; 

class QuitButton extends LabelButton {
  QuitButton(Rectangle extent) {
    super("Quit!", extent);
  }
  void onClick() {
    exit();
  }
}

// A label button for quit.
QuitButton quitButton;
LabelButton fooButton;

// Default window size, and create one button.
void setup() {
  size(256, 256);
  quitButton = new QuitButton(new Rectangle(50, 10, 80, 80));
  fooButton  = new LabelButton("Foo!", new Rectangle(100, 100, 50, 50));
}

// Draw calls Widget rendering loop each frame.
void draw() {
  background(100, 100, 100);
  GUI.drawWidgets();
}

// On mouse click make sure all Widgets are checked for click too.
void mouseClicked() {
  GUI.clickWidgets(mouseX, mouseY);
}

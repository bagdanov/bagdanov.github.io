import java.awt.Rectangle; 

// GUI container class.
static class GUI {
  static ArrayList<Widget> widgets;
  static { widgets = new ArrayList<Widget>(); }
  static void drawWidgets() {
    for (Widget w : widgets) { w.drawMe(); }
  }

  static void clickWidgets(int mx, int my) {
    for (Widget w : widgets) {
      if (w.extent.contains(mx, my)) { w.onClick(); }
    }
  }
}

// Abstract base class for all drawable UI components.
abstract class Widget {
  Rectangle extent;

  // Add the created Widget to the GUI list of active Widgets.
  Widget() { GUI.widgets.add(this); }

  // A Widget must implement a draw and click method.
  abstract void drawMe();
  abstract void onClick();
}

// Minimal button: a text label and click stump.
class LabelButton extends Widget {
  String labelText;
  int textSize;
  LabelButton(String text, Rectangle buttonExtent) {
    extent = buttonExtent;
    labelText = text;
    textSize = 24;
  }

  // Just print the label in upper left corner of box.
  void drawMe() {
    fill(200, 10, 0);
    rect(extent.x, extent.y, extent.width, extent.height);
    fill(0, 0, 0);
    float tx = extent.x + (extent.width - textWidth(labelText))/2;
    textSize(textSize);
    int ty = extent.y + (extent.height - textSize)/2;
    text(labelText, tx, ty, extent.width, extent.height);
  }

  // User should override this.
  void onClick() { println("not implemented"); }
}


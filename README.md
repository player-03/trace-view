# Trace View
Displays trace statements inside an OpenFL app, to save you the trouble of viewing the log.

## Usage

The simplest option is `TraceView.enable()`, which makes traces show up on top of the rest of the game. If you want more control over where they show up, you can choose where to put the view:

```haxe
var view:TraceView = new TraceView(CONSOLE_COLOR, CONSOLE_FONT);

view.width = 200;
view.height = 300;
view.selectable = true;
view.border = true;

consoleTab.addChild(view);
```

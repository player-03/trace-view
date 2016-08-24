# Trace View
Displays trace statements inside an OpenFL app, to save you the trouble of viewing the log.

## Usage

The simplest option is `TraceView.enable()`, which sets everything up with default settings. It also makes traces show up on top of everything else in your app.

If you want more control, you can create and modify the TraceView object yourself. It's a text field, with all of the options that implies:

```haxe
var view:TraceView = new TraceView(CONSOLE_COLOR, CONSOLE_FONT);

view.width = 200;
view.height = 300;
view.selectable = true;
view.border = true;

consoleTab.addChild(view);
```

package com.player03.traceview;

import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;

class TraceView extends TextField {
	/**
	 * Sets up a TraceView using the simplest settings.
	 */
	public static function enable(?textColor:Int = 0x000000, ?font:String):TraceView {
		var view:TraceView = new TraceView(textColor, font);
		Lib.current.stage.addChild(view);
		return view;
	}
	
	public function new(?textColor:Int = 0x000000, ?font:String, ?width:Float, ?height:Float) {
		super();
		
		if(width == null) {
			width = Lib.current.stage.stageWidth;
		}
		this.width = width;
		
		if(height == null) {
			height = Lib.current.stage.stageHeight;
		}
		this.height = height;
		
		mouseEnabled = false;
		wordWrap = true;
		defaultTextFormat = new TextFormat(font, 24, textColor);
		embedFonts = font != null;
		
		TraceEventDispatcher.instance.addEventListener(TraceEvent.TRACE, onTrace);
	}
	
	private function onTrace(event:TraceEvent):Void {
		appendText(event.content + "\n");
		
		if(maxScrollV > 10) {
			var text:String = this.text;
			var cutoff:Int = 0;
			for(i in 0...10) {
				cutoff = text.indexOf(
					#if flash "\r" #else "\n" #end,
					cutoff) + 1;
			}
			this.text = text.substr(cutoff);
		}
		
		scrollV = maxScrollV;
	}
	
	public inline function clear():Void {
		text = "";
	}
}

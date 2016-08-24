package com.player03.traceview;

import flash.events.Event;
import haxe.PosInfos;

class TraceEvent extends Event {
	public static inline var TRACE:String = "trace";
	
	public var content:String;
	
	public function new(value:Dynamic, posInfos:PosInfos, ?bubbles:Bool = false, ?cancelable:Bool = false) {
		super(TRACE, bubbles, cancelable);
		
		if(posInfos == null) {
			content = Std.string(value);
		} else {
			content = '${posInfos.fileName}:${posInfos.lineNumber}: '
					+ Std.string(value);
		}
	}
	
	public override function clone():Event {
		return new TraceEvent(content, null, bubbles, cancelable);
	}
	
	public override function toString():String {
		return '[TraceEvent content=$content]';
	}
}

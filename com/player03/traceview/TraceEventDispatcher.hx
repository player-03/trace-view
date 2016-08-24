package com.player03.traceview;

import flash.events.Event;
import flash.events.EventDispatcher;
import haxe.Log;
import haxe.PosInfos;

class TraceEventDispatcher extends EventDispatcher {
	public static var instance(get, null):TraceEventDispatcher;
	private static function get_instance():TraceEventDispatcher {
		if(instance == null) {
			instance = new TraceEventDispatcher();
		}
		return instance;
	}
	
	private var oldTrace:Dynamic -> PosInfos -> Void;
	
	private function new() {
		super();
		
		oldTrace = Log.trace;
		Log.trace = newTrace;
	}
	
	private function newTrace(value:Dynamic, ?posInfos:PosInfos):Void {
		oldTrace(value, posInfos);
		
		dispatchEvent(new TraceEvent(value, posInfos));
	}
}

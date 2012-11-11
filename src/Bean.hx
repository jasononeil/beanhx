/****
* ORIGINAL LIBRARY:
* Bean - copyright (c) Jacob Thornton 2011-2012
* https://github.com/fat/bean
* MIT license
* 
* Externs by Jason O'Neil 2012.  No further restrictions other than Jacob Thornton's MIT licence on the original source.
****/

#if xirsys_stdjs
import UserAgentContext;
#else 
typedef Node = js.Dom.HtmlDom;
#end 

@:native("bean")
extern class Bean {
	@:overload(function(element:Node, eventType:String, handler:BnEvent->Void):Void{})
	@:overload(function(element:Node, eventType:String, selector:String, handler:BnEvent->Void):Void{})
	@:overload(function(element:Node, eventType:String, handler:BnEvent->Void, args:Array<Dynamic>):Void{})
	static function on(element:Node, eventType:String, selector:String, handler:BnEvent->Void, args:Array<Dynamic>):Void;
	
	@:overload(function(element:Node, eventType:String, handler:BnEvent->Void):Void{})
	@:overload(function(element:Node, eventType:String, selector:String, handler:BnEvent->Void):Void{})
	@:overload(function(element:Node, eventType:String, handler:BnEvent->Void, args:Array<Dynamic>):Void{})
	static function one(element:Node, eventType:String, selector:String, handler:BnEvent->Void, args:Array<Dynamic>):Void;
	
	@:overload(function(element:Node):Void{})
	@:overload(function(element:Node, eventType:String):Void{})
	static function off(element:Node, eventType:String, handler:BnEvent->Void):Void;

	@:overload(function(destElement:Node, srcElement:Node):Void{})
	static function clone(destElement:Node, srcElement:Node, eventType:String):Void;

	@:overload(function(element:Node, eventType:String):Void{})
	static function fire(element:Node, eventType:String, args:Array<Dynamic>):Void;

	@:overload(function(element:Node, eventType:String):Void{})
	static function setSelectorEngine(element:Node, eventType:String, args:Array<Dynamic>):Void;

	// Include the minified JS file.
	private static function __init__() : Void {
		#if !noEmbedJS
			#if debug
				haxe.macro.Tools.includeFile("bean.js");
			#else
				haxe.macro.Tools.includeFile("bean.min.js");
			#end
		#end
	}
}
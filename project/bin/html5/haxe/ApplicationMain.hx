import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new MyPreLoader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("styles/default/circle.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/default/collapse.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/default/cross.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/default/expand.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/default/up_down.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_down.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_down_dark.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_down_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_left.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_left_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_right.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_right2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_right_dark.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_right_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/arrow_up_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/circle_dark.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/cross_dark.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/cross_dark_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/gripper_horizontal.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/gripper_horizontal_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/gripper_vertical.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/gradient/gripper_vertical_disabled.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/checkbox.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/container.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/down_arrow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/hscroll_thumb_gripper_down.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/hscroll_thumb_gripper_over.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/hscroll_thumb_gripper_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/left_arrow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/right_arrow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/up_arrow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/vscroll_thumb_gripper_down.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/vscroll_thumb_gripper_over.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/glyphs/vscroll_thumb_gripper_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/hprogress.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/hscroll.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/listview.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/optionbox.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/popup.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/tab.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/textinput.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/vprogress.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/windows/vscroll.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/slinky.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/slinky_large.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/slinky_small.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("img/slinky_tiny.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("fonts/Oxygen-Bold.eot");
		types.push (AssetType.BINARY);
		
		
		urls.push ("fonts/Oxygen-Bold.svg");
		types.push (AssetType.TEXT);
		
		
		urls.push ("fonts/Oxygen-Bold.ttf");
		types.push (AssetType.FONT);
		
		
		urls.push ("fonts/Oxygen-Bold.woff");
		types.push (AssetType.BINARY);
		
		
		urls.push ("fonts/Oxygen.eot");
		types.push (AssetType.BINARY);
		
		
		urls.push ("fonts/Oxygen.svg");
		types.push (AssetType.TEXT);
		
		
		urls.push ("fonts/Oxygen.ttf");
		types.push (AssetType.FONT);
		
		
		urls.push ("fonts/Oxygen.woff");
		types.push (AssetType.BINARY);
		
		
		urls.push ("embed/exampleTile4.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("embed/lightPoint.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("embed/logo1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("embed/logo2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("embed/thinkido.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/bg.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/fire2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/flower_buttom2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/flower_top2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/font.fnt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/font_0.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/loaddesc.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/loading_top.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/logo.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/operateCoat.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/operateImage.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/sha.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/skill1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/skill2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/skill3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/skill4.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/track.png");
		types.push (AssetType.IMAGE);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (_) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (0),
			fullscreen: false,
			height: Std.int (480),
			orientation: "",
			resizable: true,
			stencilBuffer: false,
			title: "demo",
			vsync: false,
			width: Std.int (800),
			
		}
		
		#if js
		#if munit
		flash.Lib.embed (null, 800, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


#if flash @:build(DocumentClass.buildFlash())
#else @:build(DocumentClass.build()) #end
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					this.stage = flash.Lib.current.stage;
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
	macro public static function buildFlash ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				var method = macro {
					return flash.Lib.current.stage;
				}
				
				fields.push ({ name: "get_stage", access: [ APrivate ], meta: [ { name: ":getter", params: [ macro stage ], pos: Context.currentPos() } ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
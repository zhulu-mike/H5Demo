package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("img/slinky.jpg", __ASSET__img_slinky_jpg);
		type.set ("img/slinky.jpg", AssetType.IMAGE);
		className.set ("img/slinky_large.jpg", __ASSET__img_slinky_large_jpg);
		type.set ("img/slinky_large.jpg", AssetType.IMAGE);
		className.set ("img/slinky_small.jpg", __ASSET__img_slinky_small_jpg);
		type.set ("img/slinky_small.jpg", AssetType.IMAGE);
		className.set ("img/slinky_tiny.jpg", __ASSET__img_slinky_tiny_jpg);
		type.set ("img/slinky_tiny.jpg", AssetType.IMAGE);
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		className.set ("embed/exampleTile4.jpg", __ASSET__embed_exampletile4_jpg);
		type.set ("embed/exampleTile4.jpg", AssetType.IMAGE);
		className.set ("embed/lightPoint.png", __ASSET__embed_lightpoint_png);
		type.set ("embed/lightPoint.png", AssetType.IMAGE);
		className.set ("embed/logo1.png", __ASSET__embed_logo1_png);
		type.set ("embed/logo1.png", AssetType.IMAGE);
		className.set ("embed/logo2.png", __ASSET__embed_logo2_png);
		type.set ("embed/logo2.png", AssetType.IMAGE);
		className.set ("embed/thinkido.png", __ASSET__embed_thinkido_png);
		type.set ("embed/thinkido.png", AssetType.IMAGE);
		className.set ("assets/bg.jpg", __ASSET__assets_bg_jpg);
		type.set ("assets/bg.jpg", AssetType.IMAGE);
		className.set ("assets/fire2.png", __ASSET__assets_fire2_png);
		type.set ("assets/fire2.png", AssetType.IMAGE);
		className.set ("assets/flower_buttom2.png", __ASSET__assets_flower_buttom2_png);
		type.set ("assets/flower_buttom2.png", AssetType.IMAGE);
		className.set ("assets/flower_top2.png", __ASSET__assets_flower_top2_png);
		type.set ("assets/flower_top2.png", AssetType.IMAGE);
		className.set ("assets/font.fnt", __ASSET__assets_font_fnt);
		type.set ("assets/font.fnt", AssetType.TEXT);
		className.set ("assets/font_0.png", __ASSET__assets_font_0_png);
		type.set ("assets/font_0.png", AssetType.IMAGE);
		className.set ("assets/loaddesc.png", __ASSET__assets_loaddesc_png);
		type.set ("assets/loaddesc.png", AssetType.IMAGE);
		className.set ("assets/loading_top.png", __ASSET__assets_loading_top_png);
		type.set ("assets/loading_top.png", AssetType.IMAGE);
		className.set ("assets/logo.png", __ASSET__assets_logo_png);
		type.set ("assets/logo.png", AssetType.IMAGE);
		className.set ("assets/operateCoat.png", __ASSET__assets_operatecoat_png);
		type.set ("assets/operateCoat.png", AssetType.IMAGE);
		className.set ("assets/operateImage.png", __ASSET__assets_operateimage_png);
		type.set ("assets/operateImage.png", AssetType.IMAGE);
		className.set ("assets/sha.png", __ASSET__assets_sha_png);
		type.set ("assets/sha.png", AssetType.IMAGE);
		className.set ("assets/skill1.png", __ASSET__assets_skill1_png);
		type.set ("assets/skill1.png", AssetType.IMAGE);
		className.set ("assets/skill2.png", __ASSET__assets_skill2_png);
		type.set ("assets/skill2.png", AssetType.IMAGE);
		className.set ("assets/skill3.png", __ASSET__assets_skill3_png);
		type.set ("assets/skill3.png", AssetType.IMAGE);
		className.set ("assets/skill4.png", __ASSET__assets_skill4_png);
		type.set ("assets/skill4.png", AssetType.IMAGE);
		className.set ("assets/track.png", __ASSET__assets_track_png);
		type.set ("assets/track.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "styles/default/circle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/collapse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/cross.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/expand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/up_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/circle_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/checkbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/listview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/optionbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/textinput.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/slinky.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/slinky_large.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/slinky_small.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/slinky_tiny.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "fonts/Oxygen-Bold.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen-Bold.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__fonts_oxygen_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen-Bold.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen.ttf";
		className.set (id, __ASSET__fonts_oxygen_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "embed/exampleTile4.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "embed/lightPoint.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "embed/logo1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "embed/logo2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "embed/thinkido.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bg.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/fire2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/flower_buttom2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/flower_top2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/font.fnt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/font_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/loaddesc.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/loading_top.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/operateCoat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/operateImage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sha.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/skill1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/skill2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/skill3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/skill4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/track.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		#else
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("img/slinky.jpg", __ASSET__img_slinky_jpg);
		type.set ("img/slinky.jpg", AssetType.IMAGE);
		
		className.set ("img/slinky_large.jpg", __ASSET__img_slinky_large_jpg);
		type.set ("img/slinky_large.jpg", AssetType.IMAGE);
		
		className.set ("img/slinky_small.jpg", __ASSET__img_slinky_small_jpg);
		type.set ("img/slinky_small.jpg", AssetType.IMAGE);
		
		className.set ("img/slinky_tiny.jpg", __ASSET__img_slinky_tiny_jpg);
		type.set ("img/slinky_tiny.jpg", AssetType.IMAGE);
		
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		
		className.set ("embed/exampleTile4.jpg", __ASSET__embed_exampletile4_jpg);
		type.set ("embed/exampleTile4.jpg", AssetType.IMAGE);
		
		className.set ("embed/lightPoint.png", __ASSET__embed_lightpoint_png);
		type.set ("embed/lightPoint.png", AssetType.IMAGE);
		
		className.set ("embed/logo1.png", __ASSET__embed_logo1_png);
		type.set ("embed/logo1.png", AssetType.IMAGE);
		
		className.set ("embed/logo2.png", __ASSET__embed_logo2_png);
		type.set ("embed/logo2.png", AssetType.IMAGE);
		
		className.set ("embed/thinkido.png", __ASSET__embed_thinkido_png);
		type.set ("embed/thinkido.png", AssetType.IMAGE);
		
		className.set ("assets/bg.jpg", __ASSET__assets_bg_jpg);
		type.set ("assets/bg.jpg", AssetType.IMAGE);
		
		className.set ("assets/fire2.png", __ASSET__assets_fire2_png);
		type.set ("assets/fire2.png", AssetType.IMAGE);
		
		className.set ("assets/flower_buttom2.png", __ASSET__assets_flower_buttom2_png);
		type.set ("assets/flower_buttom2.png", AssetType.IMAGE);
		
		className.set ("assets/flower_top2.png", __ASSET__assets_flower_top2_png);
		type.set ("assets/flower_top2.png", AssetType.IMAGE);
		
		className.set ("assets/font.fnt", __ASSET__assets_font_fnt);
		type.set ("assets/font.fnt", AssetType.TEXT);
		
		className.set ("assets/font_0.png", __ASSET__assets_font_0_png);
		type.set ("assets/font_0.png", AssetType.IMAGE);
		
		className.set ("assets/loaddesc.png", __ASSET__assets_loaddesc_png);
		type.set ("assets/loaddesc.png", AssetType.IMAGE);
		
		className.set ("assets/loading_top.png", __ASSET__assets_loading_top_png);
		type.set ("assets/loading_top.png", AssetType.IMAGE);
		
		className.set ("assets/logo.png", __ASSET__assets_logo_png);
		type.set ("assets/logo.png", AssetType.IMAGE);
		
		className.set ("assets/operateCoat.png", __ASSET__assets_operatecoat_png);
		type.set ("assets/operateCoat.png", AssetType.IMAGE);
		
		className.set ("assets/operateImage.png", __ASSET__assets_operateimage_png);
		type.set ("assets/operateImage.png", AssetType.IMAGE);
		
		className.set ("assets/sha.png", __ASSET__assets_sha_png);
		type.set ("assets/sha.png", AssetType.IMAGE);
		
		className.set ("assets/skill1.png", __ASSET__assets_skill1_png);
		type.set ("assets/skill1.png", AssetType.IMAGE);
		
		className.set ("assets/skill2.png", __ASSET__assets_skill2_png);
		type.set ("assets/skill2.png", AssetType.IMAGE);
		
		className.set ("assets/skill3.png", __ASSET__assets_skill3_png);
		type.set ("assets/skill3.png", AssetType.IMAGE);
		
		className.set ("assets/skill4.png", __ASSET__assets_skill4_png);
		type.set ("assets/skill4.png", AssetType.IMAGE);
		
		className.set ("assets/track.png", __ASSET__assets_track_png);
		type.set ("assets/track.png", AssetType.IMAGE);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif js
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif js
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif js
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if js
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind class __ASSET__styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__img_slinky_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__img_slinky_large_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__img_slinky_small_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__img_slinky_tiny_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__fonts_oxygen_bold_eot extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_bold_svg extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_bold_ttf extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_bold_woff extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_eot extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_svg extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_ttf extends null { }
@:keep @:bind class __ASSET__fonts_oxygen_woff extends null { }
@:keep @:bind class __ASSET__embed_exampletile4_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__embed_lightpoint_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__embed_logo1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__embed_logo2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__embed_thinkido_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_bg_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_fire2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_flower_buttom2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_flower_top2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_font_fnt extends null { }
@:keep @:bind class __ASSET__assets_font_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_loaddesc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_loading_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_operatecoat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_operateimage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_sha_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_skill1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_skill2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_skill3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_skill4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind class __ASSET__assets_track_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

#if openfl



















































@:keep class __ASSET__fonts_oxygen_bold_ttf extends openfl.text.Font { public function new () { super (); fontName = "fonts/Oxygen-Bold.ttf"; } } 



@:keep class __ASSET__fonts_oxygen_ttf extends openfl.text.Font { public function new () { super (); fontName = "fonts/Oxygen.ttf"; } } 
























#end

#elseif (windows || mac || linux)


//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/default/circle.png") class __ASSET__styles_default_circle_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/default/collapse.png") class __ASSET__styles_default_collapse_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/default/cross.png") class __ASSET__styles_default_cross_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/default/expand.png") class __ASSET__styles_default_expand_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/default/up_down.png") class __ASSET__styles_default_up_down_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_down.png") class __ASSET__styles_gradient_arrow_down_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_down_dark.png") class __ASSET__styles_gradient_arrow_down_dark_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_down_disabled.png") class __ASSET__styles_gradient_arrow_down_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_left.png") class __ASSET__styles_gradient_arrow_left_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_left_disabled.png") class __ASSET__styles_gradient_arrow_left_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_right.png") class __ASSET__styles_gradient_arrow_right_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_right2.png") class __ASSET__styles_gradient_arrow_right2_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_right_dark.png") class __ASSET__styles_gradient_arrow_right_dark_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_right_disabled.png") class __ASSET__styles_gradient_arrow_right_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_up.png") class __ASSET__styles_gradient_arrow_up_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/arrow_up_disabled.png") class __ASSET__styles_gradient_arrow_up_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/circle_dark.png") class __ASSET__styles_gradient_circle_dark_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/cross_dark.png") class __ASSET__styles_gradient_cross_dark_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/cross_dark_disabled.png") class __ASSET__styles_gradient_cross_dark_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/gripper_horizontal.png") class __ASSET__styles_gradient_gripper_horizontal_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/gripper_horizontal_disabled.png") class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/gripper_vertical.png") class __ASSET__styles_gradient_gripper_vertical_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/gradient/gripper_vertical_disabled.png") class __ASSET__styles_gradient_gripper_vertical_disabled_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/button.png") class __ASSET__styles_windows_button_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/checkbox.png") class __ASSET__styles_windows_checkbox_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/container.png") class __ASSET__styles_windows_container_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/down_arrow.png") class __ASSET__styles_windows_glyphs_down_arrow_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/hscroll_thumb_gripper_down.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/hscroll_thumb_gripper_over.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/hscroll_thumb_gripper_up.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/left_arrow.png") class __ASSET__styles_windows_glyphs_left_arrow_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/right_arrow.png") class __ASSET__styles_windows_glyphs_right_arrow_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/up_arrow.png") class __ASSET__styles_windows_glyphs_up_arrow_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/vscroll_thumb_gripper_down.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/vscroll_thumb_gripper_over.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/glyphs/vscroll_thumb_gripper_up.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/hprogress.png") class __ASSET__styles_windows_hprogress_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/hscroll.png") class __ASSET__styles_windows_hscroll_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/listview.png") class __ASSET__styles_windows_listview_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/optionbox.png") class __ASSET__styles_windows_optionbox_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/popup.png") class __ASSET__styles_windows_popup_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/tab.png") class __ASSET__styles_windows_tab_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/textinput.png") class __ASSET__styles_windows_textinput_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/vprogress.png") class __ASSET__styles_windows_vprogress_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/styles/windows/vscroll.png") class __ASSET__styles_windows_vscroll_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/img/slinky.jpg") class __ASSET__img_slinky_jpg extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/img/slinky_large.jpg") class __ASSET__img_slinky_large_jpg extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/img/slinky_small.jpg") class __ASSET__img_slinky_small_jpg extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/haxeui/1,5,10/img/slinky_tiny.jpg") class __ASSET__img_slinky_tiny_jpg extends openfl.display.BitmapData {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen-Bold.eot") class __ASSET__fonts_oxygen_bold_eot extends lime.utils.ByteArray {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen-Bold.svg") class __ASSET__fonts_oxygen_bold_svg extends lime.utils.ByteArray {}
//@:font("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen-Bold.ttf") class __ASSET__fonts_oxygen_bold_ttf extends openfl.text.Font {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen-Bold.woff") class __ASSET__fonts_oxygen_bold_woff extends lime.utils.ByteArray {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen.eot") class __ASSET__fonts_oxygen_eot extends lime.utils.ByteArray {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen.svg") class __ASSET__fonts_oxygen_svg extends lime.utils.ByteArray {}
//@:font("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen.ttf") class __ASSET__fonts_oxygen_ttf extends openfl.text.Font {}
//@:file("/usr/lib/haxe/lib/haxeui/1,5,10/fonts/Oxygen.woff") class __ASSET__fonts_oxygen_woff extends lime.utils.ByteArray {}
//@:bitmap("embed/exampleTile4.jpg") class __ASSET__embed_exampletile4_jpg extends openfl.display.BitmapData {}
//@:bitmap("embed/lightPoint.png") class __ASSET__embed_lightpoint_png extends openfl.display.BitmapData {}
//@:bitmap("embed/logo1.png") class __ASSET__embed_logo1_png extends openfl.display.BitmapData {}
//@:bitmap("embed/logo2.png") class __ASSET__embed_logo2_png extends openfl.display.BitmapData {}
//@:bitmap("embed/thinkido.png") class __ASSET__embed_thinkido_png extends openfl.display.BitmapData {}
//@:bitmap("assets/bg.jpg") class __ASSET__assets_bg_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/fire2.png") class __ASSET__assets_fire2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/flower_buttom2.png") class __ASSET__assets_flower_buttom2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/flower_top2.png") class __ASSET__assets_flower_top2_png extends openfl.display.BitmapData {}
//@:file("assets/font.fnt") class __ASSET__assets_font_fnt extends lime.utils.ByteArray {}
//@:bitmap("assets/font_0.png") class __ASSET__assets_font_0_png extends openfl.display.BitmapData {}
//@:bitmap("assets/loaddesc.png") class __ASSET__assets_loaddesc_png extends openfl.display.BitmapData {}
//@:bitmap("assets/loading_top.png") class __ASSET__assets_loading_top_png extends openfl.display.BitmapData {}
//@:bitmap("assets/logo.png") class __ASSET__assets_logo_png extends openfl.display.BitmapData {}
//@:bitmap("assets/operateCoat.png") class __ASSET__assets_operatecoat_png extends openfl.display.BitmapData {}
//@:bitmap("assets/operateImage.png") class __ASSET__assets_operateimage_png extends openfl.display.BitmapData {}
//@:bitmap("assets/sha.png") class __ASSET__assets_sha_png extends openfl.display.BitmapData {}
//@:bitmap("assets/skill1.png") class __ASSET__assets_skill1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/skill2.png") class __ASSET__assets_skill2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/skill3.png") class __ASSET__assets_skill3_png extends openfl.display.BitmapData {}
//@:bitmap("assets/skill4.png") class __ASSET__assets_skill4_png extends openfl.display.BitmapData {}
//@:bitmap("assets/track.png") class __ASSET__assets_track_png extends openfl.display.BitmapData {}
//


#end
#end


package com.kunpeng.managers;
import String;
import openfl.geom.Rectangle;
import openfl.geom.Point;
import String;
import openfl.display.BitmapData;
import bitmapFont.BitmapFont;
import openfl.errors.Error;
import haxe.ds.StringMap;
class BitmapFontManager {
    public function new() {
    }

    private static var fonts:StringMap<BitmapFont> = new StringMap<BitmapFont>();

    public static function getFontByName(fontName:String):BitmapFont
    {
        return fonts.get(fontName);

    }

    public static function registerFontFromAngleCode(fontName:String, sourece:BitmapData, data:Xml):Void
    {

        if (fonts.exists(fontName))
        {
            return;
            throw new Error("fontname"+fontName+" was exist, can't register again");
        }else{
            var bf:BitmapFont = BitmapFont.fromAngelCode(sourece,data);
            fonts.set(fontName, bf);
        }
    }

    public static function registerFontFromMonospace(fontName:String,key:String, source:BitmapData, letters:String = null, charSize:Point, region:Rectangle = null, spacing:Point = null):Void
    {
        if (fonts.exists(fontName))
        {
            return;
            throw new Error("fontname"+fontName+" was exist, can't register again");
        }else{
            var bf:BitmapFont = BitmapFont.fromMonospace(key,source,letters,charSize,region,spacing);
            fonts.set(fontName, bf);
        }
    }

    public static function registerFontFromXNA(fontName:String,key:String, source:BitmapData, letters:String = null, glyphBGColor:Int = 0x00000000):Void
    {
        if (fonts.exists(fontName))
        {
            return;
            throw new Error("fontname"+fontName+" was exist, can't register again");
        }else{
            var bf:BitmapFont = BitmapFont.fromXNA(key,source,letters,glyphBGColor);
            fonts.set(fontName, bf);
        }
    }
}

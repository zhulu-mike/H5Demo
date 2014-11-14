package ;
import bitmapFont.BitmapTextAlign;
import com.kunpeng.datas.BitmapFontName;
import com.kunpeng.managers.BitmapFontManager;
import openfl.Assets;
import openfl.display.BitmapData;
import bitmapFont.BitmapTextField;
import openfl.display.Sprite;
class BitmapFontTest extends Sprite{

    private var fontBMD:BitmapData;
    private var fontXML:Xml;
    private var desc:BitmapTextField;
    public function new() {
        super();
//        Assets.loadBitmapData("assets/font_0.png",handleFontPng);
//        Assets.loadText("assets/font.fnt",handleFont);

        registerFont();
    }

    private function handleFontPng(bm:BitmapData):Void
    {
        fontBMD = bm;
        registerFont();
    }

    private function handleFont(data:String):Void
    {
        var xml:Xml = Xml.parse(data);
        fontXML = xml;
        registerFont();
    }

    private function registerFont():Void
    {
//        if (fontBMD != null && fontXML != null)
//        {
            trace("register success");
            BitmapFontManager.registerFontFromAngleCode(BitmapFontName.PRELOADER_FONT,fontBMD,fontXML);
//            desc.font = BitmapFontManager.getFontByName(BitmapFontName.PRELOADER_FONT);
            desc = new BitmapTextField(BitmapFontManager.getFontByName(BitmapFontName.PRELOADER_FONT));
            this.addChild(desc);
            desc.x = 382;
            desc.y = 230;
            desc.size = 1;
            desc.alignment = BitmapTextAlign.CENTER;
            desc.text = "11281k爱";
            desc.letterSpacing = 0;
//        }
    }
}

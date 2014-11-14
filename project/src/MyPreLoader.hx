package ;
import Xml;
import openfl.net.URLLoader;
import com.kunpeng.datas.BitmapFontName;
import com.kunpeng.managers.BitmapFontManager;
import bitmapFont.BitmapTextAlign;
import bitmapFont.BitmapTextField;
import bitmapFont.BitmapFont;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.LoaderInfo;
import openfl.net.URLRequest;
import openfl.display.Loader;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Bitmap;
import flash.Lib;
import openfl.display.Sprite;
import openfl.events.Event;

class MyPreLoader  extends NMEPreloader {


    private var desc:BitmapTextField;
    private var bgTop:Bitmap;
    private var bgButtom:Bitmap;
    private var flowerTop:Bitmap;
    private var flowerButtom:Bitmap;
    private var loading:Bitmap;
    private var fire:Bitmap;
    private var progressBar:Sprite;
    private var fontBMD:BitmapData;
    private var fontXML:Xml;

    public function new()
    {

        super();

        progressBar = new Sprite();
        this.addChild(progressBar);
        progressBar.x = 0;
        progressBar.y = 237;

        bgTop = new Bitmap();
        this.addChild(bgTop);

        bgButtom = new Bitmap();

        this.addChild(bgButtom);

        flowerTop = new Bitmap();
        this.addChild(flowerTop);
        flowerTop.x = 297.5;
        flowerTop.y = 204;

        flowerButtom = new Bitmap();
        this.addChild(flowerButtom);
        flowerButtom.x = 297.5;
        flowerButtom.y = 238;

        fire = new Bitmap();
        this.addChild(fire);
        fire.x = 344;
        fire.y = 165;

        loading = new Bitmap();
        this.addChild(loading);
        loading.x = 369;
        loading.y = 210;

        var loader:Loader = new Loader();
        loader.load(new URLRequest("assets/loading_top.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadHand);

        loader = new Loader();
        loader.load(new URLRequest("assets/font_0.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleFontImage);

        var loader2:URLLoader = new URLLoader();
        loader2.load(new URLRequest("assets/font.fnt"));
        loader2.addEventListener(Event.COMPLETE,handleFontXML);

        loader = new Loader();
        loader.load(new URLRequest("assets/flower_top2.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleTopFlower);

        loader = new Loader();
        loader.load(new URLRequest("assets/flower_buttom2.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleButtomFlower);

        loader = new Loader();
        loader.load(new URLRequest("assets/fire2.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleFire);

        loader = new Loader();
        loader.load(new URLRequest("assets/loaddesc.png"));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleDesc);



        desc = new BitmapTextField();
        this.addChild(desc);
        desc.x = 382;
        desc.y = 230;
        desc.size = 5;
        desc.alignment = BitmapTextAlign.CENTER;
        desc.text = "0";
        desc.letterSpacing = 0;
        outline.visible = false;
        progress.visible = false;


    }

    private function handleTopFlower(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            flowerTop.bitmapData = bmd;
        }
    }

    private function handleButtomFlower(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            flowerButtom.bitmapData = bmd;
        }
    }

    private function loadHand(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            bgTop.bitmapData = bmd;
            bgButtom.bitmapData = bmd;
            bgButtom.scaleY = -1;
            bgTop.y = -3;
            bgButtom.y = 482;
            trace(bmd.width);
        }
    }

    private function handleFire(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            fire.bitmapData = bmd;
        }
    }

    private function handleFontImage(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            fontBMD = bmd;
            registerFont();
        }
    }

    private function handleFontXML(evt:Event):Void
    {
        var info:URLLoader = cast(evt.currentTarget,URLLoader);
        var ct:Xml = Xml.parse(cast(info.data, String));
        if (ct == null)
            return;
        fontXML = ct;
        registerFont();
    }

    private function handleDesc(evt:Event):Void
    {
        var info:LoaderInfo = cast(evt.currentTarget,LoaderInfo);
        var ct:Bitmap = cast(info.content, Bitmap);
        if (ct == null)
            return;
        var bmd:BitmapData = ct.bitmapData;
        if (bmd != null)
        {
            loading.bitmapData = bmd;
        }
    }

    private function registerFont():Void
    {
        if (fontBMD != null && fontXML != null)
        {
            trace("register success");
            BitmapFontManager.registerFontFromAngleCode(BitmapFontName.PRELOADER_FONT,fontBMD,fontXML);
//            desc.font = BitmapFontManager.getFontByName(BitmapFontName.PRELOADER_FONT);
//            this.removeChild(desc);
//            desc = new BitmapTextField(BitmapFontManager.getFontByName(BitmapFontName.PRELOADER_FONT));
//            this.addChild(desc);
//            desc.background = true;
//            desc.backgroundColor = 0xffffff;
//            desc.x = 382;
//            desc.y = 230;
//            desc.size = 5;
////            desc.alignment = BitmapTextAlign.CENTER;
//            desc.text = "12";
//            desc.letterSpacing = 0;
        }
    }

    override public function onUpdate(bytesLoaded:Int, bytesTotal:Int)
    {
        super.onUpdate(bytesLoaded,bytesTotal);
        progressBar.graphics.clear;
        progressBar.graphics.beginFill(0xff0000,0.6);
        progressBar.graphics.drawRect(0,0,bytesLoaded/bytesTotal*800,5);
        progressBar.graphics.endFill();
        desc.text = Std.int((bytesLoaded/bytesTotal)*100)+"";
    }

}

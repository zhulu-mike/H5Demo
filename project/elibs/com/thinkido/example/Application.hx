package com.thinkido.example;
import com.thinkido.framework.display.LightPoint;
import flash.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprite;
import com.thinkido.framework.display.RepeatImage;
import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.events.Event;
class Application extends Sprite
{

	public var bg:RepeatImage ;
	public var logo:Bitmap ;	
	public var centerLogo:Bitmap ;	
	private var lp:LightPoint ;
	private var lpBm:Bitmap ;
    private var logoUrl = "embed/logo1.png";
    //private var logoUrl = "embed/logo1.svg";
	//public var centerLogo:Shape ;	
	private var offsetY:Int = -45 ;
		
    public function new()
    {
        super();
		#if flash
			this.addEventListener( Event.ADDED_TO_STAGE , addtoStage ) ;
		#else
			initApp() ;
		#end
        
    }
	private function addtoStage(evt:Event):Void {
		this.removeEventListener( Event.ADDED_TO_STAGE , addtoStage ) ;
		initApp() ;
	}
	public function initApp():Void {
		return;
		bg = new RepeatImage();
		super.addChild( bg ) ;
		
		lp = new LightPoint() ;
		lp.setSize( this.stage.stageWidth , this.stage.stageHeight );
		super.addChild( lp ) ;
		
		lpBm = new Bitmap() ;
		super.addChild( lpBm ) ;	
		
		logo =  new Bitmap(  ) ;
		super.addChild( logo ) ;
		
		centerLogo = new Bitmap();
		addChild( centerLogo ) ;
		
		Assets.loadBitmapData("embed/exampleTile4.jpg", loadTile) ;
//		Assets.loadBitmapData("embed/thinkido.png", loadLogo) ;
		Assets.loadBitmapData(logoUrl, loadCenterLogo ) ;
		#if js
		Assets.loadBitmapData("embed/lightPoint.png", loadLightPoint ) ;
		#end 
		
		//Assets.loadText(logoUrl, loadCenterLogo ) ;
		this.stage.addEventListener( Event.RESIZE , doResize );
	}
	private function loadLightPoint(bmd:BitmapData):Void {
		lpBm.bitmapData = bmd ;	
		lpBm.x = ( this.stage.stageWidth - lpBm.width )/ 2; 
		lpBm.y = ( this.stage.stageHeight - lpBm.height ) / 2 ;
	}
	private function doResize(e:Event):Void 
	{
        setCenterLogoPos();
		bg.setSize( this.stage.stageWidth , this.stage.stageHeight );
		lp.setSize( this.stage.stageWidth , this.stage.stageHeight );
		#if js			
		lpBm.x = ( this.stage.stageWidth - lpBm.width )/ 2; 
		lpBm.y = ( this.stage.stageHeight - lpBm.height ) / 2 ;
		#end 
	}
	private function loadCenterLogo(bmd:BitmapData):Void 
	{
		//var svg:SVG;
		//svg = new SVG(Assets.getText(logoUrl));
		//svg.render(centerLogo.graphics);
		
		centerLogo.bitmapData = bmd ;
		//centerLogo.width = 100 ;
		//centerLogo.height = 100 ;
        setCenterLogoPos();
	}

    private function setCenterLogoPos():Void
    {
        centerLogo.x = ( this.stage.stageWidth - centerLogo.width )/ 2 - offsetY ;
        centerLogo.y = ( this.stage.stageHeight - centerLogo.height ) / 2 - 100;
    }
	
    private function loadLogo(bmd:BitmapData):Void 
	{
		logo.bitmapData = bmd ;
	}	
	private function loadTile(bmd:BitmapData):Void 
	{
		bg.bitmapData = bmd ;
		bg.setSize( this.stage.stageWidth , this.stage.stageHeight );
	}
    
    /**
		 * 每次添加内容放在 logo下面 
		 * @param child
		 * @return 
		 * 
		 */
    override public function addChild(child : DisplayObject) : DisplayObject
    {
        var index : Int = Std.int( Math.max(0, this.numChildren - 1) );
        return addChildAt(child, index);
    }
}

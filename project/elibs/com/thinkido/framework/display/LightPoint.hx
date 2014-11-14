package com.thinkido.framework.display;


import openfl.display.GradientType;
import openfl.display.SpreadMethod;
import openfl.display.Sprite;
import openfl.geom.Matrix;

class LightPoint extends Sprite
{
    public var _colorArr : Array<UInt>;
    public var _spread : SpreadMethod  ;
    public var _type : GradientType ;
    public var _matrix : Matrix;
    public var _radioArr : Array<Dynamic>;
    public var _alphaArr : Array<Dynamic>;
    private var _w : Float = 1;
    private var _h : Float = 1;
    
    public function new()
    {
        super();
        this._type = GradientType.RADIAL ;
        this._colorArr = [0xffffff, 0];
        this._alphaArr = [0.2, 0];
        this._radioArr = [0, 255];
        this._matrix = new Matrix();
        this._spread = SpreadMethod.PAD ;
        return;
    }
    
    private function redraw() : Void
    {
        this._matrix.createGradientBox(this.width, this.height);
        this.graphics.clear();
        this.graphics.lineStyle(1, 0, 0);
        this.graphics.beginGradientFill(this._type, this._colorArr, this._alphaArr, this._radioArr, this._matrix, this._spread);
        this.graphics.drawRect(0, 0, this.width, this.height);
        this.graphics.endFill();
        return;
    }
    #if flash 
	@:setter(height) private function set_height(height:Float):Void 
	{ 
		this._h = height;
        this.redraw();        
	}
	@:getter(height)  private function get_height() : Float
    {
        return this._h;
    }
    
    @:getter(width)  private function get_width() : Float
    {
        return this._w;
    }
    
    @:setter(width)  private function set_width(width : Float) : Void
    {
        this._w = width;
        this.redraw();
    }    
	#elseif js // Overriding native x setter.
	override private function set_height(height : Float) : Float
    {
        this._h = height;
        this.redraw();
        return height;
    }   
    
    override private function get_height() : Float
    {
        return this._h;
    }
    
    override private function get_width() : Float
    {
        return this._w;
    }
    
    override private function set_width(width : Float) : Float
    {
        this._w = width;
        this.redraw();
        return width;
    }    
	#end
	
    public function setSize(width : Float, height : Float) : Void
    {
        this._w = width;
        this._h = height;
        this.redraw();
        return;
    }
}


package com.thinkido.framework.display;


import openfl.display.BitmapData;
import openfl.display.Shape;

class RepeatImage extends Shape
{
    public var bitmapData(get_bitmapData, set_bitmapData) : BitmapData;

    private var __bitmapData : BitmapData = null;
    private var _w : Float = 1;
    private var _h : Float = 1;
    
    public function new()
    {
        super();
        this.setSize(100, 100);
        return;
    }
    
    private function redraw() : Void
    {
        if (this.__bitmapData == null) 
        {
            return;
        }
        graphics.clear();
        graphics.beginBitmapFill(this.bitmapData);
        graphics.lineStyle(1, 0, 0);
        graphics.drawRect(0, 0, this._w, this._h);
        graphics.endFill();
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
	override private function set_height(__height : Float) : Float
    {
        this._h = __height;
        this.redraw();
        return __height;
    }
    
    override private function get_height() : Float
    {
        return this._h;
    }
    
    override private function get_width() : Float
    {
        return this._w;
    }
    
    override private function set_width(__width : Float) : Float
    {
        this._w = __width;
        this.redraw();
        return __width;
    }
	#end
    
    private function get_bitmapData() : BitmapData
    {
        return this.__bitmapData;
    }
    
    private function set_bitmapData(bmd : BitmapData) : BitmapData
    {
        this.__bitmapData = bmd;
        this.redraw();
        return bmd;
    }
    
    
    
    public function setSize(__width : Float, __height : Float) : Void
    {
        this._w = __width;
        this._h = __height;
        this.redraw();
        return;
    }
}


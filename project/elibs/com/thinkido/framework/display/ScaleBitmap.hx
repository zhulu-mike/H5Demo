package com.thinkido.framework.display;

import openfl.errors.Error;
import openfl.display.PixelSnapping;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Matrix;
import openfl.geom.Rectangle;

class ScaleBitmap extends Bitmap
{
    private var _originalBitmap : BitmapData;
    private var _scale9Grid : Rectangle = null;
    
    public function new(bmd : BitmapData = null, _pixelSnapping : PixelSnapping = null , _smoothing : Bool = false)
    {
		if ( _pixelSnapping == null) {
			_pixelSnapping = PixelSnapping.AUTO ;
		}		
        super(bmd, _pixelSnapping, _smoothing);
		if ( bmd != null ) {
			this._originalBitmap = bmd.clone();			
		}
        return;
    }
	
	
	public var bitmapDataT(get,set):BitmapData ;
	private function set_bitmapDataT(bmd : BitmapData) : BitmapData	
	{
		this._originalBitmap = bmd.clone();
        if ( this._scale9Grid != null ) 
        {
            if (!this.validGrid(this._scale9Grid)) 
            {
                this._scale9Grid = null ;
            }
            this.setSize(bmd.width, bmd.height);
        }
        else 
        {
            this.assignBitmapData(this._originalBitmap.clone());
        }
		return bmd;
	}
	private function get_bitmapDataT():BitmapData	
	{
		return bitmapData ;
	}
	
	/**
	 * 
	 */
	public var scale9GridT(get,set):Rectangle;
	
	function get_scale9GridT():Rectangle
	{
		return _scale9Grid;
	}
	
	function set_scale9GridT(rect:Rectangle):Rectangle
	{
		if(_scale9Grid == rect)
		return _scale9Grid ;
	
		var _w : Float = 0;
        var _h : Float = 0;
        
        if ((_scale9Grid == null && rect != null) || (_scale9Grid != null && !_scale9Grid.equals(rect))) 
        {
            if (rect == null) 
            {
                _w = width;
                _h = height;
                this._scale9Grid = null;
                this.assignBitmapData(this._originalBitmap.clone());
                this.setSize(_w, _h);
            }
            else 
            {
                if (!this.validGrid(rect)) 
                {
                    throw new Error("#001 - The _scale9Grid does not match the original BitmapData");
                }
                this._scale9Grid = rect.clone();
                this.resizeBitmap(width, height);
                scaleX = 1;
                scaleY = 1;
            }
        }else {
			this._scale9Grid = rect.clone();
			trace("mybe someting wrong!");
		}
		
		return _scale9Grid ;
	}
	
	
       
    
	@:setter(width)
	#if flash
	private function set_width(value:Float)
	#else
	override function set_width(value:Float):Float
	#end
	{
		if(value == width)
		return#if !flash width #end;
		
		if (value != width) 
        {
            this.setSize(width, height);
        }		
		#if !flash
		return value;
		#end
	}
	
	@:getter(width)
	#if flash
	private function get_width():Float
	#else
	override private function get_width():Float
	#end
	{
		return super.width ;
	}
    
    
	@:setter(height)
	#if flash
	private function set_height(value:Float)
	#else
	override function set_height(value:Float):Float
	#end
	{
		if(value == height)
		return#if !flash height #end;
	
		if (value != height) 
        {
            this.setSize(width, value);
        }
		
		#if !flash
		return value;
		#end
	}
	
	@:getter(height)
	#if flash
	private function get_height():Float
	#else
	override private function get_height():Float
	#end
	{
		return super.height;
	}
	
		
    
    private function assignBitmapData(_bmd : BitmapData) : Void
    {
		if ( this.bitmapData != null  ) {
			this.bitmapData.dispose() ;
		}
		this.bitmapData = _bmd ;		
        return;
    }
    
    private function validGrid(rect : Rectangle) : Bool
    {
        var temp:Bool = false ;
		if (this._originalBitmap != null && rect.right <= this._originalBitmap.width)
		{
			temp = true ;
		}
		return temp ;
    }
    
    
    public function setSize(_w : Float, _h : Float) : Void
    {
        if (this._scale9Grid == null) 
        {
            this.width = _w;
            this.height = _h;
        }
        else 
        {
            _w = Math.max(_w, this._originalBitmap.width - this._scale9Grid.width);
            _h = Math.max(_h, this._originalBitmap.height - this._scale9Grid.height);
            this.resizeBitmap(_w, _h);
        }
        return;
    }
    
	
    public function getOriginalBitmapData() : BitmapData
    {
        return this._originalBitmap;
    }
    
    private function resizeBitmap(w : Float, h : Float) : Void
    {
        var bmpData:BitmapData=new BitmapData(Std.int(w), Std.int(h), true, 0x00000000);
        var rows:Array<Dynamic>=[0, _scale9Grid.top, _scale9Grid.bottom, _originalBitmap.height];
        var cols:Array<Dynamic>=[0, _scale9Grid.left, _scale9Grid.right, _originalBitmap.width];
        var dRows:Array<Dynamic>=[0, _scale9Grid.top, h -(_originalBitmap.height - _scale9Grid.bottom), h];
        var dCols:Array<Dynamic>=[0, _scale9Grid.left, w -(_originalBitmap.width - _scale9Grid.right), w];
        var origin:Rectangle;
        var draw:Rectangle;
        var mat:Matrix=new Matrix();
        var cx:Int;
        var cy:Int;
        for(cx in 0...3)
        {
            for(cy in 0...3)
            {
                origin=new Rectangle(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
                draw=new Rectangle(dCols[cx], dRows[cy], dCols[cx + 1] - dCols[cx], dRows[cy + 1] - dRows[cy]);
                mat.identity();
                mat.a=draw.width / origin.width;
                mat.d=draw.height / origin.height;
                mat.tx=draw.x - origin.x * mat.a;
                mat.ty=draw.y - origin.y * mat.d;
                bmpData.draw(_originalBitmap, mat, null, null, draw, smoothing);
            }
        }
        assignBitmapData(bmpData);
        return;
    }
}


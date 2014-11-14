package com.thinkido.framework.display ;

	import motion.Actuate;
	import com.thinkido.framework.common.vo.StyleData;
	import com.thinkido.framework.utils.DrawUtil;
	
	import openfl.display.Sprite;
	import openfl.geom.Point;
	
	class PolygonItem extends Sprite
	{
		private var _radius:Int ;
		
		public var a:Point ;
		public var b:Point ;
		public var c:Point ;
		public var d:Point ;
		public var e:Point ;
		
		public function new()
		{
			super();
			a = new Point();
			b = new Point();
			c = new Point();
			d = new Point();
			e = new Point();
		}
		
		public var radius(get_radius,set_radius):Int ;
		
		private function get_radius():Int
		{
			return _radius;
		}
		
		private function set_radius(value:Int):Int
		{
			if( _radius == value ){
				return _radius;
			}
			_radius = value;

			var itemAngle:Float = Math.PI * 2 / 5;
			var angle:Float = itemAngle * 0 ;
			a.x = Math.cos(angle )*_radius ;
			a.y = Math.sin(angle)*_radius;
			angle = itemAngle * 1 ;
			b.x = Math.cos(angle )*_radius ;
			b.y = Math.sin(angle)*_radius;
			angle = itemAngle * 2 ;
			c.x = Math.cos(angle )*_radius ;
			c.y = Math.sin(angle)*_radius;
			angle = itemAngle * 3 ;
			d.x = Math.cos(angle )*_radius ;
			d.y = Math.sin(angle)*_radius;
			angle = itemAngle * 4 ;
			e.x = Math.cos(angle )*_radius ;
			e.y = Math.sin(angle)*_radius;
			return _radius;
		}
		
		public function draw( data:Array<Dynamic> ):Void{
			var itemAngle:Float = Math.PI * 2 / 5;
			var angle:Float = itemAngle * 0 ;
			Actuate.tween( a , 0.5 ,{x: Math.cos(angle )*data[0] ,y: Math.sin(angle)*data[0] }) ;
			angle = itemAngle * 1 ;
			Actuate.tween( b , 0.5 ,{x: Math.cos(angle )*data[1] ,y: Math.sin(angle)*data[1] }) ;
			angle = itemAngle * 2 ;
			Actuate.tween( c , 0.5 ,{x: Math.cos(angle )*data[2] ,y: Math.sin(angle)*data[2] }) ;
			angle = itemAngle * 3 ;
			Actuate.tween( d , 0.5 ,{x: Math.cos(angle )*data[3] ,y: Math.sin(angle)*data[3] }) ;
			angle = itemAngle * 4 ;
			Actuate.tween( e , 0.5 ,{x: Math.cos(angle )*data[4] ,y: Math.sin(angle)*data[4] }).onUpdate(reDraw) ;
		}
		public var styleData:StyleData ;
		private function reDraw():Void{
			this.graphics.clear();
			this.graphics.lineStyle( styleData.lineThickness ,styleData.lineColor,styleData.lineAlpha);
			this.graphics.beginFill( styleData.fillColor ,styleData.fillAlpha ) ;
			this.graphics.moveTo( a.x ,a.y );
			this.graphics.lineTo( b.x ,b.y );
			this.graphics.lineTo( c.x ,c.y );
			this.graphics.lineTo( d.x ,d.y );
			this.graphics.lineTo( e.x ,e.y );
			this.graphics.lineTo( a.x ,a.y );
			this.graphics.endFill() ;
		}
			
	}

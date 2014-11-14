package com.thinkido.framework.display ;

	import com.thinkido.framework.common.vo.StyleData;
	
	import openfl.display.Sprite;
	import openfl.geom.Point;
	
	class Polygon extends Sprite
	{
		private var _radius:Int ;
		
		public var a:Point ;
		public var b:Point ;
		public var c:Point ;
		public var d:Point ;
		public var e:Point ;
		
		public var poly1:PolygonItem ;
		public var poly2:PolygonItem ;
		public var styleData1:StyleData ;
		public var styleData2:StyleData ;
		
		public function new()
		{
			super();
			a = new Point();
			b = new Point();
			c = new Point();
			d = new Point();
			e = new Point();
			
			poly1 = new PolygonItem() ;
			poly2 = new PolygonItem() ;
			addChild(poly1);
			addChild(poly2);
			
			styleData1 = new StyleData( 2,0xffff00,0.6, 0xffff00,0.2 );
			styleData2 = new StyleData( 2,0xff0000,0.6, 0xff0000,0.2 );
			poly1.styleData = styleData1 ;
			poly2.styleData = styleData2 ;
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
			drawBase() ;
			return _radius;
		}
		
		private function drawBase():Void{
			this.graphics.clear();
			graphics.lineStyle(2,0x00ff00,0.5);
			var _x:Float ;
			var _y:Float ;
			
			for (i in 0...6) 
			{
				var angle:Float = Math.PI * 2 / 5 * i  ;
				_x = Math.cos(angle )*_radius ;
				_y = Math.sin(angle )*_radius ;
				this.graphics.lineTo( _x , _y );
				this.graphics.lineTo(0,0);
				this.graphics.lineTo( _x , _y );
			}
			graphics.endFill() ;
			this.rotation = -90 ;
		}
		/**
		 *  
		 * @param data 10个半径数组,前5个数是第一个半径,后5个数是第二个半径
		 * 
		 */
		public function draw( data:Array<Dynamic> ):Void{
			poly1.draw( data.slice(0,5) );
			poly2.draw( data.slice(4) );
		}
		
	}

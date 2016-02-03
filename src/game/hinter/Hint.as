package game.hinter
{
	import flash.display.Sprite;
	
	import mx.containers.Canvas;
	import mx.controls.Alert;

	public class Hint implements IHint
	{
		private var _column:int;
		private var _row:int;
		private var _scene:Sprite;
		
		private const HIGHLIDHT_RECT_THICKNESS:int = 7;
		
		public function Hint(column:int, row:int, scene:Sprite)
		{
			_column = column;
			_row = row;
			_scene = scene;
		}
		
		public function highlightCeil():void
		{
			var rectLayer:Canvas = new Canvas();
			
			rectLayer.graphics.beginFill(0xFFFFFF);
			rectLayer.graphics.drawRect(0, 0, _scene.width, _scene.height);
			rectLayer.graphics.drawRect(HIGHLIDHT_RECT_THICKNESS, HIGHLIDHT_RECT_THICKNESS,
										_scene.width - 2*HIGHLIDHT_RECT_THICKNESS,
										_scene.height - 2*HIGHLIDHT_RECT_THICKNESS);
			rectLayer.graphics.endFill();
			
//			var glowFilter:GlowFilter = new GlowFilter(0x33CCFF, 0.8, 35, 35, 2, BitmapFilterQuality.HIGH, false, false);
//			rectLayer.filters = [glowFilter];
			
			_scene.addChild(rectLayer);
			
			Alert.show(_column.toString(), _row.toString());
		}
	}
}
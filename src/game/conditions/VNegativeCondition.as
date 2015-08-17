package game.conditions
{
	import game.Images;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	
	public class VNegativeCondition extends VCondition
	{
		private var _noImage:Image;
		
		public function VNegativeCondition(topImageNumber:int, bottomImageNumber:int, index:int, appWidth:Number, appHeight:Number)
		{
			super(topImageNumber, bottomImageNumber, index, appWidth, appHeight);
			
			_noImage = getNoImage();
			
			resizeNoImage();
			
			addChild(_noImage);
		}
		
		override public function resize(appWidth:Number, appHeight:Number):void
		{
			super.resize(appWidth, appHeight);
			
			resizeNoImage();
		}
		
		private function resizeNoImage():void
		{
			if (_noImage == null)
				return;
			
			var size:int = Math.min(getImageWidth(), getImageHeight());
			_noImage.width = size;
			_noImage.height = size;
			_noImage.x = (width - size)/2;
			_noImage.y = (height - size)/2;
		}
	}
}
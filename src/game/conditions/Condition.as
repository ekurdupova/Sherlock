package game.conditions
{
	import game.Images;
	
	import mx.containers.Canvas;
	import mx.controls.Image;

	public class Condition extends Canvas
	{
		protected var appWidth:Number;
		protected var appHeight:Number;
		
		private const IMAGE_WIDTH_COEFF:Number = 0.05208;
		private const IMAGE_HEIGHT_COEFF:Number = 0.1066;
		
		private var _images:Images = new Images();
		
		public function Condition(appWidth:Number, appHeight:Number)
		{
			super();
			
			this.horizontalScrollPolicy = "off";
			this.verticalScrollPolicy = "off";
			
			resize(appWidth, appHeight);
		}
		
		public function resize(appWidth:Number, appHeight:Number):void
		{
			this.appWidth = appWidth;
			this.appHeight = appHeight;
		}
		
		protected function getImageWidth():int
		{
			return IMAGE_WIDTH_COEFF*appWidth;
		}
		
		protected function getImageHeight():int
		{
			return IMAGE_HEIGHT_COEFF*appHeight;
		}
		
		protected function getPadding():int
		{
			return 0;
		}
		
		protected function getImageByNumber(imageNumber:int):Image
		{
			var images:Images = new Images();
			
			var imageClass:Class = images.getImageClassByNumber(imageNumber);
			
			var image:Image = null;
			
			if (imageClass != null)
			{
				image = new Image();
				image.source = new imageClass();
				image.width = getImageWidth();
				image.height = getImageHeight();
			}
			
			return image;
		}
		
		protected function getNoImage():Image
		{
			var noImage:Image = new Image();
			noImage.source = new _images.noCls();
			
			return noImage;
		}
		
		protected function getArrowImage():Image
		{
			var arrowImage:Image = new Image();
			arrowImage.source = new _images.arrowCls();
			
			return arrowImage;
		}
		
		protected function getDotsImage():Image
		{
			var dotsImage:Image = new Image();
			dotsImage.source = new _images.dotsCls();
			
			return dotsImage;
		}
		
		protected function drawBackground():void
		{
			graphics.beginFill(0x555555);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		protected function drawFrame(centerX:int, centerY:int, thickness:int):void
		{
			var width:Number = getImageWidth();
			var height:Number = getImageHeight();
			graphics.beginFill(0xaaaaaa);
			graphics.drawRect(	centerX - width/2 + getPadding(),
								centerY - height/2 + getPadding(),
								width - 2*getPadding(),
								height - 2*getPadding());
			graphics.drawRect(	centerX - width/2 + getPadding() + thickness,
								centerY - height/2 + getPadding() + thickness,
								width - 2*getPadding() - 2*thickness,
								height - 2*getPadding() - 2*thickness);
			graphics.endFill();
		}
	}
}
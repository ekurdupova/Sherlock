package game.conditions
{
	import mx.controls.Image;
	
	public class VCondition extends Condition
	{
		protected const PADDING_COEFF:Number = 0.0015625;

		private const IMAGE_VERTICAL_GAP_COEFF:Number = 0.003198;
		private const IMAGE_WIDTH_COEFF:Number = 0.04792;
		private const IMAGE_HEIGHT_COEFF:Number = 0.09808;
		
		private var _index:int;

		public function VCondition(topImageNumber:int, bottomImageNumber:int, index:int, appWidth:Number, appHeight:Number)
		{
			super(appWidth, appHeight);
			_index = index;
			
			setSize();
			
			var topImage:Image = getImageByNumber(topImageNumber);
			
			if (topImage != null)
			{
				setTopImagePosition(topImage);
				
				addChild(topImage);
			}
			
			var bottomImage:Image = getImageByNumber(bottomImageNumber);
			
			if (bottomImage != null)
			{
				setBottomImagePosition(bottomImage);
				
				addChild(bottomImage);
			}
		}
		
		override public function resize(appWidth:Number, appHeight:Number):void
		{
			super.resize(appWidth, appHeight);
			
			setSize();
			
			if (numChildren < 2)
				return;
			
			var topImage:Image = getChildAt(0) as Image;
			var bottomImage:Image = getChildAt(1) as Image;
			
			topImage.width = bottomImage.width = getImageWidth();
			topImage.height = bottomImage.height = getImageHeight();
			
			setTopImagePosition(topImage);
			setBottomImagePosition(bottomImage);
		}
		
		public function get index():int
		{
			return _index;
		}
		
		override protected function getImageHeight():int
		{
			return IMAGE_HEIGHT_COEFF*appHeight;
		}
		
		override protected function getImageWidth():int
		{
			return IMAGE_WIDTH_COEFF*appWidth;
		}
		
		override protected function getPadding():int
		{
			return PADDING_COEFF*appWidth;
		}
		
		private function setSize():void
		{
			width = getImageWidth() + 2*getPadding();
			height = 2*getImageHeight() + IMAGE_VERTICAL_GAP_COEFF*appHeight + 2*getPadding();
		}
		
		private function setTopImagePosition(topImage:Image):void
		{
			topImage.x = getPadding();
			topImage.y = getPadding();
		}
		
		private function setBottomImagePosition(bottomImage:Image):void
		{
			bottomImage.x = getPadding();
			bottomImage.y = getImageHeight() + IMAGE_VERTICAL_GAP_COEFF*appHeight +2*getPadding();
		}
	}
}
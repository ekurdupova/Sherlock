package game.conditions
{
	import game.MiddleImageType;
	
	import mx.controls.Image;

	public class HCondition extends Condition
	{
		private const PADDING_COEFF:Number = 0.0015625;
		
		private const IMAGE_HORIZONTAL_GAP_COEFF:Number = 0.0015625;
		private const IMAGE_WIDTH_COEFF:Number = 0.046875;
		private const IMAGE_HEIGHT_COEFF:Number = 0.09595;
		
		private var _hasArrow:Boolean = false;
		private var _isMiddleImageNegative:Boolean = false;
		private var _index:int;

		public function HCondition(	hasArrow:Boolean, middleImageType:int,
									leftImageNumber:int, middleImageNumber:int, rightImageNumber:int,
									index:int, appWidth:Number, appHeight:Number)
		{
			super(appWidth, appHeight);
			_index = index;
			
			setSize();
			
			var leftImage:Image = getImageByNumber(leftImageNumber);
			
			if (leftImage != null)
			{
				setLeftImagePosition(leftImage);
				
				addChild(leftImage);
			}
			
			var middleImage:Image;
			if (MiddleImageType.DOTS_IMAGE == middleImageType)
			{
				middleImage = getDotsImage();
				middleImage.width = getImageWidth();
				middleImage.height = getImageHeight();
			}
			else
			{
				middleImage = getImageByNumber(middleImageNumber);
			}
			
			if (middleImage != null)
			{
				setMiddleImagePosition(middleImage);
				
				addChild(middleImage);
			}
			
			var rightImage:Image = getImageByNumber(rightImageNumber);
			
			if (rightImage != null)
			{
				setRightImagePosition(rightImage);
				
				addChild(rightImage);
			}
			
			if (hasArrow)
			{
				_hasArrow = true;
				drawArrow();
			}
			
			if (MiddleImageType.NEGATIVE_IMAGE == middleImageType)
			{
				_isMiddleImageNegative = true;
				doMiddleImageNegative();
			}
		}
		
		override public function resize(appWidth:Number, appHeight:Number):void
		{
			super.resize(appWidth, appHeight);

			setSize();
			
			if (numChildren < 3)
				return;
			
			var leftImage:Image = getChildAt(0) as Image;
			var middleImage:Image = getChildAt(1) as Image;
			var rightImage:Image = getChildAt(2) as Image;
			
			leftImage.width = middleImage.width = rightImage.width = getImageWidth();
			leftImage.height = middleImage.height = rightImage.height = getImageHeight();
			
			setLeftImagePosition(leftImage);
			setMiddleImagePosition(middleImage);
			setRightImagePosition(rightImage);
			
			var index:int = 3;
			if (_hasArrow)
			{
				var arrowImage:Image = getChildAt(index) as Image;
				resizeArrowImage(arrowImage);
				++index;
			}
			
			if (_isMiddleImageNegative)
			{
				var noImage:Image = getChildAt(index) as Image;
				resizeNoImage(noImage);
			}
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
		
		private function drawArrow():void
		{
			var arrowImage:Image = getArrowImage();
			
			resizeArrowImage(arrowImage);
			
			addChild(arrowImage);
		}
		
		private function doMiddleImageNegative():void
		{
			var noImage:Image = getNoImage();
			
			resizeNoImage(noImage);
			
			addChild(noImage);
		}
		
		private function setSize():void
		{
			width = 3*getImageWidth() + 2*IMAGE_HORIZONTAL_GAP_COEFF*appWidth + 2*getPadding();
			height = getImageHeight() + 2*getPadding();
		}
		
		private function setLeftImagePosition(leftImage:Image):void
		{
			leftImage.x = getPadding();
			leftImage.y = getPadding();
		}
		
		private function setMiddleImagePosition(middleImage:Image):void
		{
			middleImage.x = getImageWidth() + IMAGE_HORIZONTAL_GAP_COEFF*appWidth + getPadding();
			middleImage.y = getPadding();
		}
		
		private function setRightImagePosition(rightImage:Image):void
		{
			rightImage.x = 2*getImageWidth() + 2*IMAGE_HORIZONTAL_GAP_COEFF*appWidth + getPadding();
			rightImage.y = getPadding();
		}
		
		private function resizeArrowImage(arrowImage:mx.controls.Image):void
		{
			arrowImage.width = width;
		}
		
		private function resizeNoImage(noImage:Image):void
		{
			noImage.width = getImageWidth();
			noImage.height = getImageHeight();
			noImage.x = getImageWidth() + IMAGE_HORIZONTAL_GAP_COEFF*appWidth + getPadding();
			noImage.y = getPadding();
		}
	}
}
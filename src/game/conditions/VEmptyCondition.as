package game.conditions
{
	public class VEmptyCondition extends VCondition
	{
		public function VEmptyCondition(appWidth:Number, appHeight:Number)
		{
			super(66, 66, -1, appWidth, appHeight);
			
			draw();
		}
		
		override public function resize(appWidth:Number, appHeight:Number):void
		{
			super.resize(appWidth, appHeight);
			
			draw();
		}
		
		private function draw():void
		{
			graphics.clear();
			
			drawBackground();
			
			drawFrame(width/2, height/4, 0.002083*appWidth);
			drawFrame(width/2, 3*height/4, 0.002083*appWidth);
		}
	}
}
package game.conditions
{
	public class HEmptyCondition extends HCondition
	{
		public function HEmptyCondition(appWidth:Number, appHeight:Number)
		{
			super(false, 0, 66, 66, 66, -1, appWidth, appHeight);
			
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
			
			drawFrame(width/6, height/2, 0.002083*appWidth);
			drawFrame(3*width/6, height/2, 0.002083*appWidth);
			drawFrame(5*width/6, height/2, 0.002083*appWidth);
		}
	}
}
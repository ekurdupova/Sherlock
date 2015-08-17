package game
{
	public class MathUtil
	{
		private static var _seed:Number = 0;
		
		public static function seedRandom(value:Number):void
		{
			_seed = value;
		}
		
		public static function random(max:Number):Number
		{
			_seed = (_seed*9301 + 49297) % 233280;
			
			var rand:Number = _seed / 233280;
			
			return rand*max;
		}
	}
}
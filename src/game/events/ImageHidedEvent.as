package game.events
{
	import flash.events.Event;

	public class ImageHidedEvent extends GameEvent
	{
		public static const IMAGE_HIDED:String = "imageHided";
		
		private var _row:int;
		private var _column:int;
		private var _index:int;
		
		public function ImageHidedEvent(type:String, row:int, column:int, index:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_row = row;
			_column = column;
			_index = index;
		}
		
		public function get row():int
		{
			return _row;
		}
		
		public function get column():int
		{
			return _column;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		override public function clone():Event
		{
			return new ImageHidedEvent(IMAGE_HIDED, _row, _column, _index);
		}
	}
}
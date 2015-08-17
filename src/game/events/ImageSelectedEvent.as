package game.events
{
	import flash.events.Event;

	public class ImageSelectedEvent extends GameEvent
	{
		public static const IMAGE_SELECTED:String = "imageSelected";
		
		private var _imgNumber:int;
		private var _index:int;
		private var _column:int;
		private var _columns:Array;
		
		public function ImageSelectedEvent(imgNumber:int, index:int, column:int, columns:Array, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(IMAGE_SELECTED, bubbles, cancelable);
			
			_imgNumber = imgNumber;
			_index = index;
			_column = column;
			_columns = columns;
		}
		
		public function get imageNumber():int
		{
			return _imgNumber;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get column():int
		{
			return _column;
		}
		
		public function get columns():Array
		{
			return _columns;
		}
		
		override public function clone():Event
		{
			return new ImageSelectedEvent(_imgNumber, _index, _column, _columns);
		}
	}
}
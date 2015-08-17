package game.events
{
	import flash.events.Event;

	public class GameEvent extends Event
	{
		public static const EXIT:String = "exit";
		public static const NEW_GAME:String = "newGame";
		public static const UNDO:String = "undoSelected";
		public static const UNKNOWN_ACTION:String = "unknownAction";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
package game.events
{
	import flash.events.Event;
	
	public class MenuEvent extends Event
	{
		public static const PLAY_BUTTON_CLICKED:String = "playButtonClicked";
		public static const HOW_TO_PLAY_CLICKED:String = "howToPlayClicked";
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
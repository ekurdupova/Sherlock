package game.events
{
	import flash.events.Event;

	public class ConditionRemovedEvent extends GameEvent
	{
		public static const CONDITION_REMOVED:String = "conditionRemoved";
		
		private var _isVerticalCondition:Boolean;
		private var _conditionIndex:int;
		
		public function ConditionRemovedEvent(type:String, isVeritcalCondition:Boolean, conditionIndex:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_isVerticalCondition = isVeritcalCondition;
			_conditionIndex = conditionIndex;
		}
		
		public function get isVerticalCondition():Boolean
		{
			return _isVerticalCondition;
		}
		
		public function get conditionIndex():int
		{
			return _conditionIndex;
		}
		
		override public function clone():Event
		{
			return new ConditionRemovedEvent(CONDITION_REMOVED, _isVerticalCondition, _conditionIndex);
		}
	}
}
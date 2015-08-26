package game
{
	import game.events.ConditionRemovedEvent;
	import game.events.GameEvent;
	import game.events.ImageHidedEvent;
	import game.events.ImageSelectedEvent;
	
	import mx.collections.ArrayList;

	public class ActionsWatcher
	{
		private var _game:IInteractiveGame;
		private var _actions:ArrayList;
		
		public function ActionsWatcher(game:IInteractiveGame)
		{
			_game = game;
			_actions = new ArrayList();
			
			_game.addEventListener(ConditionRemovedEvent.CONDITION_REMOVED, rememberAction);
			_game.addEventListener(ImageHidedEvent.IMAGE_HIDED, rememberAction);
			_game.addEventListener(ImageSelectedEvent.IMAGE_SELECTED, rememberAction);
		}
		
		public function revertLastAction():void
		{
			if (_actions.length == 0)
				return;
			
			var action:GameEvent = _actions.getItemAt(_actions.length - 1) as GameEvent;
			
			switch (action.type)
			{
				case ConditionRemovedEvent.CONDITION_REMOVED:
				{
					var concreteAction:ConditionRemovedEvent = action as ConditionRemovedEvent;
					if (concreteAction.isVerticalCondition)
					{
						_game.restoreVerticalCondition(concreteAction.conditionIndex);
					}
					else
					{
						_game.restoreHorizontalCondition(concreteAction.conditionIndex);
					}
					break;
				}
				case ImageHidedEvent.IMAGE_HIDED:
				{
					var imageHidedEvent:ImageHidedEvent = action as ImageHidedEvent;
					_game.showImage(imageHidedEvent.row, imageHidedEvent.column, imageHidedEvent.index);
					break;
				}
				case ImageSelectedEvent.IMAGE_SELECTED:
				{
					var imageSelectedEvent:ImageSelectedEvent = action as ImageSelectedEvent;
					_game.unselectImage(imageSelectedEvent.imageNumber, imageSelectedEvent.index,
										imageSelectedEvent.column, imageSelectedEvent.columns);
					break;
				}
				default:
				{
					_game.dispatchEvent(new GameEvent(GameEvent.UNKNOWN_ACTION));
				}
			}
			
			_actions.removeItemAt(_actions.length - 1);
		}
		
		private function rememberAction(event:GameEvent):void
		{
			_actions.addItem(event);
		}
	}
}
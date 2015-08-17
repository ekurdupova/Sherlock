package game
{
	import flash.events.IEventDispatcher;
	
	public interface IInteractiveGame extends IEventDispatcher
	{
		function showVerticalCondition(index:int):void;
		function showHorizontalCondition(index:int):void;
		function showImage(row:int, column:int, index:int):void;
		function unselectImage(imgNumber:int, index:int, column:int, columns:Array):void;
	}
}
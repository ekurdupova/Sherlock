package game
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import game.events.ConditionRemovedEvent;
	import game.events.GameEvent;
	import game.events.ImageHidedEvent;
	import game.events.ImageSelectedEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class Game extends EventDispatcher implements IInteractiveGame
	{
		private const VERTICAL_CONDITIONS_COUNT:int = 18;
		private const HORIZONTAL_CONDITIONS_COUNT:int = 21;
		
		private var _gameData:GameData;
		private var _gameGrid:GameGrid;
		private var _actionWatcher:ActionsWatcher;
		
		private var _selectedImagesCount:int = 0;
		private var _gameCalculator:GameCalculator;
		private var _puzzleNumber:int;
		
		public function Game()
		{
			var gameGenerator:GameGenerator = new GameGenerator();
			_puzzleNumber = Math.random()*100000;
			_gameData = gameGenerator.generateGame(_puzzleNumber);
		}
		
		public function draw(scene:DisplayObjectContainer):void
		{
			_gameGrid = new GameGrid();
			_gameGrid.puzzleNumber = _puzzleNumber;
			_gameGrid.addEventListener(FlexEvent.CREATION_COMPLETE, onGameGridCreationComplete);
			_gameGrid.addEventListener(ImageSelectedEvent.IMAGE_SELECTED, onImageSelected);
			_gameGrid.addEventListener(GameEvent.UNDO, onUndoSelected);
			_gameGrid.addEventListener(ConditionRemovedEvent.CONDITION_REMOVED, redispatchEvent);
			_gameGrid.addEventListener(ImageHidedEvent.IMAGE_HIDED, redispatchEvent);
			scene.addChild(_gameGrid);
		}
		
		public function remove(scene:DisplayObjectContainer):void
		{
			scene.removeChild(_gameGrid);
		}
		
		public function resize(appWidth:Number, appHeight:Number):void
		{
			if (_gameGrid != null)
			{
				_gameGrid.resize(appWidth, appHeight);
			}
		}
		
		public function showVerticalCondition(index:int):void
		{
			var vItem:Array = _gameData.getVerticalConditions()[index];
			_gameGrid.addVerticalConditionAt(vItem[0] == 0, vItem[1], vItem[2], index);
		}
		
		public function showHorizontalCondition(index:int):void
		{
			var hItem:Array = _gameData.getHorizontalCondition()[index];
			_gameGrid.addHorizontalConditionAt(hItem[0] == 1, hItem[1], hItem[2], hItem[3], hItem[4], index);
		}
		
		public function showImage(row:int, column:int, index:int):void
		{
			_gameGrid.showImage(row, column, index);
		}
		
		public function unselectImage(imgNumber:int, index:int, column:int, columns:Array):void
		{
			_gameGrid.unselectImage(imgNumber, index, column, columns);
			
			--_selectedImagesCount;
			
			if (_selectedImagesCount == 35)
			{
				_gameGrid.continueTimer();
			}
		}
		
		private function onGameGridCreationComplete(event:FlexEvent):void
		{
			_gameGrid.removeEventListener(FlexEvent.CREATION_COMPLETE, onGameGridCreationComplete);
			var imagesOpenedOnStart:Array = _gameData.getItemsOpenedOnStart();
			var gameSolution:Array = _gameData.getSolution();
		
			for (var i:int = 0; i < imagesOpenedOnStart.length; ++i)
			{
				var row:int = imagesOpenedOnStart[i][0];
				var column:int = imagesOpenedOnStart[i][1];
				
				_gameGrid.selectImage(gameSolution[row][column], column);
			}
			
			addVerticalConditions();
			addHorizontalConditions();
			
			_actionWatcher = new ActionsWatcher(this);
			_gameGrid.startTimer();
		}
		
		private function addVerticalConditions():void
		{
			var verticalConditions:Array = _gameData.getVerticalConditions();
			
			for (var i:int = 0; i < verticalConditions.length; ++i)
			{
				var vItem:Array = verticalConditions[i];
				_gameGrid.addVerticalCondition(vItem[0] == 0, vItem[1], vItem[2], i);
			}
			
			for (var j:int = verticalConditions.length; j < VERTICAL_CONDITIONS_COUNT; ++j)
			{
				_gameGrid.addEmptyVerticalCondition();
			}
		}
		
		private function addHorizontalConditions():void
		{
			var horizontalConditions:Array = _gameData.getHorizontalCondition();
			
			for (var i:int = 0; i < horizontalConditions.length; ++i)
			{
				var hItem:Array = horizontalConditions[i];
				_gameGrid.addHorizontalCondtion(hItem[0] == 1, hItem[1], hItem[2], hItem[3], hItem[4], i);
			}
			
			for (var j:int = horizontalConditions.length; j < HORIZONTAL_CONDITIONS_COUNT; ++j)
			{
				_gameGrid.addEmptyHorizontalCondition();
			}
		}
		
		private function onImageSelected(event:GameEvent):void
		{
			redispatchEvent(event);
			
			++_selectedImagesCount;
			
			if (_selectedImagesCount == 36)
			{
				_gameGrid.stopTimer();
				
				var selectedImages:Array = _gameGrid.getSelectedImages();
				var correctResult:Boolean = true;
				var gameSolution:Array = _gameData.getSolution();
				
				for (var i:int = 0; i < 6; ++i)
				{
					for (var j:int = 0; j < 6; ++j)
					{
						correctResult &&= (gameSolution[i][j] == selectedImages[j][i]);
					}
				}
				
				if (correctResult)
				{
					Alert.show("Elementary, Watson. One more?", "Sherlock", Alert.YES|Alert.NO, null, onSuccessAlertClose);
				}
				else
				{
					Alert.show("Not really. Try again.");
				}
			}
		}
		
		private function onSuccessAlertClose(event:CloseEvent):void
		{
			if (event.detail == Alert.YES)
			{
				dispatchEvent(new GameEvent(GameEvent.NEW_GAME));
			}
		}
		
		private function onUndoSelected(event:GameEvent):void
		{
			_actionWatcher.revertLastAction();
		}
		
		private function redispatchEvent(event:Event):void
		{
			dispatchEvent(event.clone());
		}
	}
}
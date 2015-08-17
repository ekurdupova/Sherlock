package game
{
	import flash.external.ExternalInterface;

	public class GameCalculator
	{
		private var _result:Array;
		private var _openedItems:int = 0;
		private var _unhandledItems:int = 6*36;
		
		public function GameCalculator()
		{
		}
		
		public function canBeGameSolved(verticalConditions:Array, horizontalConditions:Array, openedImages:Array):Boolean
		{
			getSolution(verticalConditions, horizontalConditions, openedImages);
			
			return _openedItems == 36;
		}
		
		public function getOpenedItemsCount():int
		{
			return _openedItems;
		}
		
		public function getIntermediateResult():Array
		{
			return _result;
		}
		
		public function getSolution(verticalConditions:Array, horizontalConditions:Array, openedImages:Array):Array
		{
			resetResult();
			
			for (var i:int = 0; i < openedImages.length; ++i)
			{
				_result[openedImages[i][0]][openedImages[i][1]] = openedImages[i][2];
			}
			
			calculateOpenedAndUnhandledItems();
			
			var oldOpenedItems:int = -1;
			var oldUnhandledItems:int = -1;
			
			while (!(_openedItems == 36 || (oldOpenedItems == _openedItems && oldUnhandledItems == _unhandledItems)))
			{
				oldOpenedItems = _openedItems;
				oldUnhandledItems = _unhandledItems;
				
				handleResult();
				calculateByVConditions(verticalConditions);
				calculateByHConditions(horizontalConditions);
				
				calculateOpenedAndUnhandledItems();
			}
			
			return _result;
		}
		
		private function resetResult():void
		{
			_result = new Array(6);
			_result[0] = new Array(6);
			_result[1] = new Array(6);
			_result[2] = new Array(6);
			_result[3] = new Array(6);
			_result[4] = new Array(6);
			_result[5] = new Array(6);
			
			for (var i:int = 0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					_result[i][j] = [0,1,2,3,4,5];
				}
			}
		}
		
		private function calculateOpenedAndUnhandledItems():void
		{
			_openedItems = 0;
			_unhandledItems = 0;
			
			for (var i:int = 0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					if (_result[i][j] is Array)
					{
						_unhandledItems += _result[i][j].length;
					}
					else
					{
						++_openedItems;
					}
				}
			}
		}
		
		private function handleResult():void
		{
			hideOpenedImages();
			openUniqueInRow();
			openSingle();
		}
		
		private function hideOpenedImages():void
		{
			for (var i:int = 0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					if (!(_result[i][j] is Array))
					{
						var itemForSearch:int = getColumn(_result[i][j]);
						for (var k:int = 0; k < 6; ++k)
						{
							removeItemfromObject(itemForSearch, _result[i][k]);
						}
					}
				}
			}
		}
		
		private function openUniqueInRow():void
		{
			for (var i:int = 0; i < 6; ++i)
			{
				var countOf0:int = 0;
				var countOf1:int = 0;
				var countOf2:int = 0;
				var countOf3:int = 0;
				var countOf4:int = 0;
				var countOf5:int = 0;
				
				var lastPositionOf0:int = -1;
				var lastPositionOf1:int = -1;
				var lastPositionOf2:int = -1;
				var lastPositionOf3:int = -1;
				var lastPositionOf4:int = -1;
				var lastPositionOf5:int = -1;

				for (var j:int = 0; j < 6; ++j)
				{
					if (_result[i][j] is Array)
					{
						if (_result[i][j].indexOf(0) != -1)
						{
							++countOf0;
							lastPositionOf0 = j;
						}
						if (_result[i][j].indexOf(1) != -1)
						{
							++countOf1;
							lastPositionOf1 = j;
						}
						if (_result[i][j].indexOf(2) != -1)
						{
							++countOf2;
							lastPositionOf2 = j;
						}
						if (_result[i][j].indexOf(3) != -1)
						{
							++countOf3;
							lastPositionOf3 = j;
						}
						if (_result[i][j].indexOf(4) != -1)
						{
							++countOf4;
							lastPositionOf4 = j;
						}
						if (_result[i][j].indexOf(5) != -1)
						{
							++countOf5;
							lastPositionOf5 = j;
						}
					}
				}
				
				if (countOf0 == 1)
				{
					_result[i][lastPositionOf0] = i*10;
				}
				
				if (countOf1 == 1)
				{
					_result[i][lastPositionOf1] = i*10 + 1;
				}
				
				if (countOf2 == 1)
				{
					_result[i][lastPositionOf2] = i*10 + 2;
				}
				
				if (countOf3 == 1)
				{
					_result[i][lastPositionOf3] = i*10 + 3;
				}
				
				if (countOf4 == 1)
				{
					_result[i][lastPositionOf4] = i*10 + 4;
				}
				
				if (countOf5 == 1)
				{
					_result[i][lastPositionOf5] = i*10 + 5;
				}
			}
		}
		
		private function openSingle():void
		{
			for (var i:int = 0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					if (_result[i][j] is Array && _result[i][j].length == 1)
					{
						_result[i][j] = i*10 + _result[i][j][0];
					}
				}
			}
		}
		
		private function calculateByVConditions(verticalConditions:Array):void
		{
			for (var i:int = 0; i < verticalConditions.length; ++i)
			{
				handleVCondition(verticalConditions[i]);
			}
		}
		
		private function handleVCondition(verticalCondition:Array):void
		{
			if (0 == verticalCondition[0])
			{
				handlePositiveVerticalCondition(verticalCondition[1], verticalCondition[2]);
				handlePositiveVerticalCondition(verticalCondition[2], verticalCondition[1]);
			}
			else
			{
				handleNegariveVCondition(verticalCondition[1], verticalCondition[2]);
				handleNegariveVCondition(verticalCondition[2], verticalCondition[1]);
			}
		}
		
		private function handlePositiveVerticalCondition(item1:int, item2:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			
			var indexOfItem1:int = _result[row1].indexOf(item1);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch2:int = getColumn(item2);
			
			if (indexOfItem1 != -1)
			{
				_result[row2][indexOfItem1] = item2;
			}
			else
			{
				for (var i:int = 0; i < 6; ++i)
				{
					if (!objectContainsItem(_result[row1][i], item1))
					{
						removeItemfromObject(itemForSearch2, _result[row2][i]);
					}
				}
			}
		}
		
		private function handleNegariveVCondition(item1:int, item2:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			
			var itemForSearch2:int = getColumn(item2);
			
			var indexOfItem1:int = _result[row1].indexOf(item1);
			
			if (indexOfItem1 != -1)
			{
				removeItemfromObject(itemForSearch2, _result[row2][indexOfItem1]);
			}
		}
		
		private function calculateByHConditions(horizontalConditions:Array):void
		{
			for (var i:int = 0; i < horizontalConditions.length; ++i)
			{
				handleHCondition(horizontalConditions[i]);
			}
		}
		
		private function handleHCondition(hCondition:Array):void
		{
			if (hCondition[0] == 0 && hCondition[1] == 0)
			{
				handlePositiveHConditionWithoutArrow(hCondition[2], hCondition[3]);
			}
			
			if (hCondition[0] == 0 && hCondition[1] == 1)
			{
				handleNegativeHConditionWothoutArrow(hCondition[2], hCondition[3]);
				handleNegativeHConditionWothoutArrow(hCondition[3], hCondition[2]);
			}
			
			if (hCondition[0] == 1)
			{
				handleHConditionWithArrow(hCondition[1] == 0, hCondition[2], hCondition[3], hCondition[4]);
				handleHConditionWithArrow(hCondition[1] == 0, hCondition[4], hCondition[3], hCondition[2]);
				
				if (hCondition[1] == 0)
				{
					handlehHConditionWithArrowAndPositiveCenter(hCondition[2], hCondition[3], hCondition[4]);
				}
				else if (hCondition[1] == 1)
				{
					handleHConditionWithArrowAndNegativeCenter(hCondition[2], hCondition[3], hCondition[4]);
				}
			}
			
			if (hCondition[1] == 2)
			{
				handleHConditionWithDots(hCondition[2], hCondition[4]);
			}
		}
		
		private function handleHConditionWithArrow(positiveCondition:Boolean, item1:int, item2:int, item3:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			var row3:int = getRow(item3);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch2:int = getColumn(item2);
			var itemForSearch3:int = getColumn(item3);
			
			var indexOfItem1:int = _result[row1].indexOf(item1);
			var indexOfItem2:int;
			
			if (indexOfItem1 != -1)
			{
				if (indexOfItem1 < 2)
				{
					if (positiveCondition)
					{
						_result[row2][indexOfItem1+1] = item2;
					}
					else
					{
						removeItemfromObject(itemForSearch2, _result[row2][indexOfItem1+1]);
					}
					
					_result[row3][indexOfItem1+2] = item3;
				}
				else if (indexOfItem1 > 3)
				{
					if (positiveCondition)
					{
						_result[row2][indexOfItem1-1] = item2;
					}
					else
					{
						removeItemfromObject(itemForSearch2, _result[row2][indexOfItem1-1]);
					}
					
					_result[row3][indexOfItem1-2] = item3;
				}
				else
				{
//					if (positiveCondition)
//					{
//						if (_result[row2][indexOfItem1-1] == item2)
//						{
//							_result[row3][indexOfItem1-2] = item3;
//						}
//						else if (_result[row2][indexOfItem1+1] == item2)
//						{
//							_result[row3][indexOfItem1+2] = item3;
//						}
//					}
				}
			}
			else
			{
				for (var i:int = 0; i < 6; ++i)
				{
					var conditionCanRight:Boolean = true;
					var conditionCanBeLeft:Boolean = true;
					
					if (i < 4)
					{
						if (positiveCondition && !objectContainsItem(_result[row2][i+1], item2))
						{
							conditionCanRight = false;
						}
						if (!positiveCondition && _result[row2][i+1] == item2)
						{
							conditionCanRight = false;
						}
						if (!objectContainsItem(_result[row3][i+2], item3))
						{
							conditionCanRight = false;
						}
					}
					else
					{
						conditionCanRight = false;
					}
					
					if (i > 1)
					{
						if (positiveCondition && !objectContainsItem(_result[row2][i-1], item2))
						{
							conditionCanBeLeft = false;
						}
						if (!positiveCondition && _result[row2][i-1] == item2)
						{
							conditionCanBeLeft = false;
						}
						if (!objectContainsItem(_result[row3][i-2], item3))
						{
							conditionCanBeLeft = false;
						}
					}
					else
					{
						conditionCanBeLeft = false;
					}
					
					if (!conditionCanBeLeft && !conditionCanRight)
					{
						removeItemfromObject(itemForSearch1, _result[row1][i]);
					}
				}
			}
		}
		
		private function handlehHConditionWithArrowAndPositiveCenter(item1:int, item2:int, item3:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			var row3:int = getRow(item3);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch2:int = getColumn(item2);
			var itemForSearch3:int = getColumn(item3);
			
			var indexOfItem2:int = _result[row2].indexOf(item2);
			if (indexOfItem2 != -1)
			{
				for (var i:int = 0; i < 6; ++i)
				{
					if (i != indexOfItem2 - 1 && i != indexOfItem2 + 1)
					{
						removeItemfromObject(itemForSearch1, _result[row1][i]);
						removeItemfromObject(itemForSearch3, _result[row3][i]);
					}
				}
			}
			else
			{
				removeItemfromObject(itemForSearch2, _result[row2][0]);
				removeItemfromObject(itemForSearch2, _result[row2][5]);
				
				for (var j:int = 1; j < 5; ++j)
				{
					if ((!objectContainsItem(_result[row1][j-1], item1) && !objectContainsItem(_result[row3][j-1], item3)) ||
						(!objectContainsItem(_result[row1][j+1], item1) && !objectContainsItem(_result[row3][j+1], item3)))
					{
						removeItemfromObject(itemForSearch2, _result[row2][j]);
					}
				}
			}
		}
		
		private function handleHConditionWithArrowAndNegativeCenter(item1:int, item2:int, item3:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			var row3:int = getRow(item3);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch3:int = getColumn(item3);
			
			var indexOfItem2:int = _result[row2].indexOf(item2);
			if (indexOfItem2 != -1)
			{
				if (indexOfItem2 == 1 || indexOfItem2 == 2)
				{
					removeItemfromObject(itemForSearch1, _result[row1][indexOfItem2-1]);
					removeItemfromObject(itemForSearch3, _result[row3][indexOfItem2-1]);
				}
				else if (indexOfItem2 == 3 || indexOfItem2 == 4)
				{
					removeItemfromObject(itemForSearch1, _result[row1][indexOfItem2+1]);
					removeItemfromObject(itemForSearch3, _result[row3][indexOfItem2+1]);
				}
			}
		}
		
		private function handlePositiveHConditionWithoutArrow(item1:int, item2:int):void
		{
			handleFirstItemNearOther(item1, item2);
			handleFirstItemNearOther(item2, item1);
		}
		
		private function handleFirstItemNearOther(item1:int, item2:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch2:int = getColumn(item2);
			
			var index:int = _result[row1].indexOf(item1);
			if (index != -1)
			{
				for (var i:int = 0; i < 6; ++i)
				{
					if (i != index - 1 && i != index + 1)
					{
						removeItemfromObject(itemForSearch2, _result[row2][i]);
					}
				}
			}
			else
			{
				var item1Index:int;
				if ((_result[row2][1] is Array && _result[row2][1].indexOf(itemForSearch2) == -1) ||
					(!(_result[row2][1] is Array) && _result[row2][1] != item2))
				{
					removeItemfromObject(itemForSearch1, _result[row1][0]);
				}
				
				if ((_result[row2][4] is Array && _result[row2][4].indexOf(itemForSearch2) == -1) ||
					(!(_result[row2][4] is Array) && _result[row2][4] != item2))
				{
					removeItemfromObject(itemForSearch1, _result[row1][5]);
				}
				
				for (var j:int = 1; j < 5; ++j)
				{
					if (((_result[row2][j-1] is Array && _result[row2][j-1].indexOf(itemForSearch2) == -1) || (!(_result[row2][j-1] is Array) && _result[row2][j-1] != item2)) &&
						((_result[row2][j+1] is Array && _result[row2][j+1].indexOf(itemForSearch2) == -1) || (!(_result[row2][j+1] is Array) && _result[row2][j+1] != item2)))
					{
						removeItemfromObject(itemForSearch1, _result[row1][j]);
					}
				}
			}
		}
		
		private function handleHConditionWithDots(item1:int, item2:int):void
		{
			var item1FirstColumn:int = findFirsColumnWithItem(item1);
			var item2LastColumn:int = findLastColumnWithItem(item2);
			
			var itemForSearch1:int = getColumn(item1);
			var itemForSearch2:int = getColumn(item2);
			
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			
			for (var i:int = 0; i <= item1FirstColumn; ++i)
			{
				removeItemfromObject(itemForSearch2, _result[row2][i]);
			}
			
			for (var j:int = 5; j >= item2LastColumn; --j)
			{
				removeItemfromObject(itemForSearch1, _result[row1][j]);
			}
		}
		
		private function handleNegativeHConditionWothoutArrow(item1:int, item2:int):void
		{
			var row1:int = getRow(item1);
			var row2:int = getRow(item2);
			
			var itemForSearch:int = getColumn(item2);
			
			var index:int = _result[row1].indexOf(item1);
			if (index != -1)
			{
				if (index > 0)
				{
					removeItemfromObject(itemForSearch, _result[row2][index-1]);
				}
				
				if (index < 5)
				{
					removeItemfromObject(itemForSearch, _result[row2][index+1]);
				}
			}
		}
		
		private function findFirsColumnWithItem(item:int):int
		{
			var row:int = getRow(item);
			
			for (var i:int = 0; i < 6; ++i)
			{
				if (objectContainsItem(_result[row][i], item))
				{
					return i;
				}
			}
			
			return -1;
		}
		
		private function findLastColumnWithItem(item:int):int
		{
			var row:int = getRow(item);
			
			for (var i:int = 5; i >= 0; --i)
			{
				if (objectContainsItem(_result[row][i], item))
				{
					return i;
				}
			}
			
			return -1;
		}
		
		private function removeItemfromObject(item:int, object:Object):void
		{
			if (!(object is Array))
				return;
			
			var index:int = object.indexOf(item);
			if (index != -1)
			{
				object.splice(index, 1);
			}
		}
		
		private function objectContainsItem(object:Object, item:int):Boolean
		{
			if (object is Array)
			{
				return object.indexOf(getColumn(item)) != -1;
			}
			else
			{
				return object == item;
			}
		}
		
		private function getRow(num:Number):int
		{
			return Math.floor(num/10);
		}
		
		private function getColumn(num:Number):int
		{
			return num - getRow(num)*10;
		}
	}
}
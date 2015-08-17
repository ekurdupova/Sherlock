package game
{
	public class GameGenerator
	{
		private var _itemsOpenedOnStart:Array;
		private var _verticalConditions:Array;
		private var _horizontalConditions:Array;
		private var _gameSolution:Array;
		
		private var _intermedaiteResult:Array;

		public function GameGenerator()
		{
		}
		
		public function generateGame(num:Number):GameData
		{
			MathUtil.seedRandom(num);
			
			_itemsOpenedOnStart = new Array();
			_verticalConditions = new Array();
			_horizontalConditions = new Array();
			
			_gameSolution = generateGameSolution();
			
			var gameCalculator:GameCalculator = new GameCalculator();
			gameCalculator.getSolution(_verticalConditions, _horizontalConditions, _itemsOpenedOnStart);
			_intermedaiteResult = gameCalculator.getIntermediateResult();
			
			openRandomItems();
			
			while(!gameCalculator.canBeGameSolved(_verticalConditions, _horizontalConditions, _itemsOpenedOnStart))
			{
				generateCondition();
			}
			
			removeUnnecessaryConditions(_verticalConditions);
			removeUnnecessaryConditions(_horizontalConditions);
			
			while (_verticalConditions.length > 18 || _horizontalConditions.length > 21)
			{
				if (_verticalConditions.length > 18)
				{
					_verticalConditions.splice(getRandom(_verticalConditions.length - 1), 1);
				}
				
				if (_horizontalConditions.length > 21)
				{
					_horizontalConditions.splice(getRandom(_horizontalConditions.length - 1), 1);
				}
				
				while (!gameCalculator.canBeGameSolved(_verticalConditions, _horizontalConditions, _itemsOpenedOnStart))
				{
					_intermedaiteResult = gameCalculator.getIntermediateResult();
					openItem();
				}
			}
			
			removeUnnecessaryConditions(_verticalConditions);
			removeUnnecessaryConditions(_horizontalConditions);
			
			return new GameData(_gameSolution, _itemsOpenedOnStart, _verticalConditions, _horizontalConditions);
		}
		
		private function openRandomItems():void
		{
			openItem(getRandom(3));
		}
		
		private function removeUnnecessaryConditions(conditions:Array):void
		{
			var gameCalculator:GameCalculator = new GameCalculator();

			for (var i:int = 0; i < conditions.length; ++i)
			{
				var items:Array = conditions.splice(i, 1);
				if (gameCalculator.canBeGameSolved(_verticalConditions, _horizontalConditions, _itemsOpenedOnStart))
				{
					--i;
				}
				else
				{
					conditions.splice(i, 0, items[0]);
				}
			}
		}
		
		private function generateGameSolution():Array
		{
			var result:Array = new Array(6);
			
			for (var i:int = 0; i < 6; ++i)
			{
				result[i] = new Array(6);
				var hash:Array = [0,1,2,3,4,5];
				for (var j:int = 0; j < 6; ++j)
				{
					var index:int = getRandom(hash.length - 1);
					result[i][j] = i*10 + hash[index];
					hash.splice(index, 1);
				}
			}
			
			return result;
		}
		
		private function generateCondition():void
		{
			var randomValue:int = getRandom(2);
			if (randomValue == 0)
			{
				generateVerticalCondition();
			}
			else
			{
				generateHorizontalCondition();
			}
		}
		
		private function generateVerticalCondition():void
		{
			const NEGATIVE_CONDITION_QUANTITY:int = 6;
			var condition:Array = new Array(3);
			
			var randomValue:int = getRandom(NEGATIVE_CONDITION_QUANTITY);
			
			var row1:int = getRandom(5);
			var hash:Array = [0,1,2,3,4,5];
			
			hash.splice(row1, 1);
			var row2:int = hash[getRandom(4)];
			var column:int = getRandom(5);
			
			condition[1] = _gameSolution[Math.min(row1, row2)][column];

			if (randomValue > 0)
			{
				condition[0] = 0;
				condition[2] = _gameSolution[Math.max(row1, row2)][column];
			}
			else
			{
				condition[0] = 1;
				hash = [0,1,2,3,4,5];
				
				var item:int = _gameSolution[Math.max(row1, row2)][column] % 10;
				hash.splice(item, 1);
				
				condition[2] = Math.max(row1, row2)*10 + hash[getRandom(4)];
			}
			
			_verticalConditions.push(condition);
		}
		
		private function generateHorizontalCondition():void
		{
			var randomValue:int = getRandom(9);
			
			if (randomValue == 0)
			{
				generatehConditionWithDots();
			}
			else if (randomValue < 4)
			{
				generateHConditionWithArrow();
			}
			else
			{
				generateHConditionWithoutArrow()
			}
		}
		
		private function generateHConditionWithArrow():void
		{
			var condition:Array = new Array(5);
			condition[0] = 1;
			condition[1] = getRandom(1);
			
			var row1:int = getRandom(5);
			var row2:int = getRandom(5);
			var row3:int = getRandom(5);
			var column1:int = getRandom(5);
			var column2:int;
			
			condition[2] = _gameSolution[row1][column1];
			
			var hash:Array = [];
			if (column1 >= 2)
			{
				hash.push("left");
			}
			if (column1 <= 3)
			{
				hash.push("right");
			}
			
			var direction:String = hash[getRandom(hash.length - 1)];
			
			if (direction == "left")
			{
				condition[4] = _gameSolution[row3][column1-2];
				column2 = column1 - 1;
			}
			else
			{
				condition[4] = _gameSolution[row3][column1+2];
				column2 = column1 + 1;
			}
			
			if (condition[1] == 0)
			{
				condition[3] = _gameSolution[row2][column2];
			}
			else
			{
				hash = [];
				for (var i:int = 0; i < 6; ++i)
				{
					if (i != column2)
					{
						hash.push(_gameSolution[row2][i]);
					}
				}
				
				condition[3] = hash[getRandom(hash.length - 1)];
			}
			
			_horizontalConditions.push(condition);
		}
		
		private function generateHConditionWithoutArrow():void
		{
			var row1:int = getRandom(5);
			var row2:int = getRandom(5);
			var column:int = getRandom(5);
			
			var randomValue:int = getRandom(2);
			
			var condition:Array = new Array(5);
			condition[0] = 0;
			condition[2] = condition[4] = _gameSolution[row1][column];
			
			var hash:Array = [];
			
			if (randomValue == 0)
			{
				condition[1] = 1;
				
				for (var i:int = 0; i < 6; ++i)
				{
					if ((i != column - 1) && (i != column +1))
					{
						hash.push(_gameSolution[row2][i]);
					}
				}
				condition[3] = hash[getRandom(hash.length - 1)];
			}
			else
			{
				condition[1] = 0;
				
				if (column > 0)
				{
					hash.push(_gameSolution[row2][column-1]);
				}
				if (column < 5)
				{
					hash.push(_gameSolution[row2][column+1]);
				}
				
				if (hash.length == 1)
				{
					condition[3] = hash[0];
				}
				else
				{
					condition[3] = hash[getRandom(1)];
				}
			}
			
			_horizontalConditions.push(condition);
		}
		
		private function generatehConditionWithDots():void
		{
			var row1:int = getRandom(5);
			var row2:int = getRandom(5);
			var column:int = getRandom(4);
			
			var condition:Array = new Array(5);
			condition[0] = 0;
			condition[1] = 2;
			condition[2] = _gameSolution[row1][column];
			condition[3] = -1;
			
			var hash:Array = [];
			for (var i:int = column + 1; i < 6; ++i)
			{
				hash.push(_gameSolution[row2][i]);
			}
			
			condition[4] = hash[getRandom(hash.length - 1)];
			
			_horizontalConditions.push(condition);
		}
		
		private function openItem(count:int = 1):void
		{
			var hash:Array = [];
			
			for (var i:int = 0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					if (_intermedaiteResult[i][j] is Array)
					{
						hash.push([i,j,_gameSolution[i][j]]);
					}
				}
			}
			
			for (var k:int = 0; k < count; ++k)
			{
				var randomValue:int = getRandom(hash.length - 1);
				_itemsOpenedOnStart.push(hash[randomValue]);
				hash.splice(randomValue, 1);
			}
		}
		
		private function getRandom(val:Number):Number
		{
			return Math.round(MathUtil.random(val));
		}
	}
}
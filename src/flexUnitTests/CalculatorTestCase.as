package flexUnitTests
{
	import flexunit.framework.Assert;
	
	import game.GameCalculator;
	
	import org.flexunit.asserts.assertEquals;
	
	public class CalculatorTestCase
	{
		private var _calculator:GameCalculator;
		
		private var _game1VerticalConditions:Array;
		private var _game1HorizontalConditions:Array;
		private var _game1OpenedImages:Array;
		private var _game1Solution:Array;

		private var _game2VerticalConditions:Array;
		private var _game2HorizontalConditions:Array;
		private var _game2OpenedImages:Array;
		private var _game2Solution:Array;

		private var _game3VerticalConditions:Array;
		private var _game3HorizontalConditions:Array;
		private var _game3OpenedImages:Array;
		private var _game3Solution:Array;

		private var _game4VerticalConditions:Array;
		private var _game4HorizontalConditions:Array;
		private var _game4OpenedImages:Array;
		private var _game4Solution:Array;
		
		private var _game5VerticalConditions:Array;
		private var _game5HorizontalConditions:Array;
		private var _game5OpenedImages:Array;
		private var _game5Solution:Array;
		
		private var _game6VerticalConditions:Array;
		private var _game6HorizontalConditions:Array;
		private var _game6OpenedImages:Array;
		private var _game6Solution:Array;
		
		private var _game7VerticalConditions:Array;
		private var _game7HorizontalConditions:Array;
		private var _game7OpenedImages:Array;
		private var _game7Solution:Array;
		
		private var _game8VerticalConditions:Array;
		private var _game8HorizontalConditions:Array;
		private var _game8OpenedImages:Array;
		private var _game8Solution:Array;
		
		private var _game9VerticalConditions:Array;
		private var _game9HorizontalConditions:Array;
		private var _game9OpenedImages:Array;
		private var _game9Solution:Array;

		[Before]
		public function setUp():void
		{
			_calculator = new GameCalculator();
			
			setGame1Data();
			setGame2Data();
			setGame3Data();
			setGame4Data();
			setGame5Data();
			setGame6Data();
			setGame7Data();
			setGame8Data();
			setGame9Data();
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testGetSolution1():void
		{
			var solution:Array = _calculator.getSolution(_game1VerticalConditions, _game1HorizontalConditions, _game1OpenedImages);
			
			compareArrays(_game1Solution, solution);
		}
		
		[Test]
		public function testGetSolution2():void
		{
			var solution:Array = _calculator.getSolution(_game2VerticalConditions, _game2HorizontalConditions, _game2OpenedImages);
			
			compareArrays(_game2Solution, solution);
		}
		
		[Test]
		public function testGetSolution3():void
		{
			var solution:Array = _calculator.getSolution(_game3VerticalConditions, _game3HorizontalConditions, _game3OpenedImages);
			
			compareArrays(_game3Solution, solution);
		}
		
		[Test]
		public function testGetSolution4():void
		{
			var solution:Array = _calculator.getSolution(_game4VerticalConditions, _game4HorizontalConditions, _game4OpenedImages);
			
			compareArrays(_game4Solution, solution);
		}
		
		[Test]
		public function testGetSolution5():void
		{
			var solution:Array = _calculator.getSolution(_game5VerticalConditions, _game5HorizontalConditions, _game5OpenedImages);
			
			compareArrays(_game5Solution, solution);
		}
		
		[Test]
		public function testGetSolution6():void
		{
			var solution:Array = _calculator.getSolution(_game6VerticalConditions, _game6HorizontalConditions, _game6OpenedImages);
			
			compareArrays(_game6Solution, solution);
		}
		
		[Test]
		public function testGetSolution7():void
		{
			var solution:Array = _calculator.getSolution(_game7VerticalConditions, _game7HorizontalConditions, _game7OpenedImages);
			
			compareArrays(_game7Solution, solution);
		}
		
		[Test]
		public function testGetSolution8():void
		{
			var solution:Array = _calculator.getSolution(_game8VerticalConditions, _game8HorizontalConditions, _game8OpenedImages);
			
			compareArrays(_game8Solution, solution);
		}
		
		[Test]
		public function testGetSolution9():void
		{
			var solution:Array = _calculator.getSolution(_game9VerticalConditions, _game9HorizontalConditions, _game9OpenedImages);
			
			compareArrays(_game9Solution, solution);
		}
		
		private function compareArrays(expected:Array, real:Array):void
		{
			for (var i:int =  0; i < 6; ++i)
			{
				for (var j:int = 0; j < 6; ++j)
				{
					assertEquals(expected[i][j], real[i][j]);
				}
			}
		}
		
		private function setGame1Data():void
		{
			_game1Solution = new Array(6);
			
			_game1Solution[0] = new Array(6);
			_game1Solution[0][0] = 2;
			_game1Solution[0][1] = 0;
			_game1Solution[0][2] = 3;
			_game1Solution[0][3] = 4;
			_game1Solution[0][4] = 1;
			_game1Solution[0][5] = 5;
			
			_game1Solution[1] = new Array(6);
			_game1Solution[1][0] = 15;
			_game1Solution[1][1] = 10;
			_game1Solution[1][2] = 12;
			_game1Solution[1][3] = 14;
			_game1Solution[1][4] = 11;
			_game1Solution[1][5] = 13;
			
			_game1Solution[2] = new Array(6);
			_game1Solution[2][0] = 24;
			_game1Solution[2][1] = 21;
			_game1Solution[2][2] = 22;
			_game1Solution[2][3] = 20;
			_game1Solution[2][4] = 23;
			_game1Solution[2][5] = 25;
			
			_game1Solution[3] = new Array(6);
			_game1Solution[3][0] = 32;
			_game1Solution[3][1] = 35;
			_game1Solution[3][2] = 33;
			_game1Solution[3][3] = 31;
			_game1Solution[3][4] = 34;
			_game1Solution[3][5] = 30;
			
			_game1Solution[4] = new Array(6);
			_game1Solution[4][0] = 43;
			_game1Solution[4][1] = 40;
			_game1Solution[4][2] = 45;
			_game1Solution[4][3] = 42;
			_game1Solution[4][4] = 44;
			_game1Solution[4][5] = 41;
			
			_game1Solution[5] = new Array(6);
			_game1Solution[5][0] = 52;
			_game1Solution[5][1] = 50;
			_game1Solution[5][2] = 55;
			_game1Solution[5][3] = 51;
			_game1Solution[5][4] = 53;
			_game1Solution[5][5] = 54;
			
			_game1OpenedImages = new Array();
			_game1OpenedImages.push([0,1,0], [3,2,33]);
			
			_game1VerticalConditions = new Array();
			_game1VerticalConditions.push([0, 22, 33]);
			_game1VerticalConditions.push([0, 11, 53]);
			_game1VerticalConditions.push([0, 13, 41]);
			_game1VerticalConditions.push([0, 43, 52]);
			_game1VerticalConditions.push([0, 2, 24]);
			_game1VerticalConditions.push([0, 1, 53]);
			_game1VerticalConditions.push([0, 15, 24]);
			
			// set horizontal conditions
			_game1HorizontalConditions = new Array();
			_game1HorizontalConditions.push([1, 1, 51, 5, 40]);
			_game1HorizontalConditions.push([1, 0, 31, 1, 54]);
			_game1HorizontalConditions.push([0, 0, 15, 0, 15]);
			_game1HorizontalConditions.push([0, 0, 30, 23, 30]);
			_game1HorizontalConditions.push([0, 0, 3, 35, 3]);
			_game1HorizontalConditions.push([1, 1, 10, 10, 4]);
			_game1HorizontalConditions.push([0, 0, 42, 23, 42]);
			_game1HorizontalConditions.push([1, 0, 44, 4, 55]);
			_game1HorizontalConditions.push([0, 0, 50, 32, 50]);
			_game1HorizontalConditions.push([0, 0, 11, 41, 11]);
			_game1HorizontalConditions.push([1, 1, 20, 44, 21]);
			_game1HorizontalConditions.push([0, 0, 21, 43, 21]);
			_game1HorizontalConditions.push([0, 0, 22, 14, 22]);
			_game1HorizontalConditions.push([0, 0, 24, 10, 24]);
		}
		
		private function setGame2Data():void
		{
			_game2Solution = new Array(6);
			
			// person
			_game2Solution[0] = new Array(6);
			_game2Solution[0][0] = 0;
			_game2Solution[0][1] = 5;
			_game2Solution[0][2] = 4;
			_game2Solution[0][3] = 1;
			_game2Solution[0][4] = 2;
			_game2Solution[0][5] = 3;
			
			// house
			_game2Solution[1] = new Array(6);
			_game2Solution[1][0] = 12;
			_game2Solution[1][1] = 11;
			_game2Solution[1][2] = 10;
			_game2Solution[1][3] = 13;
			_game2Solution[1][4] = 14;
			_game2Solution[1][5] = 15;
			
			// number
			_game2Solution[2] = new Array(6);
			_game2Solution[2][0] = 23;
			_game2Solution[2][1] = 21;
			_game2Solution[2][2] = 24;
			_game2Solution[2][3] = 20;
			_game2Solution[2][4] = 22;
			_game2Solution[2][5] = 25;
			
			// fruit
			_game2Solution[3] = new Array(6);
			_game2Solution[3][0] = 30;
			_game2Solution[3][1] = 33;
			_game2Solution[3][2] = 32;
			_game2Solution[3][3] = 35;
			_game2Solution[3][4] = 31;
			_game2Solution[3][5] = 34;
			
			// transport
			_game2Solution[4] = new Array(6);
			_game2Solution[4][0] = 41;
			_game2Solution[4][1] = 40;
			_game2Solution[4][2] = 42;
			_game2Solution[4][3] = 44;
			_game2Solution[4][4] = 45;
			_game2Solution[4][5] = 43;
			
			// character
			_game2Solution[5] = new Array(6);
			_game2Solution[5][0] = 52;
			_game2Solution[5][1] = 50;
			_game2Solution[5][2] = 51;
			_game2Solution[5][3] = 53;
			_game2Solution[5][4] = 54;
			_game2Solution[5][5] = 55;
			
			// set images opened on start
			_game2OpenedImages = new Array();
			_game2OpenedImages.push([1,2,10], [3,4,31], [4,1,40]);
			
			// set vertical conditions
			_game2VerticalConditions = new Array();
			_game2VerticalConditions.push([0, 3, 55]);
			_game2VerticalConditions.push([0, 12, 52]);
			_game2VerticalConditions.push([0, 12, 30]);
			_game2VerticalConditions.push([0, 35, 44]);
			_game2VerticalConditions.push([0, 20, 35]);
			
			// set horizontal conditions
			_game2HorizontalConditions = new Array();
			_game2HorizontalConditions.push([0, 0, 11, 23, 11]);
			_game2HorizontalConditions.push([0, 0, 43, 2, 43]);
			_game2HorizontalConditions.push([0, 2, 5, -1, 35]);
			_game2HorizontalConditions.push([0, 0, 42, 53, 42]);
			_game2HorizontalConditions.push([0, 0, 52, 50, 52]);
			_game2HorizontalConditions.push([0, 0, 15, 2, 15]);
			_game2HorizontalConditions.push([0, 2, 32, -1, 25]);
			_game2HorizontalConditions.push([1, 0, 4, 13, 22]);
			_game2HorizontalConditions.push([0, 0, 20, 2, 20]);
			_game2HorizontalConditions.push([0, 1, 21, 1, 21]);
			_game2HorizontalConditions.push([0, 0, 41, 5, 41]);
			_game2HorizontalConditions.push([0, 0, 33, 32, 33]);
			_game2HorizontalConditions.push([0, 0, 24, 44, 24]);
			_game2HorizontalConditions.push([0, 2, 51, -1, 20]);
			_game2HorizontalConditions.push([0, 0, 10, 50, 10]);
			_game2HorizontalConditions.push([0, 0, 42, 33, 42]);
			_game2HorizontalConditions.push([0, 0, 41, 11, 41]);
			_game2HorizontalConditions.push([0, 0, 44, 32, 44]);
		}
		
		private function setGame3Data():void
		{
			_game3Solution = new Array(6);
			
			// person
			_game3Solution[0] = new Array(6);
			_game3Solution[0][0] = 3;
			_game3Solution[0][1] = 2;
			_game3Solution[0][2] = 4;
			_game3Solution[0][3] = 0;
			_game3Solution[0][4] = 5;
			_game3Solution[0][5] = 1;
			
			// house
			_game3Solution[1] = new Array(6);
			_game3Solution[1][0] = 11;
			_game3Solution[1][1] = 10;
			_game3Solution[1][2] = 12;
			_game3Solution[1][3] = 15;
			_game3Solution[1][4] = 14;
			_game3Solution[1][5] = 13;
			
			// number
			_game3Solution[2] = new Array(6);
			_game3Solution[2][0] = 24;
			_game3Solution[2][1] = 21;
			_game3Solution[2][2] = 25;
			_game3Solution[2][3] = 20;
			_game3Solution[2][4] = 22;
			_game3Solution[2][5] = 23;
			
			// fruit
			_game3Solution[3] = new Array(6);
			_game3Solution[3][0] = 35;
			_game3Solution[3][1] = 32;
			_game3Solution[3][2] = 34;
			_game3Solution[3][3] = 33;
			_game3Solution[3][4] = 31;
			_game3Solution[3][5] = 30;
			
			// transport
			_game3Solution[4] = new Array(6);
			_game3Solution[4][0] = 41;
			_game3Solution[4][1] = 40;
			_game3Solution[4][2] = 44;
			_game3Solution[4][3] = 42;
			_game3Solution[4][4] = 43;
			_game3Solution[4][5] = 45;
			
			// character
			_game3Solution[5] = new Array(6);
			_game3Solution[5][0] = 51;
			_game3Solution[5][1] = 54;
			_game3Solution[5][2] = 53;
			_game3Solution[5][3] = 55;
			_game3Solution[5][4] = 52;
			_game3Solution[5][5] = 50;
			
			// set images opened on start
			_game3OpenedImages = new Array();
			_game3OpenedImages.push([0,1,2], [3,5,30]);
			
			// set vertical conditions
			_game3VerticalConditions = new Array();
			_game3VerticalConditions.push([0, 11, 51]);
			_game3VerticalConditions.push([0, 10, 40]);
			_game3VerticalConditions.push([0, 20, 42]);
			_game3VerticalConditions.push([0, 0, 55]);
			_game3VerticalConditions.push([0, 31, 43]);
			_game3VerticalConditions.push([0, 14, 31]);
			_game3VerticalConditions.push([0, 1, 13]);
			_game3VerticalConditions.push([0, 12, 44]);
			_game3VerticalConditions.push([0, 33, 55]);
			_game3VerticalConditions.push([0, 1, 45]);
			
			// set horizontal conditions
			_game3HorizontalConditions = new Array();
			_game3HorizontalConditions.push([0, 1, 44, 35, 44]);
			_game3HorizontalConditions.push([1, 0, 41, 10, 4]);
			_game3HorizontalConditions.push([1, 0, 20, 44, 54]);
			_game3HorizontalConditions.push([0, 0, 33, 53, 33]);
			_game3HorizontalConditions.push([0, 0, 25, 55, 25]);
			_game3HorizontalConditions.push([0, 2, 41, -1, 34]);
			_game3HorizontalConditions.push([0, 0, 5, 15, 5]);
			_game3HorizontalConditions.push([0, 0, 31, 45, 31]);
			_game3HorizontalConditions.push([1, 0, 3, 32, 34]);
			_game3HorizontalConditions.push([0, 0, 22, 30, 22]);
			_game3HorizontalConditions.push([0, 0, 13, 52, 13]);
			_game3HorizontalConditions.push([0, 0, 1, 5, 1]);
			_game3HorizontalConditions.push([0, 0, 24, 54, 24]);
			_game3HorizontalConditions.push([1, 1, 31, 54, 44]);
			_game3HorizontalConditions.push([0, 0, 25, 21, 25]);
		}
		
		private function setGame4Data():void
		{
			_game4Solution = new Array(6);
			
			// person
			_game4Solution[0] = new Array(6);
			_game4Solution[0][0] = 5;
			_game4Solution[0][1] = 4;
			_game4Solution[0][2] = 0;
			_game4Solution[0][3] = 1;
			_game4Solution[0][4] = 2;
			_game4Solution[0][5] = 3;
			
			// house
			_game4Solution[1] = new Array(6);
			_game4Solution[1][0] = 10;
			_game4Solution[1][1] = 13;
			_game4Solution[1][2] = 12;
			_game4Solution[1][3] = 15;
			_game4Solution[1][4] = 14;
			_game4Solution[1][5] = 11;
			
			// number
			_game4Solution[2] = new Array(6);
			_game4Solution[2][0] = 20;
			_game4Solution[2][1] = 22;
			_game4Solution[2][2] = 23;
			_game4Solution[2][3] = 21;
			_game4Solution[2][4] = 25;
			_game4Solution[2][5] = 24;
			
			// fruit
			_game4Solution[3] = new Array(6);
			_game4Solution[3][0] = 35;
			_game4Solution[3][1] = 31;
			_game4Solution[3][2] = 32;
			_game4Solution[3][3] = 33;
			_game4Solution[3][4] = 30;
			_game4Solution[3][5] = 34;
			
			// transport
			_game4Solution[4] = new Array(6);
			_game4Solution[4][0] = 43;
			_game4Solution[4][1] = 41;
			_game4Solution[4][2] = 44;
			_game4Solution[4][3] = 40;
			_game4Solution[4][4] = 42;
			_game4Solution[4][5] = 45;
			
			// character
			_game4Solution[5] = new Array(6);
			_game4Solution[5][0] = 54;
			_game4Solution[5][1] = 55;
			_game4Solution[5][2] = 52;
			_game4Solution[5][3] = 51;
			_game4Solution[5][4] = 53;
			_game4Solution[5][5] = 50;
			
			// set images opened on start
			_game4OpenedImages = new Array();
			_game4OpenedImages.push([0,0,5], [0,5,3], [1,1,13], [2,1,22]);
			
			// set vertical conditions
			_game4VerticalConditions = new Array();
			_game4VerticalConditions.push([0, 11, 24]);
			_game4VerticalConditions.push([0, 0, 32]);
			_game4VerticalConditions.push([0, 24, 45]);
			_game4VerticalConditions.push([0, 15, 33]);
			_game4VerticalConditions.push([0, 2, 25]);
			_game4VerticalConditions.push([0, 23, 52]);
			_game4VerticalConditions.push([0, 45, 50]);
			
			// set horizontal conditions
			_game4HorizontalConditions = new Array();
			_game4HorizontalConditions.push([0, 0, 53, 34, 53]);
			_game4HorizontalConditions.push([0, 0, 35, 41, 35]);
			_game4HorizontalConditions.push([0, 0, 10, 4, 10]);
			_game4HorizontalConditions.push([0, 0, 43, 55, 43]);
			_game4HorizontalConditions.push([0, 0, 30, 33, 30]);
			_game4HorizontalConditions.push([1, 0, 24, 53, 21]);
			_game4HorizontalConditions.push([0, 2, 13, -1, 44]);
			_game4HorizontalConditions.push([0, 2, 31, -1, 12]);
			_game4HorizontalConditions.push([0, 0, 51, 52, 51]);
			_game4HorizontalConditions.push([1, 1, 42, 23, 32]);
			_game4HorizontalConditions.push([0, 0, 14, 3, 14]);
			_game4HorizontalConditions.push([0, 0, 50, 14, 50]);
			_game4HorizontalConditions.push([0, 0, 12, 31, 12]);
			_game4HorizontalConditions.push([0, 0, 34, 30, 34]);
			_game4HorizontalConditions.push([0, 0, 22, 43, 22]);
			_game4HorizontalConditions.push([0, 0, 44, 41, 44]);
		}
		
		private function setGame5Data():void
		{
			_game5Solution = new Array(6);
			
			// person
			_game5Solution[0] = new Array(6);
			_game5Solution[0][0] = 1;
			_game5Solution[0][1] = 2;
			_game5Solution[0][2] = 4;
			_game5Solution[0][3] = 3;
			_game5Solution[0][4] = 5;
			_game5Solution[0][5] = 0;
			
			// house
			_game5Solution[1] = new Array(6);
			_game5Solution[1][0] = 15;
			_game5Solution[1][1] = 13;
			_game5Solution[1][2] = 11;
			_game5Solution[1][3] = 10;
			_game5Solution[1][4] = 12;
			_game5Solution[1][5] = 14;
			
			// number
			_game5Solution[2] = new Array(6);
			_game5Solution[2][0] = 25;
			_game5Solution[2][1] = 20;
			_game5Solution[2][2] = 24;
			_game5Solution[2][3] = 21;
			_game5Solution[2][4] = 23;
			_game5Solution[2][5] = 22;
			
			// fruit
			_game5Solution[3] = new Array(6);
			_game5Solution[3][0] = 34;
			_game5Solution[3][1] = 31;
			_game5Solution[3][2] = 33;
			_game5Solution[3][3] = 35;
			_game5Solution[3][4] = 30;
			_game5Solution[3][5] = 32;
			
			// transport
			_game5Solution[4] = new Array(6);
			_game5Solution[4][0] = 43;
			_game5Solution[4][1] = 40;
			_game5Solution[4][2] = 44;
			_game5Solution[4][3] = 41;
			_game5Solution[4][4] = 45;
			_game5Solution[4][5] = 42;
			
			// character
			_game5Solution[5] = new Array(6);
			_game5Solution[5][0] = 53;
			_game5Solution[5][1] = 51;
			_game5Solution[5][2] = 50;
			_game5Solution[5][3] = 54;
			_game5Solution[5][4] = 55;
			_game5Solution[5][5] = 52;
			
			// set images opened on start
			_game5OpenedImages = new Array();
			_game5OpenedImages.push([3,1,31]);
			
			// set vertical conditions
			_game5VerticalConditions = new Array();
			_game5VerticalConditions.push([0, 11, 33]);
			_game5VerticalConditions.push([0, 14, 42]);
			_game5VerticalConditions.push([0, 11, 24]);
			_game5VerticalConditions.push([0, 22, 32]);
			_game5VerticalConditions.push([0, 12, 23]);
			_game5VerticalConditions.push([0, 12, 30]);
			_game5VerticalConditions.push([0, 25, 53]);
			_game5VerticalConditions.push([0, 42, 52]);
			_game5VerticalConditions.push([0, 5, 55]);
			
			// set horizontal conditions
			_game5HorizontalConditions = new Array();
			_game5HorizontalConditions.push([0, 2, 31, -1, 11]);
			_game5HorizontalConditions.push([1, 1, 2, 43, 3]);
			_game5HorizontalConditions.push([1, 1, 52, 2, 35]);
			_game5HorizontalConditions.push([0, 0, 25, 13, 25]);
			_game5HorizontalConditions.push([0, 2, 33, -1, 21]);
			_game5HorizontalConditions.push([0, 0, 53, 31, 53]);
			_game5HorizontalConditions.push([0, 0, 34, 40, 34]);
			_game5HorizontalConditions.push([0, 0, 41, 44, 41]);
			_game5HorizontalConditions.push([0, 0, 0, 23, 0]);
			_game5HorizontalConditions.push([1, 0, 52, 45, 41]);
			_game5HorizontalConditions.push([0, 0, 51, 1, 51]);
			_game5HorizontalConditions.push([0, 0, 55, 22, 55]);
			_game5HorizontalConditions.push([0, 0, 20, 11, 20]);
			_game5HorizontalConditions.push([0, 0, 4, 35, 4]);
			_game5HorizontalConditions.push([0, 0, 50, 10, 50]);
			_game5HorizontalConditions.push([0, 0, 3, 45, 3]);
		}
		
		private function setGame6Data():void
		{
			_game6Solution = new Array(6);
			
			// person
			_game6Solution[0] = new Array(6);
			_game6Solution[0][0] = 2;
			_game6Solution[0][1] = 4;
			_game6Solution[0][2] = 3;
			_game6Solution[0][3] = 0;
			_game6Solution[0][4] = 5;
			_game6Solution[0][5] = 1;
			
			// house
			_game6Solution[1] = new Array(6);
			_game6Solution[1][0] = 11;
			_game6Solution[1][1] = 12;
			_game6Solution[1][2] = 14;
			_game6Solution[1][3] = 13;
			_game6Solution[1][4] = 10;
			_game6Solution[1][5] = 15;
			
			// number
			_game6Solution[2] = new Array(6);
			_game6Solution[2][0] = 23;
			_game6Solution[2][1] = 20;
			_game6Solution[2][2] = 22;
			_game6Solution[2][3] = 24;
			_game6Solution[2][4] = 25;
			_game6Solution[2][5] = 21;
			
			// fruit
			_game6Solution[3] = new Array(6);
			_game6Solution[3][0] = 35;
			_game6Solution[3][1] = 34;
			_game6Solution[3][2] = 33;
			_game6Solution[3][3] = 32;
			_game6Solution[3][4] = 31;
			_game6Solution[3][5] = 30;
			
			// transport
			_game6Solution[4] = new Array(6);
			_game6Solution[4][0] = 42;
			_game6Solution[4][1] = 45;
			_game6Solution[4][2] = 44;
			_game6Solution[4][3] = 41;
			_game6Solution[4][4] = 43;
			_game6Solution[4][5] = 40;
			
			// character
			_game6Solution[5] = new Array(6);
			_game6Solution[5][0] = 52;
			_game6Solution[5][1] = 54;
			_game6Solution[5][2] = 51;
			_game6Solution[5][3] = 55;
			_game6Solution[5][4] = 50;
			_game6Solution[5][5] = 53;
			
			// set images opened on start
			_game6OpenedImages = new Array();
			_game6OpenedImages.push([5,4,50]);
			
			// set vertical conditions
			_game6VerticalConditions = new Array();
			_game6VerticalConditions.push([1, 15, 24]);
			_game6VerticalConditions.push([0, 25, 50]);
			_game6VerticalConditions.push([0, 20, 54]);
			_game6VerticalConditions.push([0, 12, 45]);
			_game6VerticalConditions.push([0, 13, 55]);
			_game6VerticalConditions.push([0, 1, 21]);
			_game6VerticalConditions.push([0, 42, 52]);
			_game6VerticalConditions.push([0, 3, 22]);
			
			// set horizontal conditions
			_game6HorizontalConditions = new Array();
			_game6HorizontalConditions.push([0, 0, 45, 44, 45]);
			_game6HorizontalConditions.push([1, 1, 2, 0, 51]);
			_game6HorizontalConditions.push([1, 0, 52, 54, 14]);
			_game6HorizontalConditions.push([0, 0, 15, 31, 15]);
			_game6HorizontalConditions.push([1, 1, 41, 40, 34]);
			_game6HorizontalConditions.push([0, 0, 32, 50, 32]);
			_game6HorizontalConditions.push([0, 0, 33, 32, 33]);
			_game6HorizontalConditions.push([0, 0, 21, 10, 21]);
			_game6HorizontalConditions.push([0, 0, 53, 5, 53]);
			_game6HorizontalConditions.push([0, 2, 54, -1, 30]);
			_game6HorizontalConditions.push([1, 0, 22, 32, 43]);
			_game6HorizontalConditions.push([0, 0, 35, 34, 35]);
			_game6HorizontalConditions.push([0, 0, 1, 25, 1]);
			_game6HorizontalConditions.push([0, 0, 24, 3, 24]);
			_game6HorizontalConditions.push([0, 0, 2, 20, 2]);
		}
		
		private function setGame7Data():void
		{
			_game7Solution = new Array(6);
			
			// person
			_game7Solution[0] = new Array(6);
			_game7Solution[0][0] = 0;
			_game7Solution[0][1] = 4;
			_game7Solution[0][2] = 1;
			_game7Solution[0][3] = 2;
			_game7Solution[0][4] = 3;
			_game7Solution[0][5] = 5;
			
			// house
			_game7Solution[1] = new Array(6);
			_game7Solution[1][0] = 15;
			_game7Solution[1][1] = 11;
			_game7Solution[1][2] = 12;
			_game7Solution[1][3] = 13;
			_game7Solution[1][4] = 10;
			_game7Solution[1][5] = 14;
			
			// number
			_game7Solution[2] = new Array(6);
			_game7Solution[2][0] = 23;
			_game7Solution[2][1] = 25;
			_game7Solution[2][2] = 20;
			_game7Solution[2][3] = 24;
			_game7Solution[2][4] = 21;
			_game7Solution[2][5] = 22;
			
			// fruit
			_game7Solution[3] = new Array(6);
			_game7Solution[3][0] = 32;
			_game7Solution[3][1] = 30;
			_game7Solution[3][2] = 31;
			_game7Solution[3][3] = 34;
			_game7Solution[3][4] = 35;
			_game7Solution[3][5] = 33;
			
			// transport
			_game7Solution[4] = new Array(6);
			_game7Solution[4][0] = 40;
			_game7Solution[4][1] = 41;
			_game7Solution[4][2] = 45;
			_game7Solution[4][3] = 42;
			_game7Solution[4][4] = 43;
			_game7Solution[4][5] = 44;
			
			// character
			_game7Solution[5] = new Array(6);
			_game7Solution[5][0] = 55;
			_game7Solution[5][1] = 50;
			_game7Solution[5][2] = 54;
			_game7Solution[5][3] = 52;
			_game7Solution[5][4] = 51;
			_game7Solution[5][5] = 53;
			
			// set images opened on start
			_game7OpenedImages = new Array();
			_game7OpenedImages.push([0,2,1], [1,3,13], [1,4,10], [2,5,22], [4,5,44]);
			
			// set vertical conditions
			_game7VerticalConditions = new Array();
			_game7VerticalConditions.push([0, 25, 30]);
			_game7VerticalConditions.push([0, 15, 55]);
			_game7VerticalConditions.push([0, 3, 21]);
			_game7VerticalConditions.push([0, 22, 53]);
			_game7VerticalConditions.push([0, 0, 55]);
			
			// set horizontal conditions
			_game7HorizontalConditions = new Array();
			_game7HorizontalConditions.push([0, 0, 43, 52, 43]);
			_game7HorizontalConditions.push([0, 0, 23, 4, 23]);
			_game7HorizontalConditions.push([1, 1, 2, 24, 25]);
			_game7HorizontalConditions.push([0, 0, 20, 2, 20]);
			_game7HorizontalConditions.push([0, 0, 34, 45, 34]);
			_game7HorizontalConditions.push([0, 0, 53, 43, 53]);
			_game7HorizontalConditions.push([0, 0, 41, 1, 41]);
			_game7HorizontalConditions.push([1, 0, 10, 42, 31]);
			_game7HorizontalConditions.push([0, 0, 13, 35, 13]);
			_game7HorizontalConditions.push([0, 0, 24, 12, 24]);
			_game7HorizontalConditions.push([0, 0, 51, 53, 51]);
			_game7HorizontalConditions.push([0, 0, 50, 32, 50]);
			_game7HorizontalConditions.push([1, 0, 25, 12, 42]);
			_game7HorizontalConditions.push([1, 0, 14, 10, 13]);
		}
		
		private function setGame8Data():void
		{
			_game8Solution = new Array(6);
			
			// person
			_game8Solution[0] = new Array(6);
			_game8Solution[0][0] = 5;
			_game8Solution[0][1] = 2;
			_game8Solution[0][2] = 4;
			_game8Solution[0][3] = 0;
			_game8Solution[0][4] = 1;
			_game8Solution[0][5] = 3;
			
			// house
			_game8Solution[1] = new Array(6);
			_game8Solution[1][0] = 13;
			_game8Solution[1][1] = 10;
			_game8Solution[1][2] = 15;
			_game8Solution[1][3] = 12;
			_game8Solution[1][4] = 11;
			_game8Solution[1][5] = 14;
			
			// number
			_game8Solution[2] = new Array(6);
			_game8Solution[2][0] = 24;
			_game8Solution[2][1] = 21;
			_game8Solution[2][2] = 22;
			_game8Solution[2][3] = 20;
			_game8Solution[2][4] = 25;
			_game8Solution[2][5] = 23;
			
			// fruit
			_game8Solution[3] = new Array(6);
			_game8Solution[3][0] = 32;
			_game8Solution[3][1] = 34;
			_game8Solution[3][2] = 35;
			_game8Solution[3][3] = 33;
			_game8Solution[3][4] = 31;
			_game8Solution[3][5] = 30;
			
			// transport
			_game8Solution[4] = new Array(6);
			_game8Solution[4][0] = 42;
			_game8Solution[4][1] = 43;
			_game8Solution[4][2] = 40;
			_game8Solution[4][3] = 44;
			_game8Solution[4][4] = 45;
			_game8Solution[4][5] = 41;
			
			// character
			_game8Solution[5] = new Array(6);
			_game8Solution[5][0] = 50;
			_game8Solution[5][1] = 51;
			_game8Solution[5][2] = 52;
			_game8Solution[5][3] = 55;
			_game8Solution[5][4] = 53;
			_game8Solution[5][5] = 54;
			
			// set images opened on start
			_game8OpenedImages = new Array();
			_game8OpenedImages.push([1,2,15]);
			
			// set vertical conditions
			_game8VerticalConditions = new Array();
			_game8VerticalConditions.push([0, 3, 23]);
			_game8VerticalConditions.push([0, 12, 20]);
			_game8VerticalConditions.push([0, 24, 42]);
			_game8VerticalConditions.push([0, 32, 50]);
			_game8VerticalConditions.push([0, 2, 43]);
			_game8VerticalConditions.push([0, 14, 30]);
			_game8VerticalConditions.push([0, 31, 53]);
			_game8VerticalConditions.push([0, 40, 52]);
			
			// set horizontal conditions
			_game8HorizontalConditions = new Array();
			_game8HorizontalConditions.push([1, 0, 15, 21, 42]);
			_game8HorizontalConditions.push([0, 0, 33, 52, 33]);
			_game8HorizontalConditions.push([1, 1, 32, 50, 22]);
			_game8HorizontalConditions.push([0, 0, 11, 44, 11]);
			_game8HorizontalConditions.push([0, 0, 51, 5, 51]);
			_game8HorizontalConditions.push([0, 0, 24, 2, 24]);
			_game8HorizontalConditions.push([0, 0, 35, 44, 35]);
			_game8HorizontalConditions.push([0, 0, 55, 1, 55]);
			_game8HorizontalConditions.push([0, 0, 31, 41, 31]);
			_game8HorizontalConditions.push([1, 1, 40, 4, 31]);
			_game8HorizontalConditions.push([0, 0, 33, 15, 33]);
			_game8HorizontalConditions.push([1, 0, 42, 34, 4]);
			_game8HorizontalConditions.push([0, 0, 50, 2, 50]);
			_game8HorizontalConditions.push([0, 0, 30, 53, 30]);
			_game8HorizontalConditions.push([0, 0, 13, 43, 13]);
			_game8HorizontalConditions.push([0, 0, 55, 11, 55]);
			_game8HorizontalConditions.push([0, 0, 4, 55, 4]);
		}
		
		private function setGame9Data():void
		{
			_game9Solution = new Array(6);
			
			// person
			_game9Solution[0] = new Array(6);
			_game9Solution[0][0] = 5;
			_game9Solution[0][1] = 0;
			_game9Solution[0][2] = 3;
			_game9Solution[0][3] = 2;
			_game9Solution[0][4] = 4;
			_game9Solution[0][5] = 1;
			
			// house
			_game9Solution[1] = new Array(6);
			_game9Solution[1][0] = 13;
			_game9Solution[1][1] = 15;
			_game9Solution[1][2] = 11;
			_game9Solution[1][3] = 14;
			_game9Solution[1][4] = 10;
			_game9Solution[1][5] = 12;
			
			// number
			_game9Solution[2] = new Array(6);
			_game9Solution[2][0] = 21;
			_game9Solution[2][1] = 22;
			_game9Solution[2][2] = 24;
			_game9Solution[2][3] = 23;
			_game9Solution[2][4] = 20;
			_game9Solution[2][5] = 25;
			
			// fruit
			_game9Solution[3] = new Array(6);
			_game9Solution[3][0] = 35;
			_game9Solution[3][1] = 31;
			_game9Solution[3][2] = 33;
			_game9Solution[3][3] = 32;
			_game9Solution[3][4] = 34;
			_game9Solution[3][5] = 30;
			
			// transport
			_game9Solution[4] = new Array(6);
			_game9Solution[4][0] = 43;
			_game9Solution[4][1] = 40;
			_game9Solution[4][2] = 42;
			_game9Solution[4][3] = 44;
			_game9Solution[4][4] = 41;
			_game9Solution[4][5] = 45;
			
			// character
			_game9Solution[5] = new Array(6);
			_game9Solution[5][0] = 54;
			_game9Solution[5][1] = 51;
			_game9Solution[5][2] = 52;
			_game9Solution[5][3] = 53;
			_game9Solution[5][4] = 50;
			_game9Solution[5][5] = 55;
			
			// set images opened on start
			_game9OpenedImages = new Array();
			_game9OpenedImages.push([2,3,23], [4,0,43], [5,5,55]);
			
			// set vertical conditions
			_game9VerticalConditions = new Array();
			_game9VerticalConditions.push([0, 14, 53]);
			_game9VerticalConditions.push([0, 31, 51]);
			
			// set horizontal conditions
			_game9HorizontalConditions = new Array();
			_game9HorizontalConditions.push([1, 0, 4, 44, 11]);
			_game9HorizontalConditions.push([1, 1, 20, 35, 3]);
			_game9HorizontalConditions.push([0, 0, 30, 4, 30]);
			_game9HorizontalConditions.push([1, 1, 50, 1, 11]);
			_game9HorizontalConditions.push([0, 2, 52, -1, 50]);
			_game9HorizontalConditions.push([0, 0, 40, 5, 40]);
			_game9HorizontalConditions.push([1, 0, 33, 51, 43]);
			_game9HorizontalConditions.push([0, 0, 0, 54, 0]);
			_game9HorizontalConditions.push([0, 0, 12, 20, 12]);
			_game9HorizontalConditions.push([0, 0, 22, 52, 22]);
			_game9HorizontalConditions.push([1, 0, 42, 32, 20]);
			_game9HorizontalConditions.push([1, 0, 3, 15, 54]);
			_game9HorizontalConditions.push([0, 0, 21, 15, 21]);
			_game9HorizontalConditions.push([0, 2, 24, -1, 34]);
			_game9HorizontalConditions.push([0, 0, 31, 13, 31]);
			_game9HorizontalConditions.push([0, 0, 41, 55, 41]);
			_game9HorizontalConditions.push([0, 2, 54, -1, 24]);
		}
	}
}
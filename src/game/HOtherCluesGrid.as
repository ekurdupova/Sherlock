package game
{
	public class HOtherCluesGrid extends HConditionsGrid
	{
		private var _index:int = 0;
		
		public function HOtherCluesGrid()
		{
			super();
		}
		
		public function addClue(hasArrow:Boolean, middleImageType:int,
								leftImgNum:int, middleImgNumb:int, rightImgNum:int):void
		{
			this.addConditionAt(hasArrow, middleImageType, leftImgNum, middleImgNumb, rightImgNum, _index);
			++_index;
		}
		
		public function removeClue():void
		{
			--_index;
			this.addEmptyConditionAt(_index);
		}
	}
}
package game
{
	public class VOtherCluesGrid extends VConditionsGrid
	{
		private var _index:int = 0;
		
		public function VOtherCluesGrid()
		{
			super();
		}
		
		public function addClue(isRegular:Boolean, topImgNum:int, bottomImgNum:int):void
		{
			this.addConditionAt(isRegular, topImgNum, bottomImgNum, _index);
			_index++;
		}
		
		public function removeClue():void
		{
			--_index;
			this.removeChildAt(_index);
			this.addEmptyCondition(_index);
		}
	}
}
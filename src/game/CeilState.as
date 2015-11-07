package game
{
	public class CeilState
	{
		private var _selectedImgNumber:int = -1;
		private var _showedImages:Array;
		
		public function CeilState(selectedImgNumber:int, showedImages:Array)
		{
			_selectedImgNumber = selectedImgNumber;
			_showedImages = showedImages;
		}
		
		public function get selectedImgNumber():int
		{
			return _selectedImgNumber;
		}
	}
}
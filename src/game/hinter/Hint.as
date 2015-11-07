package game.hinter
{
	import mx.controls.Alert;

	public class Hint implements IHint
	{
		private var _column:int;
		private var _row:int;
		
		public function Hint(column:int, row:int)
		{
			_column = column;
			_row = row;
		}
		
		public function highlightCeil():void
		{
			Alert.show(_column.toString(), _row.toString());
		}
	}
}
package game.hinter
{
	import flash.display.Sprite;

	public class WrongImageHiddenHint extends Hint implements IHint
	{
		public function WrongImageHiddenHint(column:int, row:int, scene:Sprite)
		{
			super(column, row, scene);
		}
	}
}

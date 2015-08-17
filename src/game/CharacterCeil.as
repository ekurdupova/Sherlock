package game
{
	public class CharacterCeil extends Ceil
	{
		public function CharacterCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.character1Cls, 50);
			addImageToRow(images.character2Cls, 51);
			addImageToRow(images.character3Cls, 52);

			addImageToRow(images.character4Cls, 53);
			addImageToRow(images.character5Cls, 54);
			addImageToRow(images.character6Cls, 55);
		}
	}
}
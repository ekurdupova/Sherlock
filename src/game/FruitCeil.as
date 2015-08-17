package game
{
	public class FruitCeil extends Ceil
	{
		public function FruitCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.fruit1Cls, 30);
			addImageToRow(images.fruit2Cls, 31);
			addImageToRow(images.fruit3Cls, 32);

			addImageToRow(images.fruit4Cls, 33);
			addImageToRow(images.fruit5Cls, 34);
			addImageToRow(images.fruit6Cls, 35);
		}
	}
}
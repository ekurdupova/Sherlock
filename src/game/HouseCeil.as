package game
{
	public class HouseCeil extends Ceil
	{
		public function HouseCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.house1Cls, 10);
			addImageToRow(images.house2Cls, 11);
			addImageToRow(images.house3Cls, 12);

			addImageToRow(images.house4Cls, 13);
			addImageToRow(images.house5Cls, 14);
			addImageToRow(images.house6Cls, 15);
		}
	}
}
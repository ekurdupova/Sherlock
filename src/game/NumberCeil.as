package game
{
	public class NumberCeil extends Ceil
	{
		public function NumberCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.number1Cls, 20);
			addImageToRow(images.number2Cls, 21);
			addImageToRow(images.number3Cls, 22);

			addImageToRow(images.number4Cls, 23);
			addImageToRow(images.number5Cls, 24);
			addImageToRow(images.number6Cls, 25);
		}
	}
}
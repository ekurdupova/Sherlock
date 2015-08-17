package game
{
	public class TransportCeil extends Ceil
	{
		public function TransportCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.transport1Cls, 40);
			addImageToRow(images.transport2Cls, 41);
			addImageToRow(images.transport3Cls, 42);

			addImageToRow(images.transport4Cls, 43);
			addImageToRow(images.transport5Cls, 44);
			addImageToRow(images.transport6Cls, 45);
		}
	}
}
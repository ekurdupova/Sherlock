package game
{
	import mx.controls.Image;
	
	public class PersonCeil extends Ceil
	{
		public function PersonCeil()
		{
			super();
		}
		
		override protected function onCreationComplete():void
		{
			super.onCreationComplete();
			
			var images:Images = new Images();
			
			addImageToRow(images.person1Cls, 0);
			addImageToRow(images.person2Cls, 1);
			addImageToRow(images.person3Cls, 2);
			
			addImageToRow(images.person4Cls, 3);
			addImageToRow(images.person5Cls, 4);
			addImageToRow(images.person6Cls, 5);
		}
	}
}
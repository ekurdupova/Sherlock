package game
{
	public class Images
	{
		[Embed(source="./../../images/00.jpg")]
		[Bindable]
		public var person1Cls:Class;

		[Embed(source="./../../images/01.jpg")]
		[Bindable]
		public var person2Cls:Class;

		[Embed(source="./../../images/02.jpg")]
		[Bindable]
		public var person3Cls:Class;

		[Embed(source="./../../images/03.jpg")]
		[Bindable]
		public var person4Cls:Class;

		[Embed(source="./../../images/04.jpg")]
		[Bindable]
		public var person5Cls:Class;

		[Embed(source="./../../images/05.jpg")]
		[Bindable]
		public var person6Cls:Class;
		
		[Embed(source="./../../images/10.jpg")]
		[Bindable]
		public var house1Cls:Class;

		[Embed(source="./../../images/11.jpg")]
		[Bindable]
		public var house2Cls:Class;

		[Embed(source="./../../images/12.jpg")]
		[Bindable]
		public var house3Cls:Class;

		[Embed(source="./../../images/13.jpg")]
		[Bindable]
		public var house4Cls:Class;

		[Embed(source="./../../images/14.jpg")]
		[Bindable]
		public var house5Cls:Class;

		[Embed(source="./../../images/15.jpg")]
		[Bindable]
		public var house6Cls:Class;
		
		[Embed(source="./../../images/20.jpg")]
		[Bindable]
		public var number1Cls:Class;

		[Embed(source="./../../images/21.jpg")]
		[Bindable]
		public var number2Cls:Class;

		[Embed(source="./../../images/22.jpg")]
		[Bindable]
		public var number3Cls:Class;

		[Embed(source="./../../images/23.jpg")]
		[Bindable]
		public var number4Cls:Class;

		[Embed(source="./../../images/24.jpg")]
		[Bindable]
		public var number5Cls:Class;

		[Embed(source="./../../images/25.jpg")]
		[Bindable]
		public var number6Cls:Class;

		[Embed(source="./../../images/30.jpg")]
		[Bindable]
		public var fruit1Cls:Class;

		[Embed(source="./../../images/31.jpg")]
		[Bindable]
		public var fruit2Cls:Class;

		[Embed(source="./../../images/32.jpg")]
		[Bindable]
		public var fruit3Cls:Class;

		[Embed(source="./../../images/33.jpg")]
		[Bindable]
		public var fruit4Cls:Class;

		[Embed(source="./../../images/34.jpg")]
		[Bindable]
		public var fruit5Cls:Class;

		[Embed(source="./../../images/35.jpg")]
		[Bindable]
		public var fruit6Cls:Class;

		[Embed(source="./../../images/40.jpg")]
		[Bindable]
		public var transport1Cls:Class;

		[Embed(source="./../../images/41.jpg")]
		[Bindable]
		public var transport2Cls:Class;

		[Embed(source="./../../images/42.jpg")]
		[Bindable]
		public var transport3Cls:Class;

		[Embed(source="./../../images/43.jpg")]
		[Bindable]
		public var transport4Cls:Class;

		[Embed(source="./../../images/44.jpg")]
		[Bindable]
		public var transport5Cls:Class;

		[Embed(source="./../../images/45.jpg")]
		[Bindable]
		public var transport6Cls:Class;

		[Embed(source="./../../images/50.jpg")]
		[Bindable]
		public var character1Cls:Class;

		[Embed(source="./../../images/51.jpg")]
		[Bindable]
		public var character2Cls:Class;

		[Embed(source="./../../images/52.jpg")]
		[Bindable]
		public var character3Cls:Class;

		[Embed(source="./../../images/53.jpg")]
		[Bindable]
		public var character4Cls:Class;

		[Embed(source="./../../images/54.jpg")]
		[Bindable]
		public var character5Cls:Class;

		[Embed(source="./../../images/55.jpg")]
		[Bindable]
		public var character6Cls:Class;

		[Embed(source="./../../images/no.png")]
		[Bindable]
		public var noCls:Class;

		[Embed(source="./../../images/arrow.png")]
		[Bindable]
		public var arrowCls:Class;
		
		[Embed(source="./../../images/dots.jpg")]
		[Bindable]
		public var dotsCls:Class;

		public function Images()
		{
		}
		
		public function getImageClassByNumber(num:int):Class
		{
			var result:Class = null;
			
			switch (num)
			{
				case 0:
				{
					result = person1Cls;
					break;
				}
				case 1:
				{
					result = person2Cls;
					break;
				}
				case 2:
				{
					result = person3Cls;
					break;
				}
				case 3:
				{
					result = person4Cls;
					break;
				}
				case 4:
				{
					result = person5Cls;
					break;
				}
				case 5:
				{
					result = person6Cls;
					break;
				}
				case 10:
				{
					result = house1Cls;
					break;
				}
				case 11:
				{
					result = house2Cls;
					break;
				}
				case 12:
				{
					result = house3Cls;
					break;
				}
				case 13:
				{
					result = house4Cls;
					break;
				}
				case 14:
				{
					result = house5Cls;
					break;
				}
				case 15:
				{
					result = house6Cls;
					break;
				}
				case 20:
				{
					result = number1Cls;
					break;
				}
				case 21:
				{
					result = number2Cls;
					break;
				}
				case 22:
				{
					result = number3Cls;
					break;
				}
				case 23:
				{
					result = number4Cls;
					break;
				}
				case 24:
				{
					result = number5Cls;
					break;
				}
				case 25:
				{
					result = number6Cls;
					break;
				}
				case 30:
				{
					result = fruit1Cls;
					break;
				}
				case 31:
				{
					result = fruit2Cls;
					break;
				}
				case 32:
				{
					result = fruit3Cls;
					break;
				}
				case 33:
				{
					result = fruit4Cls;
					break;
				}
				case 34:
				{
					result = fruit5Cls;
					break;
				}
				case 35:
				{
					result = fruit6Cls;
					break;
				}
				case 40:
				{
					result = transport1Cls;
					break;
				}
				case 41:
				{
					result = transport2Cls;
					break;
				}
				case 42:
				{
					result = transport3Cls;
					break;
				}
				case 43:
				{
					result = transport4Cls;
					break;
				}
				case 44:
				{
					result = transport5Cls;
					break;
				}
				case 45:
				{
					result = transport6Cls;
					break;
				}
				case 50:
				{
					result = character1Cls;
					break;
				}
				case 51:
				{
					result = character2Cls;
					break;
				}
				case 52:
				{
					result = character3Cls;
					break;
				}
				case 53:
				{
					result = character4Cls;
					break;
				}
				case 54:
				{
					result = character5Cls;
					break;
				}
				case 55:
				{
					result = character6Cls;
					break;
				}
			}
			
			return result;
		}
	}
}
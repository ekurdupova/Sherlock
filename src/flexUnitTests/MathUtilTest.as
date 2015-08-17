package flexUnitTests
{
	import flexunit.framework.Assert;
	
	import game.MathUtil;
	
	import org.flexunit.asserts.assertEquals;
	
	public class MathUtilTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testRandom():void
		{
			MathUtil.seedRandom(0);
			
			assertEquals(0.21132115912208504, MathUtil.random(1));
			assertEquals(0.7094221536351166, MathUtil.random(1));
			assertEquals(0.5467721193415638, MathUtil.random(1));

			MathUtil.seedRandom(0);
			
			assertEquals(0.21132115912208504, MathUtil.random(1));
			assertEquals(0.7094221536351166, MathUtil.random(1));
			assertEquals(0.5467721193415638, MathUtil.random(1));
}
	}
}
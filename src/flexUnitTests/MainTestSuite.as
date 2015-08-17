package flexUnitTests
{
	import flexUnitTests.CalculatorTestCase;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MainTestSuite
	{
		public var test1:flexUnitTests.CalculatorTestCase;
		public var test2:flexUnitTests.MathUtilTest;
		
	}
}
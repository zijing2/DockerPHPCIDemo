<?php 
use PHPUnit\Framework\TestCase;

final class PHPUnitDemoTest extends TestCase{
	
	public function setUp(){ }
	public function tearDown(){ }
	
	public function testDemoReturnTrue()
	{
		$this->assertTrue(helloWorld());
	}
}



?>
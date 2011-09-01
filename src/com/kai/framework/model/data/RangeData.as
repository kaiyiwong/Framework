package com.kai.framework.model.data
{
	public class RangeData extends SimpleReference
	{
		public var min:int;
		public var max:int;
		
		public function RangeData()
		{
			super();
		}
		
		public function get length():int
		{
			return max - min;
		}
	}
}
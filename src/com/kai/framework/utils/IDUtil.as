package com.kai.framework.utils
{
	public class IDUtil
	{
		private static var _id:int = 0;
		
		public static function getId():int
		{
			return _id++;
		}
	}
}
package com.kai.framework.model.data
{
	public class ReleaseDateData extends ContentData
	{
		public static const NAME:String = "ReleaseDateData";
		
		private var _min:Date;
		private var _max:Date;
		
		public function ReleaseDateData()
		{
			super();
		}

		/**
		 * Getter/setter for the min property
		 * 
		 * @param value:Date
		 * @return Date
		 */
		public function get min():Date
		{
			return _min;
		}

		public function set min(value:Date):void
		{
			_min = value;
		}
		
		/**
		 * Getter/setter for the max property
		 * 
		 * @param value:Date
		 * @return Date
		 */
		public function get max():Date
		{
			return _max;
		}

		public function set max(value:Date):void
		{
			_max = value;
		}


	}
}
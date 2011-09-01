package com.kai.framework.model.data
{
	public class AssetData extends SimpleReference
	{
		private var _path:String;
		private var _type:int;
		
		/**
		 * Getter/setter methods for the path property
		 * 
		 * @param value:String
		 * @return String
		 */
		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}
		
		/**
		 * Getter/setter methods for the type property
		 * 
		 * @param value:int
		 * @return int
		 */
		public function get type():int
		{
			return _type;
		}

		public function set type(value:int):void
		{
			_type = value;
		}


	}
}
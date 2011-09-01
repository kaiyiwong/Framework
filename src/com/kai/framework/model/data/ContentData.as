package com.kai.framework.model.data
{
	public class ContentData extends SimpleReference
	{
		private var _content:String;
		private var _type:String;
		
		/**
		 * Getter/setter methods for the content property
		 * 
		 * @param value:String
		 * @return String
		 */
		public function get content():String
		{
			return _content;
		}

		public function set content(value:String):void
		{
			_content = value;
		}
		
		/**
		 * Getter/setter methods for the type property
		 * 
		 * @param value:String
		 * @return String
		 */
		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}


	}
}
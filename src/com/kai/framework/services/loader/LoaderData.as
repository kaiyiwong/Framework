package com.kai.framework.services.loader
{
	import com.greensock.loading.LoaderMax;
	import com.kai.framework.rpc.IResponder;

	public class LoaderData
	{
		private var _loader:LoaderMax;
		private var _callback:IResponder;
		private var _getProgress:Boolean;
		private var _length:int;
		
		public function LoaderData()
		{
			_length = 0;
		}

		public function get length():int
		{
			return _length;
		}

		public function set length(value:int):void
		{
			_length = value;
		}

		public function get getProgress():Boolean
		{
			return _getProgress;
		}

		public function set getProgress(value:Boolean):void
		{
			_getProgress = value;
		}

		public function get callback():IResponder
		{
			return _callback;
		}

		public function set callback(value:IResponder):void
		{
			_callback = value;
		}

		public function get loader():LoaderMax
		{
			return _loader;
		}

		public function set loader(value:LoaderMax):void
		{
			_loader = value;
		}

	}
}
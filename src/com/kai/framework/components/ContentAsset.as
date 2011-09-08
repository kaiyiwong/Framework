package com.kai.framework.components
{
	import com.greensock.loading.display.ContentDisplay;
	import com.kai.framework.rpc.IReceiver;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class ContentAsset extends Sprite implements IReceiver
	{
		public var loaded:Signal;
		
		private var _content:ContentDisplay;
		
		public function ContentAsset()
		{
			super();
			
			loaded = new Signal();
		}
		
		public function receive(content:ContentDisplay):void
		{
			_content = content;
			addChild(_content);
			
			loaded.dispatch();
		}
	}
}
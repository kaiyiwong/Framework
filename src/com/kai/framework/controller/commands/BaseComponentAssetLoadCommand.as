package com.kai.framework.controller.commands
{
	import com.greensock.events.LoaderEvent;
	import com.kai.framework.model.data.AssetData;
	import com.kai.framework.rpc.IReceiver;
	import com.kai.framework.rpc.IResponder;
	import com.kai.framework.services.loader.LoaderService;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class BaseComponentAssetLoadCommand extends SignalCommand implements IResponder
	{		
		[Inject] public var asset:AssetData;
		[Inject] public var queue:String;
		[Inject] public var receiver:IReceiver;
		[Inject] public var loader:LoaderService;
		
		public function BaseComponentAssetLoadCommand()
		{
			super();
		}
		
		override public function execute():void {
			if (loader.getItem(queue, asset.path)) {
				assetLoaded();
			}
			else {
				loader.load(queue, asset.path, asset.type, {name:asset.path, smoothing:true, repeat:-1, onComplete:assetLoaded});
				loader.start(queue, this);
			}
		}
		
		public function result(data:Object):void {
		}
		
		public function fault(info:Object):void {
		}
		
		private function assetLoaded(event:LoaderEvent = null):void {
			receiver.receive(loader.getItem(queue, asset.path));
		}
	}
}
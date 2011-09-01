package com.kai.framework.signals
{	
	import com.kai.framework.model.data.AssetData;
	import com.kai.framework.rpc.IReceiver;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class ComponentAssetLoad extends Signal
	{
		public function ComponentAssetLoad(...parameters)
		{
			super(IReceiver, String, AssetData);
		}
	}
}
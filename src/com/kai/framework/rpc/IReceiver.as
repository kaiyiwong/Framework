package com.kai.framework.rpc
{
	import com.greensock.loading.display.ContentDisplay;
	
	public interface IReceiver
	{
		function receive( content:ContentDisplay ):void;
	}
}
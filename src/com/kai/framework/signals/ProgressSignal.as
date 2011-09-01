package com.kai.framework.signals
{
	import org.osflash.signals.Signal;
	
	public class ProgressSignal extends Signal
	{
		public function ProgressSignal(...parameters)
		{
			super(Number);
		}
	}
}
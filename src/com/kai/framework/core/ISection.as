package com.kai.framework.core
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;

	public interface ISection extends IEventDispatcher
	{
		function initialize():void;
		function transitionIn():void;
		function transitionOut():void;
	}
}
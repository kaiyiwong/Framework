package com.kai.framework.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BaseComponent extends Sprite
	{
		public function BaseComponent()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		public function initialize():void
		{
			
		}
		
		private function onAddedToStage( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			initialize();
		}
	}
}
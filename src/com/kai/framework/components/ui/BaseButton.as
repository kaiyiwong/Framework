package com.kai.framework.components.ui
{
	import com.kai.framework.core.BaseComponent;
	
	import flash.events.MouseEvent;
	
	public class BaseButton extends BaseComponent
	{
		protected var _enabled:Boolean;
		
		public function BaseButton()
		{
			super();
		}
		
		override public function initialize():void {
			this.mouseChildren = false;
		}
		
		public function get enabled():Boolean
		{
			return this._enabled;
		}
		
		public function set enabled( value:Boolean ):void
		{
			this._enabled = value;
			this.buttonMode = value;
			this.mouseEnabled = value;
			
			if ( this.enabled )
			{
				addMouseListeners();
			}
			else
			{
				removeMouseListeners();
			}
		}
		
		protected function onOver(event:MouseEvent):void {
			
		}
		
		protected function onOut(event:MouseEvent):void {
			
		}
		
		protected function onClick(event:MouseEvent):void {
			
		}
		
		protected function addMouseListeners():void
		{
			if ( !this.hasEventListener( MouseEvent.CLICK ) )
			{
				this.addEventListener( MouseEvent.CLICK, onClick, false, 0, true );
			}
			
			if ( !this.hasEventListener( MouseEvent.ROLL_OVER ) )
			{
				this.addEventListener( MouseEvent.ROLL_OVER, onOver, false, 0, true );
			}
			
			if ( !this.hasEventListener( MouseEvent.ROLL_OUT ) )
			{
				this.addEventListener( MouseEvent.ROLL_OUT, onOut, false, 0, true );
			}
		}
		
		protected function removeMouseListeners():void
		{
			this.removeEventListener(MouseEvent.CLICK, onClick);
			this.removeEventListener(MouseEvent.ROLL_OVER, onOver);
			this.removeEventListener(MouseEvent.ROLL_OUT, onOut);
		}
	}
}
package com.kai.framework.components.ui
{	
	import com.kai.framework.utils.TextUtility;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import org.osflash.signals.Signal;
	
	public class TextButton extends BaseButton
	{
		protected var _label:TextField;
		protected var _style:String;

		public function TextButton()
		{
			super();
			
			clicked = new Signal(TextButton);
		}

		public function get style():String
		{
			return _style;
		}

		public function set style(value:String):void
		{
			_style = value;
		}

		public function set text(value:String):void 
		{
			if (_style) 
			{
				_label = new TextField();
				addChild(_label);
				
				TextUtility.applyCSS(_label, value, _style);
				TextUtility.setFormat(_label);
			}
			else
			{
				throw new Error("TextButton.style has not been set");
			}
		}
	}
}
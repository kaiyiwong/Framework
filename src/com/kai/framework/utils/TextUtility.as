package com.kai.framework.utils
{
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class TextUtility
	{
		public static var stylesheet:StyleSheet;
		
		public static function applyCSS(label:TextField, content:String, style:String):void 
		{
			if (stylesheet) 
			{
				label.styleSheet = stylesheet;
				var text:String = "<span class ='" + style + "'>" + content + "</span>";
				label.htmlText = text;
			}
			else 
			{
				throw new Error("TextUtility.stylesheet has not been set");
			}
		}
		
		public static function setFormat(label:TextField, autoSize:String = TextFieldAutoSize.LEFT, embed:Boolean = true, antiAlias:String = AntiAliasType.NORMAL):void 
		{
			label.autoSize = autoSize;
			label.embedFonts = embed;
			label.antiAliasType = antiAlias;
		}
	}
}
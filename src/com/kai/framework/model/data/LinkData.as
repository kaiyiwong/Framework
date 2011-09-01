package com.kai.framework.model.data
{
	/**
	 * 
	 * PROTIP: make sure the linkdata is instantiated in your VO or it will never get set.
	 * 
	 * 
	 * 
		Links use the following format:	
			
		<element type="link" property="linkData">
			<path active="true" type="blank" uri="http://google.com/" />
			<text><![CDATA[<font size="9" color="#f3f7e9">Go to Google</font>]]></text>
		</element>
			
		
		_path_ 
			active: 
				values - "true" or "false"
				description - Sets whether or not the link will link out on click
			type:
				"blank" 		- open link in new window/tab
				"self" 			- open link in current window/tab
				"javascript"	- open link in js pop up
			
			uri:
				normal url 		- "http://greenlanternmovie.warnerbros.com/"
				js url 			- "javascript:window.open('http://greenlanternmovie.warnerbros.com/','myWindow','width=540, height=360');"
							
	 * 
	 * 
	 **/
	public class LinkData extends AssetData
	{
		private var _text:String;
		private var _isActive:Boolean;
		
		/**
		 * Getter/setter for the text property
		 * 
		 * @param value:String
		 * @return String
		 */
		public function get text():String
		{
			return _text;
		}

		public function set text( value:String ):void
		{
			_text = value;
		}
		
		/**
		 * Getter/setter for the isActive property
		 * 
		 * @param value:Boolean
		 * @return Boolean
		 */
		public function get isActive():Boolean
		{
			return _isActive;
		}

		public function set isActive( value:Boolean ):void
		{
			_isActive = value;
		}


	}
}
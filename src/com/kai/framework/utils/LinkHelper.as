package com.kai.framework.utils
{	
	import com.kai.framework.model.data.LinkData;
	import com.kai.framework.model.data.LinkTypes;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class LinkHelper
	{
		public function LinkHelper()
		{
		}
		
		public static function link( data:LinkData ):void
		{
			var window:String;
			var link:String;
			switch ( data.type )
			{
				case LinkTypes.JAVASCRIPT:
					// example: path = javascript:window.open('http://greenlanternmovie.warnerbros.com/','myWindow','width=540, height=360');
					link = data.path + ' void(0);';
					window = "_self";
				case LinkTypes.SELF:
					window = '_self';
					break;
				case LinkTypes.PARENT:
					window = '_parent';
					break;
				case LinkTypes.TOP:
					window = '_top';
					break;
				case LinkTypes.BLANK:
				default:
					window = '_blank';
					break;
			}
			
			if ( !link )
			{
				link = data.path;
			}
			
			navigateToURL( new URLRequest( link ), window );
		}
	}
}
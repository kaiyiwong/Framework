package com.kai.framework.utils
{
	import com.kai.framework.model.data.AssetData;
	import com.kai.framework.model.data.ContentData;
	import com.kai.framework.model.data.ImageLinkData;
	import com.kai.framework.model.data.LinkData;
	import com.kai.framework.model.data.LinkTypes;
	import com.kai.framework.model.data.MediaTypes;
	import com.kai.framework.model.data.SimpleReference;
	
	import flash.utils.getDefinitionByName;

	public class SectionXMLParser
	{
		public function SectionXMLParser()
		{
			
		}
		
		public static function checkElements( ref:SimpleReference, elements:XMLList ):void
		{
			// This could also be placed in some sort of Builder...
			for ( var i:int = 0; i < elements.length(); i++ )
			{
				var element:XML = elements[ i ];
				var prop:String = element.@property;
				var type:String = element.@type;
				
				if ( ref.hasOwnProperty( prop ) )
				{
					// first check the type
					switch ( type )
					{
						// content type, which is equivalent to a ContentData
						case 'content':
							var contentData:ContentData = ref[ prop ] as ContentData;
							if ( contentData )
							{
								configureContentData( contentData, element );
							}
							break;
						case 'text':
							ref[ prop ] = element;
							break;
						case 'number':
							ref[ prop ] = element.@value;
							break;
						case 'audio':
						case 'image':
						case 'swf':
						case 'video':
							var assetData:AssetData = ref[ prop ] as AssetData;
							if ( assetData )
							{
								configureAssetData( assetData, element );
							}
							break;
						case 'link':
							var linkData:LinkData = ref[ prop ] as LinkData;
							if ( linkData )
							{
								configureLinkData( linkData, element );
							}
							break;
						case 'array':
							if ( ref[ prop ] is Array )
							{
								checkItems( ref[ prop ] as Array, element.item );
							}
							break;
						case 'imagelink':
							var imageLink:ImageLinkData = ref[ prop ] as ImageLinkData;
							if ( imageLink )
							{
								configureImageLinkData( imageLink, element.children() );
							}
							break;
						case 'color':
							if ( ref[ prop ] is uint )
							{
								ref[ prop ] = uint( element.@value );
							}
							break;
						case 'boolean':
							if ( ref[ prop ] is Boolean )
							{
								ref[ prop ] = element.@value == "true";
							}
							break;
						case 'date':
							var date:Date = ref[ prop ] as Date;
							if ( date )
							{
								configureDate( date, element );
							}
							break;
					}
				}
			}
		}
		
		public static function checkItems( array:Array, items:XMLList ):void
		{
			for ( var i:int = 0; i < items.length(); i++ )
			{
				var item:XML = items[ i ];
				var type:String = item.@classType;
				if ( type )
				{
					var Ref:Class = getDefinitionByName( type ) as Class;
					var ref:SimpleReference = new Ref() as SimpleReference;
					checkElements( ref, item.element );
					array.push( ref );
				}
			}
		}
		
		public static function configureContentData( data:ContentData, element:XML ):void
		{
			data.content = element.content;
		}
		
		public static function configureAssetData( data:AssetData, element:XML ):void
		{
			data.path = element.path.@uri;
			var type:String = element.@type;
			switch ( type )
			{
				case 'image':
					data.type = MediaTypes.IMAGE_TYPE;
					break;
				case 'video':
					data.type = MediaTypes.VIDEO_TYPE;
					break;
				case 'swf':
					data.type = MediaTypes.SWF_TYPE;
					break;
				case 'sound':
					data.type = MediaTypes.AUDIO_TYPE;
					break;
			}
		}
		
		public static function configureLinkData( data:LinkData, element:XML ):void
		{
			data.path = element.path.@uri;
			data.text = element.text;
			data.isActive = element.path.@active;
			
			var type:String = element.path.@type;
			switch ( type )
			{
				case 'self':
					data.type = LinkTypes.SELF;
					break;
				case 'top':
					data.type = LinkTypes.TOP;
					break;
				case 'parent':
					data.type = LinkTypes.PARENT;
					break;
				case 'javascript':
					data.type = LinkTypes.JAVASCRIPT;
					break;
				case 'blank':
				default:
					data.type = LinkTypes.BLANK;
					break;
			}
		}
		
		public static function configureImageLinkData( data:ImageLinkData, elements:XMLList ):void
		{
			//trace( 'SectionXMLParser configureImageLinkData:', element.toString() );
			configureLinkData( data.linkData, elements.( @type == "link" )[ 0 ] );
			configureAssetData( data.assetData, elements.( @type == "image" )[ 0 ] );
		}
		
		public static function configureDate( date:Date, element:XML ):void
		{
			var pattern:String = element.@pattern;
			var str:String = element.@date;
			date = DateUtility.getDateFromString( str, pattern );
		}
	}
}
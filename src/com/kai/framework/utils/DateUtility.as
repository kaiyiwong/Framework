package com.kai.framework.utils
{
	import com.kai.framework.model.data.RangeData;

	public class DateUtility
	{
		public static function getDateFromString( str:String, pattern:String ):Date
		{
			var date:Date = new Date( getYearFromString( str, pattern ), getMonthFromString( str, pattern ), getDayFromString( str, pattern ) );
			return date;
		}
		
		public static function getMonthFromString( str:String, pattern:String ):int
		{
			// TODO: Expand this to support different month formats
			var reg:RegExp = /m{1,2}(?!m)/g;
			var range:RangeData = getRangeFromPattern( pattern, reg );
			var value:String = str.substr( range.min, range.length ); 
			var month:int = parseInt( value ) - 1;
			return month;
		}
		
		public static function getDayFromString( str:String, pattern:String ):int
		{
			// TODO: Expand this to support different day formats
			var reg:RegExp = /d{1,2}(?!d)/g;
			var range:RangeData = getRangeFromPattern( pattern, reg );
			var value:String = str.substr( range.min, range.length );
			var day:int = parseInt( value );
			return day;
		}
		
		public static function getYearFromString( str:String, pattern:String ):int
		{
			// TODO: Expand this to support different year formats
			var reg:RegExp = /y{1,2}(?!y)/g;
			var range:RangeData = getRangeFromPattern( pattern, reg );
			var value:String = '20' + str.substr( range.min, range.length );
			var year:int = parseInt( value );
			return year;
		}
		
		public static function getRangeFromPattern( pattern:String, reg:RegExp ):RangeData
		{
			var value:RangeData = new RangeData();
			var result:Object = reg.exec( pattern );
			if ( result )
			{
				var string:String = result[ 0 ];
				value.min = result.index;
				value.max = value.min + string.length;
			}
			
			return value;
		}
	}
}
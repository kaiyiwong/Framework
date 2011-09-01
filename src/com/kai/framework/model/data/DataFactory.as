package com.kai.framework.model.data
{	
	import flash.utils.Dictionary;
	import flash.utils.describeType;

	public class DataFactory
	{
		private static var CLASS_DICTIONARY:Dictionary;
		
		public function DataFactory()
		{
		}
		
		public static function addToDictionary( type:Class ):void
		{
			if ( !CLASS_DICTIONARY )
			{
				CLASS_DICTIONARY = new Dictionary( true );
			}
			
			var prop:String = describeType( type ).factory.@type;
			CLASS_DICTIONARY[ prop ] = type;
		}
		
		public static function getClassByType( type:String ):SimpleReference
		{			
			var Ref:Class = CLASS_DICTIONARY[ type ];
			return new Ref() as SimpleReference;
		}
	}
}
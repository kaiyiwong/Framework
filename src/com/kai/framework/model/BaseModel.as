package com.kai.framework.model
{
	import com.kai.framework.model.data.SimpleReference;
	
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class BaseModel extends Actor implements IModel
	{
		protected var items:Dictionary;
		protected var _length:int;
		private var _initialized:Boolean;
		
		public function BaseModel()
		{
			super();
			
			items = new Dictionary();
			_length = 0;
			_initialized = false;
		}
		
		public function addItem( item:SimpleReference, key:Object = null ):void
		{
			var id:Object = ( key ) ? key : item.id;
			if ( !items[ id ] )
			{
				items[ id ] = item;
				_length++;
			}
		}
		
		public function getItemById( key:Object ):SimpleReference
		{
			return items[ key ] as SimpleReference;
		}
		
		public function getAllItems():Vector.<SimpleReference>
		{
			var vector:Vector.<SimpleReference> = new Vector.<SimpleReference>();
			for each ( var ref:SimpleReference in items )
			{
				vector.push( ref );
			}
			
			return vector;
		}
		
		public function removeItem( item:SimpleReference ):SimpleReference
		{
			for ( var key:Object in items )
			{
				var ref:SimpleReference = items[ key ];
				if ( item == ref )
				{
					_length--;
					items[ key ] = null;
					delete items[ key ];
					return ref;
				}
			}
			
			return null;
		}
		
		public function removeAllItems():Vector.<SimpleReference>
		{
			for ( var key:Object in items )
			{
				_length--;
				items[ key ] = null;
				delete items[ key ];
			}
			
			return null;
		}
		
		public function removeItemById( id:Object ):SimpleReference
		{
			var item:SimpleReference = items[ id ];
			items[ id ] = null;
			delete items[ id ];
			_length--;
			
			return item;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function get initialized():Boolean
		{
			return _initialized;
		}
		
		public function set initialized( value:Boolean ):void
		{
			_initialized = value;
		}
	}
}
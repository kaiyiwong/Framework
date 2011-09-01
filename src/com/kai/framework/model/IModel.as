package com.kai.framework.model
{
	import com.kai.framework.model.data.SimpleReference;

	public interface IModel
	{
		function addItem( item:SimpleReference, key:Object = null ):void;
		function getItemById( key:Object ):SimpleReference;
		function getAllItems():Vector.<SimpleReference>;
		function removeAllItems():Vector.<SimpleReference>;
		function removeItem( item:SimpleReference ):SimpleReference;
		function removeItemById( key:Object ):SimpleReference;
		function get length():int;
		function get initialized():Boolean;
		function set initialized( value:Boolean ):void;
	}
}
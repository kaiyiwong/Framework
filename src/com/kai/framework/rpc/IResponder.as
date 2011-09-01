package com.kai.framework.rpc
{
	public interface IResponder
	{
		function result( data:Object ):void;
		function fault( info:Object ):void;
	}
}
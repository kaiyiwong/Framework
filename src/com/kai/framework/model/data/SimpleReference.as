﻿package com.kai.framework.model.data{	public class SimpleReference	{		private var _id:int;		private var _uniqueID:String;		private var _name:String;				/**		 * Constructor for SimpleReference		 * 		 * @param id:int		 * @param name:String		 * @return SimpleReference		 */		public function SimpleReference( id:int = -1, name:String = null )		{			this.id = id;			this.name = name;		}				public function get uniqueID():String
		{
			return _uniqueID;
		}		public function set uniqueID(value:String):void
		{
			_uniqueID = value;
		}		/**		 * Getter/setter methods for the id property		 * 		 * @param value:int		 * @return int		 */		public function get id():int		{			return this._id;		}				public function set id( value:int ):void		{			this._id = value;		}		/**		 * Getter/setter methods for the name property		 * 		 * @param value:String		 * @return String		 */		public function get name():String		{			return this._name;		}		public function set name(value:String):void		{			this._name = value;		}	}}
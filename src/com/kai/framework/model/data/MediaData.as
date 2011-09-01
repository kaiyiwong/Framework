package com.kai.framework.model.data
{
	public class MediaData extends SimpleReference
	{
		private var _thumbnail:AssetData;
		private var _asset:AssetData;
		
		/**
		 * Getter/setter methods for the thumbnail property
		 * 
		 * @param value:AssetData
		 * @return AssetData
		 */
		public function get thumbnail():AssetData
		{
			return _thumbnail;
		}

		public function set thumbnail(value:AssetData):void
		{
			_thumbnail = value;
		}

		/**
		 * Getter/setter methods for the asset property
		 * 
		 * @param value:AssetData
		 * @return AssetData
		 */
		public function get asset():AssetData
		{
			return _asset;
		}

		public function set asset(value:AssetData):void
		{
			_asset = value;
		}


	}
}
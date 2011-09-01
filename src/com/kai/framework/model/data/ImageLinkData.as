package com.kai.framework.model.data
{
	public class ImageLinkData extends SimpleReference
	{
		private var _linkData:LinkData;
		private var _assetData:AssetData;
		
		public function ImageLinkData()
		{
			linkData = new LinkData();
			assetData = new AssetData();
		}
		
		/**
		 * Getter/setter methods for the assetData property
		 * 
		 * @param value:AssetData
		 * @return AssetData
		 */
		public function get assetData():AssetData
		{
			return _assetData;
		}

		public function set assetData(value:AssetData):void
		{
			_assetData = value;
		}
		
		/**
		 * Getter/setter methods for the linkData property
		 * 
		 * @param value:LinkData
		 * @return LinkData
		 */
		public function get linkData():LinkData
		{
			return _linkData;
		}

		public function set linkData(value:LinkData):void
		{
			_linkData = value;
		}

	}
}
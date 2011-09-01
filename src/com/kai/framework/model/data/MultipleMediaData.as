package com.kai.framework.model.data
{
	public class MultipleMediaData extends MediaData
	{
		private var _medias:Vector.<AssetData>;
		
		/**
		 * Getter/setter methods for the medias property
		 * 
		 * @param value:Vector.<BaseAssetData>
		 * @return Vector.<BaseAssetData>
		 */
		public function get medias():Vector.<AssetData>
		{
			return _medias;
		}

		public function set medias(value:Vector.<AssetData>):void
		{
			_medias = value;
		}
	}
}
package com.kai.framework.services.loader
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.display.ContentDisplay;
	import com.kai.framework.model.data.MediaTypes;
	import com.kai.framework.rpc.IResponder;
	
	import flash.text.StyleSheet;
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;
	
	public class LoaderService extends Actor
	{
		public var progress:Signal;
		
		private var _progressQueue:String;
		private var _queues:Dictionary;
		
		public function LoaderService()
		{
			super();
			
			progress = new Signal(Number);
			_queues = new Dictionary();
		}

		public function createQueue(name:String):void 
		{
			var queue:LoaderData = new LoaderData();
			queue.loader = new LoaderMax({name:name, onProgress:onProgress, onComplete:onLoadComplete, onError:onError});
			
			_queues[name] = queue;
		}
		
		public function start(name:String, callback:IResponder, getProgress:Boolean = false):void 
		{
			if (!_queues[name])
			{
				createQueue(name);
			}
			
			var queue:LoaderData = _queues[name];
			queue.callback = callback;
			queue.getProgress = getProgress;
			
			queue.loader.load();
		}
		
		public function load(name:String, path:String, type:int = MediaTypes.IMAGE_TYPE, params:Object = null):void 
		{
			if (!_queues[name])
				createQueue(name);
			
			var queue:LoaderData = _queues[name];
			queue.length++;
			
			switch (type) {
				case MediaTypes.IMAGE_TYPE:
					queue.loader.append(new ImageLoader(path, params));
					break;
				case MediaTypes.SWF_TYPE:
					queue.loader.append(new SWFLoader(path, params));
					break;
				case MediaTypes.FILE_TYPE:
					queue.loader.append(new XMLLoader(path, params));
					break;
				case MediaTypes.AUDIO_TYPE:
					queue.loader.append(new MP3Loader(path, params));
					break;
				case MediaTypes.VIDEO_TYPE:
					queue.loader.append(new VideoLoader(path, params));
					break;
				case MediaTypes.CSS_TYPE:
					queue.loader.append(new CSSLoader(path, params));
					break;
			}
		}
		
		public function getCSS(name:String, value:String):StyleSheet 
		{
			var queue:LoaderData = _queues[name];
			return queue.loader.getContent(value);
		}
		
		public function getItem(name:String, value:String):ContentDisplay 
		{
			if (!_queues[name])
			{
				createQueue(name);
			}
			
			var queue:LoaderData = _queues[name];
			return queue.loader.getContent(value);
		}
		
		public function getXML(name:String, value:String):XMLLoader 
		{
			var queue:LoaderData = _queues[name];
			return queue.loader.getLoader(value);
		}
		
		public function getRawItem(name:String, value:String):* 
		{
			if (!_queues[name])
			{
				createQueue(name);
			}
			
			var queue:LoaderData = _queues[name];
			return queue.loader.getContent(value).rawContent;
		}
			
		private function onProgress(event:LoaderEvent):void 
		{
			if (event.target.name == _progressQueue) 
			{
				progress.dispatch(event.target.progress);
			}
		}
		
		private function onLoadComplete(event:LoaderEvent):void {
			for each (var queue:LoaderData in _queues) 
			{
				if (event.currentTarget == queue.loader)
					queue.callback.result('LoadComplete');
			}
		}
		
		private function onError(event:LoaderEvent):void 
		{
			trace("error occured with " + event.target + ": " + event.text);
		}
		
		public function getAllQueue(name:String):Vector.<LoaderData> 
		{
			var vector:Vector.<LoaderData> = new Vector.<LoaderData>();
			for each (var queue:LoaderData in _queues[name]) {
				vector.push(queue);
			}
			
			return vector;
		}
		
		public function getLength(name:String):int 
		{
			return _queues[name].length;
		}
		
		public function get progressQueue():String
		{
			return _progressQueue;
		}
		
		public function set progressQueue(value:String):void
		{
			_progressQueue = value;
		}
	}
}
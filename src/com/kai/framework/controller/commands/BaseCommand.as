package com.kai.framework.controller.commands
{	
	import com.kai.framework.model.IModel;
	
	import flash.events.Event;
	
	import org.osflash.signals.ISignal;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class BaseCommand extends SignalCommand
	{
		private var _signal:ISignal;
		private var _event:Event;
		private var _model:IModel;
		
		/**
		 * Constructor
		 * 
		 * @param none
		 * @return BaseCommand
		 */
		public function BaseCommand()
		{
			super();
		}
		
		/**
		 * Getter/setter for the signal property
		 * 
		 * @param value:ISignal
		 * @return ISignal
		 */
		public function get signal():ISignal
		{
			return this._signal;
		}
		
		public function set signal( value:ISignal ):void
		{
			this._signal = value;
		}
		
		/**
		 * Getter/setter for the event property
		 * 
		 * @param value:Event
		 * @return Event
		 */
		public function get event():Event
		{
			return _event;
		}

		public function set event( value:Event ):void
		{
			_event = value;
		}
		
		/**
		 * Getter/setter for the model property
		 * 
		 * @param value:IModel
		 * @return IModel
		 */
		[Inject]
		public function get model():IModel
		{
			return this._model;
		}
		
		public function set model( value:IModel ):void
		{
			this._model = value;
		}
		
		/**
		 * @private
		 * Method to pull in whatever injections needed (mostly events and/or signals)
		 * 
		 * @param none
		 * @return void
		 */
		protected function getInjections():void
		{
			
		}

	}
}
package com.kai.framework.view.mediators
{	
	import com.kai.framework.core.ISection;
	import com.kai.framework.model.IModel;
	
	import org.robotlegs.mvcs.SignalMediator;
	
	public class BaseSectionMediator extends SignalMediator
	{
		private var _view:ISection;
		private var _model:IModel;
		
		public function BaseSectionMediator()
		{
			super();
		}
		
		[Inject]
		/**
		 * Getter/setter for the view property
		 * 
		 * @param value:ISection
		 * @return ISection
		 */
		public function get view():ISection
		{
			return _view;
		}
		
		public function set view(value:ISection):void
		{
			_view = value;
		}
		
		[Inject]
		/**
		 * Getter/setter for the model property
		 * 
		 * @param value:IModel
		 * @return IModel
		 */
		public function get model():IModel
		{
			return this._model;
		}
		
		public function set model( value:IModel ):void
		{
			this._model = value;
		}
	}
}
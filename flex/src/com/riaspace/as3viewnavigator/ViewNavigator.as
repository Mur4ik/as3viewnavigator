//////////////////////////////////////////////////////////////////////////////////////
//
//	Copyright 2011 Piotr Walczyszyn (http://riaspace.com | @pwalczyszyn)
//	
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//	
//		http://www.apache.org/licenses/LICENSE-2.0
//	
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//	
//////////////////////////////////////////////////////////////////////////////////////

package com.riaspace.as3viewnavigator
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	import mx.events.ResizeEvent;
	
	/**
	 * Dispatched when changing the current view.
	 */
	[Event(name="viewChanging", type="com.riaspace.as3viewnavigator.events.ViewNavigatorEvent")]

	/**
	 * This is a wrapper class for ViewNavigatorBase. It is a monkey patch version of
	 * ViewNavigator from as3viewnavigator library and it can be used with Flex projects.
	 * 
	 * @author Piotr Walczyszyn
	 */
	public class ViewNavigator extends UIComponent implements IViewNavigator
	{
		protected var _base:ViewNavigatorBase;
		
		/**
		 * Default constructor.
		 */
		public function ViewNavigator()
		{
			super();
			
			// Adding resize handler to react to UIComponent size changes
			addEventListener(ResizeEvent.RESIZE, this_resizeHandler);
			
			// _base:ViewNavigatorBase is actually where all the logic happens
			_base = new ViewNavigatorBase(this);
		}	
		
		protected function this_resizeHandler(event:ResizeEvent):void
		{
			// Setting new scrollRect dimensions to clip the content
			scrollRect = new Rectangle(0, 0, width, height);
			// Resizing currently active view
			_base.resizeCurrentView();
		}
		
		//--------------------------------------------------------------------------
		//
		// IViewNavigator functions implementation
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function popAll(transition:IViewTransition = null):DisplayObject
		{
			return _base.popAll(transition);
		}
		
		/**
		 * @inheritDoc
		 */
		public function popToFirstView(transition:IViewTransition = null):DisplayObject
		{
			return _base.popToFirstView(transition);
		}
		
		/**
		 * @inheritDoc
		 */
		public function popView(transition:IViewTransition = null):DisplayObject
		{
			return _base.public::popView(transition);
		}
		
		/**
		 * @inheritDoc
		 */
		public function pushView(view:Object, viewProps:Object=null, context:Object=null, transition:IViewTransition = null):DisplayObject
		{
			return _base.public::pushView(view, viewProps, context, transition);
		}
		
		/**
		 * @inheritDoc
		 */
		public function replaceView(view:Object, viewProps:Object=null, context:Object=null, transition:IViewTransition = null):DisplayObject
		{
			return _base.replaceView(view, viewProps, context, transition);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get firstView():Object
		{
			return _base.firstView;
		}
		/**
		 * @inheritDoc
		 */
		public function set firstView(value:Object):void
		{
			_base.firstView = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get firstViewProps():Object
		{
			return _base.firstViewProps;
		}
		/**
		 * @inheritDoc
		 */
		public function set firstViewProps(value:Object):void
		{
			_base.firstViewProps = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get firstViewContext():Object
		{
			return _base.firstViewContext;
		}
		/**
		 * @inheritDoc
		 */
		public function set firstViewContext(value:Object):void
		{
			_base.firstViewContext = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get firstViewTransition():IViewTransition
		{
			return _base.firstViewTransition;
		}
		/**
		 * @inheritDoc
		 */
		public function set firstViewTransition(value:IViewTransition):void
		{
			_base.firstViewTransition = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get transitionDuration():Number
		{
			return _base.transitionDuration;
		}
		/**
		 * @inheritDoc
		 */
		public function set transitionDuration(value:Number):void
		{
			_base.transitionDuration = value;
		}	
		
		/**
		 * @inheritDoc
		 */
		public function get defaultTransition():IViewTransition
		{
			return _base.defaultTransition;
		}
		
		/**
		 * @inheritDoc
		 */ 
		public function set defaultTransition(value:IViewTransition):void
		{
			_base.defaultTransition = value;
		}

		/**
		 * @inheritDoc
		 */
		public function get length():Number
		{
			return _base.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get currentView():DisplayObject
		{
			return _base.currentView;
		}
	}
}
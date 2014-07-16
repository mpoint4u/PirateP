package  ;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.media.Sound;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;

/**
 * ...
 * @author pm
 */
class UIstart extends Sprite {    //  ru.stablex.ui.widgets.Widget { // 

	// public member vars
	public var currentScale:Float;
	
	//private member vars
	private var IntroSound:Sound;	
	
	
	// TODO remove later, as this is only used for Tile - layout
	private static var NUM_COLUMNS = 8;
	private static var NUM_ROWS = 8;	
	
	
	// constructor
	public function new() 
	{
		super();
		initialize ();
		constructUI ();
		newScene ();		
	}
	
	private function initialize():Void {
			trace("called initialize() in UIstart.hx ...");
			
        //register Main so we can use it in xml.
        //UIBuilder.regClass("Main");	        
		
		//register this class so we can use it in xml.
        UIBuilder.regClass("UIstart");			
			
		//  UIBuilder.regClass('ColorWidget');	  // used in 'ui/5th.xml'	
		//	trace("regClass('ColorWidget') from initialize() in UIstart.hx");
	}
	
	private function constructUI ():Void {
			//trace("called constructUI() in UIstart.hx ...");
			
		//addChild(
		
		//			feed some xml - layout into here
		// like so	
		//UIBuilder.buildFn(
	
/*				UIBuilder.buildFn(
				
							'index.xml'
				
										)() 
						);*/
						
/*		UIBuilder.buildFn(

		'ui/index.xml'		
		
							)() );	*/					
		
		//trace("added new widget as child to stage...");			
			
			
		IntroSound = Assets.getSound ("soundTheme");		
		}
		
	public function newScene ():Void {
			trace("called newScene() in UIstart.hx ...");
			
		IntroSound.play ();
		
		//removeEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		//addEventListener (Event.ENTER_FRAME, this_onEnterFrame);	
	}
			
	
	// resizing the startup-UI...
	public function resize (newWidth:Float, newHeight:Float):Void {

		// TODO:  	implement your own algorithm to
		// 			calculate the optimal width & height of your app
		// 			(what's down there now is just an example...)
		
			trace("called resize() in UIstart.hx ...");			
		
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		scaleX = 1;
		scaleY = 1;
		
		#if (js || !openfl_html5)
		
		var currentWidth = 75 * NUM_COLUMNS;
		var currentHeight = 75 * NUM_ROWS + 85;
		
		#else
		
		var currentWidth = width;
		var currentHeight = height;
		
		#end
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				
				currentScale = maxScaleX;
				
			} else {
				
				currentScale = maxScaleY;
				
			}
			
			scaleX = currentScale;
			scaleY = currentScale;
			
		}
		
		x = newWidth / 2 - (currentWidth * currentScale) / 2;		
	}	
	
} // end of class 'UIstart'
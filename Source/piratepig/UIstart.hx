package piratepig;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.media.Sound;

/**
 * ...
 * @author pm
 */
class UIstart extends Sprite
{
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
		construct ();
		newGame ();		
	}
	
	private function initialize():Void {
		
	}
	
	private function construct ():Void {
		
		IntroSound = Assets.getSound ("soundTheme");		
		}
		
	public function newGame ():Void {
				
		IntroSound.play ();
		
		//removeEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		//addEventListener (Event.ENTER_FRAME, this_onEnterFrame);	
	}
			
	
	// resizing the startup-UI...
	public function resize (newWidth:Int, newHeight:Int):Void {
		
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
	
}
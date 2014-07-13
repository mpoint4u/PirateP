package  ;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.Capabilities;
import flash.Lib;
import myapp.PiratePigGame;
import openfl.Assets;


class Main extends Sprite {
	
	
	private var Background:Bitmap;
	private var Footer:Bitmap;
	//private var Game:PiratePigGame;
	//private var FirstUI:UIstart;
	private var FirstUI:PiratePigGame;
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		
	}
	
	
	private function construct ():Void {
			trace("called construct() in Main.hx ...");		
		Footer.smoothing = true;   // has a really nice effect !!
		
		// add all UI components to the stage...
		addChild (Background);
		addChild (Footer);
		addChild (FirstUI);     //means the same here as ... addChild (startupUI);		
	}
	
	
	private function initialize ():Void {
			trace("called initialize() in Main.hx ...");
		Background = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));
		Footer = new Bitmap (Assets.getBitmapData ("images/center_bottom.png"));
		FirstUI = new PiratePigGame ();
		//FirstUI = new UIstart();
	}
	
	
	private function resize (newWidth:Int, newHeight:Int):Void {
			trace("called resize() in Main.hx ...");			
		Background.width = newWidth;
		Background.height = newHeight;
		
		FirstUI.resize (newWidth, newHeight);
		
		Footer.scaleX = FirstUI.currentScale;
		Footer.scaleY = FirstUI.currentScale;
			trace("FirstUI.currentScale has a value of..." + FirstUI.currentScale);			
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
			trace("called stage_onResize() in Main.hx ...");
		
		resize (stage.stageWidth, stage.stageHeight);
	}
	
} // end of class 'Main'

package  ;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.Capabilities;
import flash.Lib;
import piratepig.PiratePigGame;
import openfl.Assets;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;


class Main extends ru.stablex.ui.widgets.Widget{ //Sprite {
	
	
	private var Background:Bitmap;
	private var Footer:Bitmap;
	//private var Game:PiratePigGame;
	private var FirstUI:UIstart;
	//private var FirstUI:PiratePigGame;
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		resize (
				stage.stageWidth, 
				stage.stageHeight,
					true
					);
		stage.addEventListener (Event.RESIZE, stage_onResize);	
	}
	
	
	private function construct ():Void {
			trace("called construct() in Main.hx ...");		
		Footer.smoothing = true;   // has a really nice effect !!
		
		// add all UI components to the stage LIKE THIS !!!!!...
		//       flash.Lib.current.stage.addChild(...);
		flash.Lib.current.stage.addChild (Background);
		flash.Lib.current.stage.addChild (Footer);
		
		
		///******** THIS IS THE DUMMY WAY TO DO THIS ***************///
		//flash.Lib.current.stage.addChild (FirstUI);     //means the same here as ... addChild (startupUI);
		
		//UIBuilder.regClass('ColorWidget');	  // used in 'ui/5th.xml'	
		//trace("regClass('ColorWidget') in Main.hx");
		
		flash.Lib.current.stage.addChild (
		
				UIBuilder.buildFn(
									'ui/dummy.xml'		
									// for some unknown reason here 'index.xml' cannot be used ???!?	
							)()		
		);	
		
		///******** THIS IS THE DUMMY WAY TO DO THIS ***************///
	}
	
	
	private function initialize ():Void {
			trace("called initialize() in Main.hx ...");

		// general init of StablexUI	
		UIBuilder.init();
		trace("initializing Stablex UI Builder ...");				
			
			
			
			
		Background = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));
		Footer = new Bitmap (Assets.getBitmapData ("images/center_bottom.png"));
		//FirstUI = new PiratePigGame ();
		FirstUI = new UIstart();
	}
	
	
	override public function resize (newWidth:Float, newHeight:Float, keepPercentage:Bool = false ):Void {
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
		
		resize (stage.stageWidth, stage.stageHeight, true);
	}
	
} // end of class 'Main'

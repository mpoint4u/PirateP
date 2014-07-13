package myapp ;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.Capabilities;
import flash.Lib;
import openfl.Assets;


class Main extends Sprite {
	
	
	private var Background:Bitmap;
	private var Footer:Bitmap;
	//private var Game:PiratePigGame;
	private var FirstUI:UIstart;
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		
	}
	
	
	private function construct ():Void {
		
		Footer.smoothing = true;   // has a really nice effect !!
		
		// add all UI components to the stage...
		addChild (Background);
		addChild (Footer);
		addChild (FirstUI);     //means the same here as ... addChild (startupUI);		
	}
	
	
	private function initialize ():Void {
		
		Background = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));
		Footer = new Bitmap (Assets.getBitmapData ("images/center_bottom.png"));
		//Game = new PiratePigGame ();
		FirstUI = new UIstart();
	}
	
	
	private function resize (newWidth:Int, newHeight:Int):Void {
		
		Background.width = newWidth;
		Background.height = newHeight;
		
		FirstUI.resize (newWidth, newHeight);
		
		Footer.scaleX = FirstUI.currentScale;
		Footer.scaleY = FirstUI.currentScale;
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		resize (stage.stageWidth, stage.stageHeight);
		
	}
	
	
}

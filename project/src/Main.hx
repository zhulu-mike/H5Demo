package;


import game.modules.scene.view.MainScene;
import game.modules.mainui.view.MainUI;
import game.managers.LayoutManager;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import openfl.display.Sprite;


class Main extends com.thinkido.example.Application
{	
	
	public function new () {
		
		super ();
		

		
	}
	
	override public function initApp():Void
    {
        super.initApp();
//        var app:BitmapFontTest = new BitmapFontTest();
//        this.addChild(app);

        Toolkit.init();
        Toolkit.openFullscreen(function(root:Root) {
            LayoutManager.init(root);

            var mainui:MainUI = new MainUI();
            var sceneui:MainScene = new MainScene();
        });
    }
}
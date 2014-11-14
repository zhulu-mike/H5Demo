package game.modules.scene.view;
import game.managers.ResourceManager;
import game.managers.LayoutManager;
import haxe.ui.toolkit.controls.Image;
import game.display.CustomSprite;
class MainScene extends CustomSprite{
    public function new() {
        super();
        LayoutManager.sceneui.addChild(this);
        var bg:Image = new Image();
        this.addChild(bg);
        bg.resource = ResourceManager.BG_IMAGE;



    }
}

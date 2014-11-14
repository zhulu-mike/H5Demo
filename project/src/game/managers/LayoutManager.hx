package game.managers;
import haxe.ui.toolkit.core.Root;
import game.display.Layer;
class LayoutManager {
    public function new() {
    }

    public static var sceneui:Layer;
    public static var baseui:Layer;

    public static function init(root:Root):Void
    {

        sceneui = new Layer();
        root.addChild(sceneui);

        baseui = new Layer();
        root.addChild(baseui);


    }
}

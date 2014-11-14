package game.display;
import haxe.ui.toolkit.core.DisplayObjectContainer;
import haxe.ui.toolkit.layout.Layout;
import haxe.ui.toolkit.layout.AbsoluteLayout;
class Layer extends DisplayObjectContainer{
    public function new(lay:Layout=null) {
        super();
        if (lay == null)
               lay = new AbsoluteLayout();
        this.layout = lay;
    }
}

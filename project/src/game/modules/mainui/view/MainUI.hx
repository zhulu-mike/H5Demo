package game.modules.mainui.view;
import game.managers.ResourceManager;
import haxe.ui.toolkit.controls.Image;
import openfl.display.Sprite;
import game.managers.LayoutManager;
import game.display.CustomSprite;
class MainUI extends CustomSprite{

    private var operateSprite:CustomSprite;
    private var operateCoat:Image;
    private var operateImage:Image;
    private var skillSprite:CustomSprite;
    private var attack:Image;
    private var skill4:Image;
    private var skill3:Image;
    private var skill2:Image;
    private var skill1:Image;

    public function new() {
        super();
        LayoutManager.baseui.addChild(this);

        var bg:Image = new Image();
        this.addChild(bg);
//        bg.resource = ResourceManager.BG_IMAGE;

        operateSprite = new CustomSprite();
        this.addChild(operateSprite);
        operateSprite.x = 15;
        operateSprite.y = 378;

        operateCoat = new Image();
        operateSprite.addChild(operateCoat);
        operateCoat.resource = ResourceManager.OPERATE_COAT;

        operateImage = new Image();
        operateSprite.addChild(operateImage);
        operateImage.x = 22.5;
        operateImage.y = 22.5;
        operateImage.resource = ResourceManager.OPERATE_IMAGE;


        skillSprite = new CustomSprite();
        this.addChild(skillSprite);
        skillSprite.x = skillSprite.y = 0;

        attack = new Image();
        skillSprite.addChild(attack);
        attack.y = 400;
        attack.x = 723;
        attack.resource = ResourceManager.ATTACK_IMAGE;

        skill4 = new Image();
        skillSprite.addChild(skill4);
        skill4.y = 427;
        skill4.x = 637;
        skill4.resource = ResourceManager.SKILL4_IMAGE;

        skill3 = new Image();
        skillSprite.addChild(skill3);
        skill3.y = 405;
        skill3.x = 680;
        skill3.resource = ResourceManager.SKILL3_IMAGE;

        skill2 = new Image();
        skillSprite.addChild(skill2);
        skill2.y = 371;
        skill2.x = 710;
        skill2.resource = ResourceManager.SKILL2_IMAGE;

        skill1 = new Image();
        skillSprite.addChild(skill1);
        skill1.y = 328;
        skill1.x = 744;
        skill1.resource = ResourceManager.SKILL1_IMAGE;
    }


}

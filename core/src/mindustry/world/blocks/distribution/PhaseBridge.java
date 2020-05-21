package mindustry.world.blocks.distribution;

import arc.*;
import arc.graphics.*;
import arc.graphics.g2d.*;
import arc.math.*;
import arc.math.geom.*;
import arc.struct.*;
import arc.struct.IntSet.*;
import arc.util.*;
import arc.util.io.*;
import mindustry.annotations.Annotations.*;
import mindustry.entities.units.*;
import mindustry.gen.*;
import mindustry.graphics.*;
import mindustry.type.*;
import mindustry.world.*;
import mindustry.world.meta.*;

import static mindustry.Vars.*;

public class PhaseBridge extends ItemBridge{
    public static Color defaultColor = Color.valueOf("#999ac5");

    public @Load("@-color") TextureRegion colorRegion;

    public PhaseBridge(String name){
        super(name);
        canOverdrive = false;
        hasPower = true;
        consumes.power(0.30f);
    }

    public class PhaseBridgeEntity extends ItemBridgeEntity{
        public Color color = defaultColor;

        @Override
        public void draw(){
            super.draw();

            Draw.z(Layer.power);

            Tile other = world.tile(link);
            if(!linkValid(tile, other)) return;

            float opacity = Core.settings.getInt("bridgeopacity") / 100f;
            if(Mathf.zero(opacity)) return;

            int i = relativeTo(other.x, other.y);

            Draw.color(color.lerp(getColor(), 0.05f));
            Draw.alpha(Math.max(uptime, 0.25f) * opacity);

            Draw.rect(colorRegion, x, y, i * 90 + 90);
            Draw.rect(colorRegion, other.drawx(), other.drawy(), i * 90 + 270);

            Draw.rect(endRegion, x, y, i * 90 + 90);
            Draw.rect(endRegion, other.drawx(), other.drawy(), i * 90 + 270);

            Lines.stroke(8f);
            Lines.line(bridgeRegion, x, y,
                other.worldx(), other.worldy(),
                CapStyle.none, -tilesize / 2f);

            int dist = Math.max(Math.abs(other.x - tile.x), Math.abs(other.y - tile.y));

            float time = time2 / 1.7f;
            int arrows = (dist) * tilesize / 4 - 2;

            for(int a = 0; a < arrows; a++){
                Draw.alpha(Mathf.absin(a / (float)arrows - time / 100f, 0.1f, 1f) * uptime * opacity);
                Draw.rect(arrowRegion,
                    x + Geometry.d4[i].x * (tilesize / 2f + a * 4f + time % 4f),
                    y + Geometry.d4[i].y * (tilesize / 2f + a * 4f + time % 4f), i * 90f);
            }
            Draw.reset();
        }

        public Color getColor(){
            Item item = items.first();
            return item == null ? defaultColor : item.color;
        }
    }
}


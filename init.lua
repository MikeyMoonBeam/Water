-- Some properties have been removed as they are beyond
--  the scope of this chapter.

minetest.register_node("water:water_source", {
    description = "Cycle Water",
    drawtype = "liquid",
    paramtype = "light",

    inventory_image = minetest.inventorycube("default_water.png"),
    -- ^ this is required to stop the inventory image from being animated

    tiles = {
        {
            name = "default_water_source_animated.png",
            animation = {
                type     = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length   = 2.0
            }
        }
    },

    special_tiles = {
        -- New-style water source material (mostly unused)
        {
            name      = "default_water_source_animated.png",
            animation = {type = "vertical_frames", aspect_w = 16,
                aspect_h = 16, length = 2.0},
            backface_culling = false,
        }
    },

    --
    -- Behavior
    --
    walkable     = false, -- The player falls through
    pointable    = false, -- The player can't highlight it
    diggable     = false, -- The player can't dig it
    buildable_to = true,  -- Nodes can be replace this node

    alpha = 160,

    --
    -- Liquid Properties
    --
    drowning = 1,
    liquidtype = "source",

    liquid_alternative_flowing = "default:water_flowing",
    -- ^ when the liquid is flowing

    liquid_alternative_source = "water:water_source",
    -- ^ when the liquid is a source

    liquid_viscosity = WATER_VISC,
    -- ^ how fast

    liquid_range = 12,
    -- ^ how far

    post_effect_color = {a=64, r=100, g=100, b=200},
    -- ^ color of screen when the player is submerged
})


minetest.register_node("water:cloud", {
	description = "Rain Cloud",
	tiles = {"rain_cloud.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
})

minetest.register_node("water:rain", {
	description = "Rain",
	drawtype = "plantlike",
	tiles = {
		{
			name="rain_rain.png",
			animation={type="vertical_frames",
			aspect_w=16, aspect_h=16, length=0.2}
		}
	},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
})

minetest.register_abm({
	nodenames={"default:air"}
	neighbors= {"water:cloud"}i
})



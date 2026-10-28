Hi! Welcome to my mod!

Katie's Reticle Mod takes Nacho's R1Delta reticle fix and transforms it into something more modular.

In a nutshell, KRM does the following:

1. Keeps every reticle as centered as possible (even iron sights!)
2. Allows you to choose how much the reticle moves on screen
3. Allows you to choose how big or small each reticle is
4. Fixes the Holosight's weird broken reticle and makes it a bit more sensible

IMPORTANT: if you don't see any changes being made or you wanna come back to this mod after using another optics mod, DO THE FOLLOWING:
1. Restart the game fully
2. Make sure sv_cheats is set to 1, then run mat_reloadmaterial models/weapons/attachments/ in the console (open the console with the ` or ~ key) to reload materials and textures!

"But I wanna know how to USE it!" OKAY, okay! Relax, girl. Fuck.




There are a few commands that you must know about in order for you to customize the mod. I'll describe them in a second list below this.
Type these as they're written here. You can change the numbers to fit your preferences:

1. autocvar_set_reticle_offset_amount 1
2. autocvar_set_global_reticle_scale 1
3. autocvar_disable_collimation 0
4. autocvar_set_reticle_scale_hcog 1
5. autocvar_set_reticle_scale_holo 1
6. autocvar_set_reticle_scale_aog 1
7. autocvar_set_reticle_scale_<weapon name> 1




There ya go. Alright. Here's what these do:

1. Changes how much the reticle moves. A value of 1 is stationary on the screen.
2. Changes the size of all the reticles in the game at the same time. Bigger number = smaller reticle.
3. When set to 1, disables the function that keeps reticles the same size on your screen no matter how much your gun moves.
4. How small the HCOG reticle is. Bigger number = smaller reticle.
5. How small the Holosight reticle is. Bigger number = smaller reticle.
6. How small the AOG reticle is. Bigger number = smaller reticle.
7. How small the reticle is for the iron sights of the weapon you specify. Bigger number = smaller reticle.




Here are ALL the details for each and every one, if you need as much info as possible:

1. This command changes how much the reticle moves when you move the camera, and in what direction.
   By default, I've set it to a value of 1. A value of 1 means the reticle is perfectly centered,
   and doesn't move from the center of the screen as long as you're aiming.

   Values less than 1 will make the reticle feel slow, while values above 1 will make it feel fast.
   Keep in mind that the visual location of the aiming reticle is NOT where your bullet will go!
   Generally, your bullets will go to the center of your screen, even if your reticle isn't there.

   For those who are EXTRA curious:

   The reticle is a texture that's attached to the optic model itself.
   You know how the gun kinda wiggles when you look around? That's why we have to do all this math lol.
   A value of 1 means the texture moves just enough in the air inside the optic that
   it ends up perfectly counteracting the animation of the gun wiggling when you look around.
   So, when you look to the left, the gun moves to the right. Without this math, the reticle would
   follow the gun and move to the right of the screen, but because of the geniuses at Respawn, it
   moves to the left instead.

   This mod adds special math and extra code to make certain that things are exact and consistent!

2. This command changes the size of ALL the reticles in the game at the same time!
   Do you like your reticles generally smaller, and don't like how big they are by default?
   Try changing this to 2!

   This number is how many times SMALLER the reticle should be. Remember: a value of 2 is not twice as big!
   It's twice as SMALL!

3. This command is very subtle. It changes whether the mod should account for collimation or not.
   Practically, when this setting is set to 0 (meaning it is NOT disabling anything), that means
   the mod will try to keep the reticle the same size on your screen no matter what happens.

   What's the point of this, you ask? Well, turn it to 1 and see if you like it more!

   The point of this setting is to simulate what's called "collimation." Collimation is an optical term that
   means "making all light rays parallel." In real life, holographic sights project a reticle 200 meters
   away from the glass by shining parallel light rays into your eye. As a result, the reticle doesn't
   really get much bigger or smaller when you move your eye closer or farther away from it.

   So, in Titanfall, I made the texture appear to be the same size on your screen, even when the camera zooms in or out.
   The reason we need a special setting for this is the same reason we need math to keep the reticle
   in the center of the screen. It's because the reticle is a floating texture that's stuck to the gun.
   When the gun shoots, it rocks back and forth with recoil. When the gun gets closer to the camera,
   it gets bigger. Since the reticle is stuck to the gun, the reticle gets bigger when you shoot.
   We don't want that. The whole point of Respawn's funky math that makes the reticle move was to make it
   look like there was parallax, right? So, why not go the whole nine yards and add collimation?

   If you're confused, go take a look outside your window.
   See anything that's far away, like a mountain, or some clouds?
   Now, step closer to the window. The cloud didn't get too much bigger to your eye, did it? But the window did!
   That's because the window is closer. Things that are far away don't change as much when you change your perspective.
   Fun fact for ya: an object that is twice as far away from your eye will be half the size.
   Twice as far = twice as small. This also means that, the farther something is from you, the less its size
   will change to your eye.

4. This command is like command #2, but only for the HCOG. Don't like the size of the HCOG, but like all the rest? Change this.
5. This command is like command #2, but only for the Holosight. Don't like the size of the Holosight, but like all the rest? Change this.
6. This command is like command #2, but only for the AOG. Don't like the size of the AOG, but like all the rest? Change this.
7. This command is like command #2, but only for the iron sights' reticle of the weapon you specify. Don't like the size of one weapon's iron sight dot, but like all the rest? Change this.
   Here are all the weapon names you can use:

   r101
   g2
   hemlok
   lmg
   r97
   car
   wingman

   "But the wingman doesn't have a dot," I hear you say! Oh, but it does. It does if you download the mod for it that my friend Nacho made:
   https://github.com/NachosChipeados/R1D-Mods/tree/main/Nachos.Viewmodel_Tweaks




Well, there you have it. That's all you need to know as a player. Enjoy your shiny new optics!
Found a bug? Oh, shit. That's important. Come yell at me. You can contact me on Discord. My username is KatDiedAgain. I like pink. You'll know it's me.



Now, here's a comprehensive list of modifications this addon makes to R1Delta (for the nerds):

1. Adjusts Nacho's offset values in the material proxies file to be as close as humanly possible to perfect center.

2. Modifies HCOG front, Holo front, AOG red reticle, and CQB dot material files to utilize axis-based scripts for driving holoOffset
   in order to counterweigh the mesh scaling issues that keep holoOffset from being consistent across all materials.
   This allows the HCOG reticle to move freely and uniformly across both X *and* Y.

3. Adds new functions which have more fine-tuned data, better algorithms, and a more open and modular structure (future proof for custom weapons). These new functions allow for a number of new features,
   from allowing the user to adjust offset values and scale, to enabling the simulation of collimation of the reticle via motion and zoom compensation.

4. Modifies the following sway values for all primary weapons:
   "sway_min_yaw_zoomed"      "-0.03"
   "sway_max_yaw_zoomed"      "0.03"
   "sway_min_pitch_zoomed"    "-0.03"
   "sway_max_pitch_zoomed"    "0.03"

   Solving the axial scaling issue with the HCOG means weapon sway can now be uniform across both axes. Weapons now sway on Y just as much as they do on X,
   which makes aiming with high offset values much more comfortable.

5. Constricts the zoom sway values for pistols to 0.02 in order to reduce how much the reticle moves off center without making the pistols feel frozen.

6. Replaces the Holosight's rear texture with a combined dot-and-crosshair-ring reticle to reduce the size of the dot and keep it "coplanar" with the ring.

7. Adjusts the color of the Holosight's reticle to be a bit more blue.

8. Replaces the Holosight's front texture with a blank image, because I'm silly and never considered just reducing its opacity somehow. Sorry.

9. Replaces all primary weapon models with modified versions that contain a new IRON_SIGHT attachment. This means we only need to check for one iron sight attachment,
   and iron sights don't have to use the HCOG_FRONT anchor. Gives us more room to work with it.

10. Allows iron sights to utilize holoOffset to maintain zero even with weapon sway.

11. Adds emitter materials for each weapon to separate all their colors from the optics. Before, iron sights were using the HCOG or Holosight emitter materials, restricting
    the noise scale and colors to those used with the associated optic.

12. Adds a few extra texture files if anyone wants to use them. The combined Holosight reticle texture has three variants with a faded ring, each at a different intensity,
    and the dot textures used for pistol iron sights have long variants that only fucking work for the P2011 (-_-).

13. Exposes the hitmarker script in hudcrosshair_code.res if anyone wants to fuck with that.

14. Adds a bunch of commands for tinkering with offset and scale values at runtime, and there's functionality for using a cfg file if users want to save their settings.
    This also means that commands set in-game will be retained through reboots, though we're not sure how it's doing that without actually creating a cfg file...
    Where the hell is it saving that data??? Beats me.




That about does it.
This mod is required for a few other mods in this repo, including but not limited to:

1. Katie's Noncoplanar Optics: reintroduces that layered depth effect that the original game's optics had, but better this time
2. Katie's Sharp Dot Reticles: makes the HCOG, Holosight, and AOG use sharp dots instead of the fuzzy reticles that suit the game's atmosphere and setting

Other mods that do not require Katie's Reticle Mod but are included in my repo are as follows:
1. Katie's Vanilla Optics: brings back the original weapon sway, reticle materials, and material proxies file that shipped with Titanfall on PC. WARNING: there's a reason we fixed them.
   May require a game reboot and material refresh with mat_reloadmaterial models/weapons/attachments/ (requires sv_cheats 1) in order to take effect or be removed.
   Make sure to reboot the game and refresh the materials ESPECIALLY when TURNING THIS MOD OFF and returning to Katie's Reticle Mod.

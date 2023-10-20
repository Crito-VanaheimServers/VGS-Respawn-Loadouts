# VGS-Respawn-Loadouts

What it does:
  After selecting a spawn location and pressing spawn button the VGS Respawn Loadouts screen shows up and allows players to build a loadout.
  Weapon icon button allows choice of primary weapon, scope to put on weapon, and ammunition to load into weapon.
  Uniform icon button allows choice of Uniform and choice to add items to its inventory.
  Vest icon button allows choice of vest and choice to add items to its inventory.
  Backpack icon button allows choice of backpack and choice to add items to its inventory.
  Helmet icon button allows choice of headgear such as hats, helmets, ect.
  NVG icon button allows choice of night vision.

  all items and gear that players can chose from can be customized in config.sqf allowing server owners to only allow certain items and gear
  to be available for respawn.
  
Features:
  Respect based - turn on or off in config. If turned on each gear piece and item will get its respect rating from the trader files and if player
                 does not have it unlocked they cant use it in a loadout until it is unlocked.
  
  pricing - turn on or off in config. If turned on each gear piece and item will gets its cost from trader files and add them up for a total cost of the 
            entire loadout that is taken from players bank account when the press spawn button on the loadout screen. If they don't have enough tabs the 
            spawn button becomes inactive and the player has to start removing items until the spawn button becomes activate again.

  Loadout Saving - Allows players to build a loadout and save it to database. Only saves 1 loadout.

  Loadout Loading - Allows players to load a saved loadout for faster respawn instead of building a loadout every time they die.

video preview:
  https://www.youtube.com/watch?v=dFiAJQyw4Uw

# Steamworks.gml
**Quick links:** 
[documentation](https://yal.cc/r/17/steamworks-gml/)
· [sample project](https://yellowafterlife.itch.io/steamworks-gml-example)
· [donate](https://yellowafterlife.itch.io/steamworks-gml-example/purchase)

A native extension for GameMaker (GMS1, GMS2, GMS2.3+) that implements various Steam API features not covered by the built-in functions - most importantly, P2P networking, lobbies, and matchmaking.

## Usage

1. Set up GameMaker for Steamworks SDK development ([GMS1](http://help.yoyogames.com/hc/en-us/articles/216754138-Using-The-Steamworks-SDK-With-GameMaker-Studio), [GMS2](https://help.yoyogames.com/hc/en-us/articles/360006823232-Enabling-Steam-Integration-In-Your-Desktop-Games)).
2. Enable Steamworks support for desired platform(s) in Global Game Settings, "Steam" tab. Don't forget to set the game ID.
3. Import the "Steamworks.gml" extension (from ./Steamworks.gmx/extensions) to your desired project.
4. Have the game call `steam_gml_update` once per step (required for steam events to dispatch).

If all is well, upon running the game you'll see `Steamworks.gml initialized successfully.` in the CompileForm.

`Steamworks.gml failed to link with Steam API.` means that either the Steam client is not running, or you have specified an incorrect App ID.

`Steamworks.gml binary is not loaded.` means that the DLL/DyLib/SO could not be loaded, usually due to the native extension file missing or being otherwise inaccessible.

**Note:** If you are grabbing the sample project straight from this repository, you will need to compile it first using Visual Studio (Windows) or via included .sh scripts (Mac, Linux). [Sample project](https://yellowafterlife.itch.io/steamworks-gml-example) page has pre-compiled binaries.

## Building

Download or clone the repository.

Create a "Steamworks" directory and place [Steamworks SDK](https://partner.steamgames.com/) there.  
You must pick a Steamworks version that matches the recommended version for your version of GameMaker (e.g. 1.42 for GMS2.3 - see [helpdesk](https://help.yoyogames.com/hc/en-us/articles/227860547-GMS2-Required-SDKs)).  
Steamworks' `Readme.txt` should be located at `Steamworks/Readme.txt` as result.

**Windows:** Open the included Visual Studio solution and order it to make a x86 build.

**Linux:** Run build_linux_gms#.sh. You'll need cpp:i386, gcc:i386, and g++:i386 installed.

**Mac OSX:** Run build_osx_gms#.sh. You'll need XCode command line tools installed.

The extension is automatically updated to reflect the functions/macros from the source code as a post-build step in the Visual Studio project (via [gmxgen](https://github.com/YAL-GameMaker-Tools/GmxGen)).
Copy `GmxGen.exe` (build it yourself or get one from Downloads) into `Steamworks.gml` directory or add it to your PATH.

## Meta
Author: Vadim "YellowAfterlife" Dyachenko

License: MIT https://opensource.org/licenses/mit-license.php

## Special thanks

* [YoYo Games](http://yoyogames.com/), for making and continuously improving GameMaker: Studio.
* Russell and Peter of YoYo Games in particular, for answering my questions on native extensions.
* [Alex Fernandez](https://twitter.com/alexfislegend), for helping build the OSX version of the extension.
* [/id/volnes](http://steamcommunity.com/id/volnes/), for answering my various Linux-related questions.
* [Riley Labrecque](https://github.com/rlabrecque), for being a source of inspiration to making this kind of project open-source (see [Steamworks.NET](https://github.com/rlabrecque/Steamworks.NET)).

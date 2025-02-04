/**
 *   raylib-hx - a Haxe binding for the library raylib, a simple and easy-to-use library to enjoy videogames programming
 *
 *   LICENSE: zlib/libpng
 *
 *   raylib-hx is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
 *   BSD-like license that allows static linking with closed source software:
 *
 *   Copyright (c) 2021-2022 Ratul Krisna (@ForeignSasquatch)
 *
 *   This software is provided "as-is", without any express or implied warranty. In no event
 *   will the authors be held liable for any damages arising from the use of this software.
 *
 *   Permission is granted to anyone to use this software for any purpose, including commercial
 *   applications, and to alter it and redistribute it freely, subject to the following restrictions:
 *
 *     1. The origin of this software must not be misrepresented; you must not claim that you
 *     wrote the original software. If you use this software in a product, an acknowledgment
 *     in the product documentation would be appreciated but is not required.
 *
 *     2. Altered source versions must be plainly marked as such, and must not be misrepresented
 *     as being the original software.
 *
 *     3. This notice may not be removed or altered from any source distribution.
 */

package raylib;

#if !cpp
#error 'Raylib supports only C++ target platforms.'
#end
import raylib.Types;

extern enum abstract TouchAction(TouchActionImpl)
{
    @:native('TOUCH_ACTION_UP') var TOUCH_ACTION_UP;
    @:native('TOUCH_ACTION_DOWN') var TOUCH_ACTION_DOWN;
    @:native('TOUCH_ACTION_MOVE') var TOUCH_ACTION_MOVE;
    @:native('TOUCH_ACTION_CANCEL') var TOUCH_ACTION_CANCEL;

    @:from
    static inline function fromInt(i:Int):TouchAction
        return cast i;

    @:to
    inline function toInt():Int
        return untyped this;
}

@:buildXml('<include name="${haxelib:raylib-hx}/project/Build.xml" />')
@:include('rgestures-impl.h')
@:native('TouchAction')
private extern class TouchActionImpl {}

@:buildXml('<include name="${haxelib:raylib-hx}/project/Build.xml" />')
@:include('rgestures-impl.h')
@:unreflective
@:structAccess
@:native('GestureEvent')
extern class GestureEventImpl
{
    var touchAction:Int;
    var pointCount:Int;
    var pointId:raylib.utils.IntPointer;
    var position:cpp.RawPointer<Vector2Impl>;

    function new():Void;
}

@:forward
@:nullSafety
extern abstract GestureEvent(cpp.Struct<GestureEventImpl>) to cpp.Struct<GestureEventImpl>
{
    inline function new():Void
    {
        this = new GestureEventImpl();
    }

    @:from
    static inline function fromNative(value:GestureEventImpl):GestureEvent
        return cast value;

    @:to
    inline function toConstPointer():cpp.RawConstPointer<GestureEventImpl>
        return cast cpp.RawConstPointer.addressOf(this);

    @:to
    inline function toPointer():cpp.RawPointer<GestureEventImpl>
        return cast cpp.RawPointer.addressOf(this);
}

@:buildXml('<include name="${haxelib:raylib-hx}/project/Build.xml" />')
@:include('rgestures-impl.h')
@:unreflective
extern class RGestures
{
    @:native('ProcessGestureEvent')
    static function ProcessGestureEvent(event:GestureEventImpl):Void;

    @:native('UpdateGestures')
    static function UpdateGestures():Void;
}

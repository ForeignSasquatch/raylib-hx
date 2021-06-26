package;

import Raylib.*;
import Raylib.Colors.*;

class Main
{
    static function main()
    {
        InitWindow(800, 450, "hxRaylib");

        while (!WindowShouldClose())
        {
            BeginDrawing();

            ClearBackground(RAYWHITE);
            DrawText("Congrats! You created your first window using hxRaylib!", 190, 200, 20, LIGHTGRAY);
            
            EndDrawing();
        }

        CloseWindow();
    }
}
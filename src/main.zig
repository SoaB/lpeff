const rl = @cImport({
    @cDefine("SUPPORT_GIF_RECORDING", "1");
    @cInclude("Raylib.h");
});

const std = @import("std");
const math = std.math;
const print = std.debug.print;
const effect = @import("effect.zig").Effect;
const rand = @import("rand.zig");

const scrWidth = 800;
const scrHeight = 600;

pub fn main() !void {
    rand.init();
    rl.InitWindow(scrWidth, scrHeight, "Noise for FUN");
    rl.SetTargetFPS(60);
    effect.init();
    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        rl.ClearBackground(rl.BLACK);
        rl.BeginBlendMode(rl.BLEND_ADDITIVE);
        effect.draw();
        effect.update();
        rl.EndBlendMode();
        rl.EndDrawing();
    }
    rl.CloseWindow();
}

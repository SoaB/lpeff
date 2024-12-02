const rl = @cImport({
    @cDefine("SUPPORT_GIF_RECORDING", "1");
    @cInclude("Raylib.h");
});

const std = @import("std");
const math = std.math;
const rand = @import("rand.zig");
const linepath = @import("linepath.zig").LinePath;
const MAX_NUM_LINES = 100;
const ORG_POS = rl.Vector2{ .x = 400.0, .y = 300.0 };

pub const Effect = struct {
    var linePaths: [MAX_NUM_LINES]linepath = undefined;
    pub fn init() void {
        for (0..MAX_NUM_LINES) |i| {
            linePaths[i] = linepath.init(ORG_POS);
        }
    }
    pub fn update() void {
        if (rl.IsMouseButtonPressed(rl.MOUSE_LEFT_BUTTON)) {
            const mousePos = rl.GetMousePosition();
            for (0..MAX_NUM_LINES) |i| {
                linePaths[i] = linepath.init(mousePos);
            }
        } else {
            for (0..MAX_NUM_LINES) |i| {
                linePaths[i].update();
            }
        }
    }
    pub fn draw() void {
        for (0..MAX_NUM_LINES) |i| {
            linePaths[i].draw();
        }
    }
};

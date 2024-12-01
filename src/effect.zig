const rl = @cImport({
    @cDefine("SUPPORT_GIF_RECORDING", "1");
    @cInclude("Raylib.h");
});

const std = @import("std");
const math = std.math;
const rand = @import("rand.zig");
const linepath = @import("linepath.zig").LinePath;
const MAX_NUM_LINES = 100;
pub const Effect = struct {
    var linePaths: [MAX_NUM_LINES]linepath = undefined;
    pub fn init() void {
        for (0..MAX_NUM_LINES) |i| {
            linePaths[i] = linepath.init();
        }
    }
    pub fn update() void {
        for (0..MAX_NUM_LINES) |i| {
            linePaths[i].update();
        }
    }
    pub fn draw() void {
        for (0..MAX_NUM_LINES) |i| {
            linePaths[i].draw();
        }
    }
};

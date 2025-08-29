const std = @import("std");

pub const SpecializeOn = @import("zlm-generic.zig").SpecializeOn;

/// Converts degrees to radian
pub fn toRadians(deg: anytype) @TypeOf(deg) {
    return std.math.pi * deg / 180.0;
}

/// Converts radian to degree
pub fn toDegrees(rad: anytype) @TypeOf(rad) {
    return 180.0 * rad / std.math.pi;
}

// export all vectors by-default to f32

const vecf32 = SpecializeOn(f32);

pub const Vec2 = vecf32.Vec2;
pub const Vec3 = vecf32.Vec3;
pub const Vec4 = vecf32.Vec4;
pub const vec2 = vecf32.vec2;
pub const vec3 = vecf32.vec3;
pub const vec4 = vecf32.vec4;

pub const Mat2 = vecf32.Mat2;
pub const Mat3 = vecf32.Mat3;
pub const Mat4 = vecf32.Mat4;

test Vec4 {
    const first: Vec4 = Vec4.zero;

    const second = first.add(first);

    try std.testing.expectEqual(first.scale(2), second);
}

test Vec3 {
    const first: Vec3 = Vec3.zero;

    const second = first.add(first);

    try std.testing.expectEqual(first.scale(2), second);
}

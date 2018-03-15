const std = @import("std");
const fmt = std.fmt;
const io  = std.io;

pub const ManyFields = extern struct {
    a: u8,
    b: u8,
    c: u8,
    d: u8,
    e: u8,
    f: u8,
    g: u8,
    h: u8,
    i: u8,
    j: u8,
    k: u8,
    l: u8,
    m: u8,
    n: u8,
    o: u8,
    p: u8,
    q: u8,
    r: u8,
    s: u8,
    t: u8,
    u: u8,
    v: u8,
    w: u8,
    x: u8,
    y: u8,
    z: u8,

    pub fn aFromStr(many: &ManyFields, str: []const u8) !void { many.a = try fmt.parseInt(u8, str, 10); }
    pub fn bFromStr(many: &ManyFields, str: []const u8) !void { many.b = try fmt.parseInt(u8, str, 10); }
    pub fn cFromStr(many: &ManyFields, str: []const u8) !void { many.c = try fmt.parseInt(u8, str, 10); }
    pub fn dFromStr(many: &ManyFields, str: []const u8) !void { many.d = try fmt.parseInt(u8, str, 10); }
    pub fn eFromStr(many: &ManyFields, str: []const u8) !void { many.e = try fmt.parseInt(u8, str, 10); }
    pub fn fFromStr(many: &ManyFields, str: []const u8) !void { many.f = try fmt.parseInt(u8, str, 10); }
    pub fn gFromStr(many: &ManyFields, str: []const u8) !void { many.g = try fmt.parseInt(u8, str, 10); }
    pub fn hFromStr(many: &ManyFields, str: []const u8) !void { many.h = try fmt.parseInt(u8, str, 10); }
    pub fn iFromStr(many: &ManyFields, str: []const u8) !void { many.i = try fmt.parseInt(u8, str, 10); }
    pub fn jFromStr(many: &ManyFields, str: []const u8) !void { many.j = try fmt.parseInt(u8, str, 10); }
    pub fn kFromStr(many: &ManyFields, str: []const u8) !void { many.k = try fmt.parseInt(u8, str, 10); }
    pub fn lFromStr(many: &ManyFields, str: []const u8) !void { many.l = try fmt.parseInt(u8, str, 10); }
    pub fn mFromStr(many: &ManyFields, str: []const u8) !void { many.m = try fmt.parseInt(u8, str, 10); }
    pub fn nFromStr(many: &ManyFields, str: []const u8) !void { many.n = try fmt.parseInt(u8, str, 10); }
    pub fn oFromStr(many: &ManyFields, str: []const u8) !void { many.o = try fmt.parseInt(u8, str, 10); }
    pub fn pFromStr(many: &ManyFields, str: []const u8) !void { many.p = try fmt.parseInt(u8, str, 10); }
    pub fn qFromStr(many: &ManyFields, str: []const u8) !void { many.q = try fmt.parseInt(u8, str, 10); }
    pub fn rFromStr(many: &ManyFields, str: []const u8) !void { many.r = try fmt.parseInt(u8, str, 10); }
    pub fn sFromStr(many: &ManyFields, str: []const u8) !void { many.s = try fmt.parseInt(u8, str, 10); }
    pub fn tFromStr(many: &ManyFields, str: []const u8) !void { many.t = try fmt.parseInt(u8, str, 10); }
    pub fn uFromStr(many: &ManyFields, str: []const u8) !void { many.u = try fmt.parseInt(u8, str, 10); }
    pub fn vFromStr(many: &ManyFields, str: []const u8) !void { many.v = try fmt.parseInt(u8, str, 10); }
    pub fn wFromStr(many: &ManyFields, str: []const u8) !void { many.w = try fmt.parseInt(u8, str, 10); }
    pub fn xFromStr(many: &ManyFields, str: []const u8) !void { many.x = try fmt.parseInt(u8, str, 10); }
    pub fn yFromStr(many: &ManyFields, str: []const u8) !void { many.y = try fmt.parseInt(u8, str, 10); }
    pub fn zFromStr(many: &ManyFields, str: []const u8) !void { many.z = try fmt.parseInt(u8, str, 10); }
};

const args = [][]const u8 {
    "-e",      "1",
    "-a",      "1",
    "--the-c", "3",
    "--the-j", "2",
    "-d",      "4",
    "--the-f", "2",
    "--the-g", "3",
    "-l",      "4",
    "-h",      "4",
    "--the-w", "3",
    "--the-s", "3",
    "--the-k", "3",
    "-p",      "4",
    "-m",      "1",
    "--the-n", "2",
    "--the-b", "2",
    "--the-v", "2",
    "-q",      "1",
    "--the-r", "2",
    "-x",      "4",
    "-i",      "1",
    "--the-o", "3",
    "-u",      "1",
    "--the-z", "2",
    "-t",      "4",
    "-y",      "1",
};

fn genOptions(comptime Op: type) []const Op {
    return []Op {
        Op.init(ManyFields.aFromStr)
            .setHelp("The 'a' value")
            .setShort('a')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.bFromStr)
            .setHelp("The 'b' value")
            .setLong("the-b")
            .takesValue(true),

        Op.init(ManyFields.cFromStr)
            .setHelp("The 'c' value")
            .setShort('c')
            .setLong("the-c")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.dFromStr)
            .setHelp("The 'd' value")
            .setShort('d')
            .setLong("the-d")
            .takesValue(true),

        Op.init(ManyFields.eFromStr)
            .setHelp("The 'e' value")
            .setShort('e')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.fFromStr)
            .setHelp("The 'f' value")
            .setLong("the-f")
            .takesValue(true),

        Op.init(ManyFields.gFromStr)
            .setHelp("The 'g' value")
            .setShort('g')
            .setLong("the-g")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.hFromStr)
            .setHelp("The 'h' value")
            .setShort('h')
            .setLong("the-h")
            .takesValue(true),

        Op.init(ManyFields.iFromStr)
            .setHelp("The 'i' value")
            .setShort('i')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.jFromStr)
            .setHelp("The 'j' value")
            .setLong("the-j")
            .takesValue(true),

        Op.init(ManyFields.kFromStr)
            .setHelp("The 'k' value")
            .setShort('k')
            .setLong("the-k")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.lFromStr)
            .setHelp("The 'l' value")
            .setShort('l')
            .setLong("the-l")
            .takesValue(true),

        Op.init(ManyFields.mFromStr)
            .setHelp("The 'm' value")
            .setShort('m')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.nFromStr)
            .setHelp("The 'n' value")
            .setLong("the-n")
            .takesValue(true),

        Op.init(ManyFields.oFromStr)
            .setHelp("The 'o' value")
            .setShort('o')
            .setLong("the-o")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.pFromStr)
            .setHelp("The 'p' value")
            .setShort('p')
            .setLong("the-p")
            .takesValue(true),

        Op.init(ManyFields.qFromStr)
            .setHelp("The 'q' value")
            .setShort('q')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.rFromStr)
            .setHelp("The 'r' value")
            .setLong("the-r")
            .takesValue(true),

        Op.init(ManyFields.sFromStr)
            .setHelp("The 's' value")
            .setShort('s')
            .setLong("the-s")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.tFromStr)
            .setHelp("The 't' value")
            .setShort('t')
            .setLong("the-t")
            .takesValue(true),

        Op.init(ManyFields.uFromStr)
            .setHelp("The 'u' value")
            .setShort('u')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.vFromStr)
            .setHelp("The 'v' value")
            .setLong("the-v")
            .takesValue(true),

        Op.init(ManyFields.wFromStr)
            .setHelp("The 'w' value")
            .setShort('w')
            .setLong("the-w")
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.xFromStr)
            .setHelp("The 'x' value")
            .setShort('x')
            .setLong("the-x")
            .takesValue(true),

        Op.init(ManyFields.yFromStr)
            .setHelp("The 'y' value")
            .setShort('y')
            .takesValue(true)
            .setKind(Op.Kind.Required),
        Op.init(ManyFields.zFromStr)
            .setHelp("The 'z' value")
            .setLong("the-z")
            .takesValue(true),
    };
}

const NullOutStream = struct {
    stream: Stream,

    pub const Stream = io.OutStream(error{T});

    pub fn init() NullOutStream {
        return NullOutStream {
            .stream = Stream {
                .writeFn = writeFn,
            },
        };
    }

    fn writeFn(out_stream: &Stream, bytes: []const u8) (error{T}!void) { }
};

pub fn exportBenchmark(comptime file_name: []const u8) void {
    const package = @import(file_name);
    const Benchmark = struct {
        const default : ManyFields = undefined;
        const ParseErr = @typeOf(ManyFields.rFromStr).ReturnType.ErrorSet;
        const Op = package.Option(ManyFields, ParseErr);
        const Clap = package.Parser(ManyFields, ParseErr, default, comptime genOptions(Op));

        pub export fn parse() ManyFields {
            return Clap.parse(args) catch unreachable;
        }

        pub export fn help() void {
            var nul_file_stream = NullOutStream.init();
            var nul_stream = &nul_file_stream.stream;

            Clap.help(nul_stream) catch unreachable;
        }
    };
}

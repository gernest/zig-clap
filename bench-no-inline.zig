
const clap   = @import("clap-no-inline.zig");
const common = @import("bench-common.zig");

const default : common.ManyFields = undefined;
const ParseErr = @typeOf(common.ManyFields.rFromStr).ReturnType.ErrorSet;
const Op = clap.Option(common.ManyFields, ParseErr);
const Clap = clap.Parser(common.ManyFields, ParseErr, default, comptime common.genOptions(Op));

pub export fn parse() common.ManyFields {
    return Clap.parse(common.args) catch unreachable;
}

pub export fn help() void {
    var nul_file_stream = common.NullOutStream.init();
    var nul_stream = &nul_file_stream.stream;

    Clap.help(nul_stream) catch unreachable;
}

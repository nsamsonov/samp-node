
include("hook.jl")

primitive type PlayerId <: Signed 32 end
PlayerId(x :: Int32) = reinterpret(PlayerId, x)
Int32(pid :: PlayerId) = reinterpret(Int32, pid)
Base.show(io :: IO, pid :: PlayerId) = print(io, "PlayerId($(Int32(pid)))")

# macro jcmd(x)
#    show(x)
# end


macro jcmd(x::Expr)
   # show(__module__.OnPlayerCommandText)
   @assert x.head == :function "@jcmd can only be applied to a function"
   signature, body = x.args
   name, args = signature.args[1], signature.args[2:end]
   cmd = string(name)
   signature.args[1] = Symbol("cmd")

   println(typeof(args))
   for arg in args
      name, type = arg.args
      # println(arg)
      println("argument $name with type $type")
   end
   println()
   show(Meta.show_sexpr(x))
   println()
   show(typeof(x))

   q = quote
      local $x
      local function wrapper(playerid::Integer, argstr::String)
      end
      println("EVALED")
   end
   return :(eval($q))
   # ... remainder of macro, returning an expression
end


@jcmd function setHp(playerid::PlayerId, target::PlayerId, hp::Number)
   println("calling setHp")
    # SetPlayerHealth(playerid, hp)
end

function strtok(stringView::SubString, type::Type{String})::Tuple{String, SubString}
   return string(stringView), stringView

end

function strtok(stringView::SubString, type::Type{Integer})::Tuple{String, Integer}
   print("Int")
   return stringView, 1
end

function strtok(stringView::SubString, type::Type{PlayerId})::Tuple{String, PlayerId}
   print("playerid")
   return stringView, Int(32)
end

# module gm
#    include Main.cmds
#    Main.cmds.@jcmd
#    function setHp(playerid: PlayerId, hp: Number)
#       SetPlayerHealth(playerid,  hp)
#    end
# end

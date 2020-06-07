
include("hook.jl")
include("natives.jl")

primitive type PlayerId <: Signed 32 end
PlayerId(x :: Int32) = reinterpret(PlayerId, x)
Int32(pid :: PlayerId) = reinterpret(Int32, pid)
Base.show(io :: IO, pid :: PlayerId) = print(io, "PlayerId($(Int32(pid)))")

__jcmds__ = Dict{String, Function}()

@hook OnPlayerCommandText function(playerid::Integer, commandString::String)
   cmd, argsstr = strtok(commandString)
   f = get(__jcmds__, cmd, nothing)
   if (f !== nothing)
      f(PlayerId(playerid), argsstr)
      return RETURN_TRUE
   end
end

macro jcmd(x::Expr)
   @assert x.head == :function "@jcmd can only be applied to a function"
   signature, body = x.args
   name, args = signature.args[1], signature.args[2:end]
   cmd = "/" * string(name)
   signature.args[1] = :__cmd
   exprs = Vector{Expr}()
   for arg in args[2:end]
      name, type = arg.args
      argsym = Symbol(name)
      typesym = Symbol(type)
      push!(exprs, quote
         $argsym, view = strtok(view, $typesym)
         push!(args, $argsym)
      end)
   end

   return quote
      begin
         local $x
         local function wrapper(playerid::PlayerId, view::AbstractString)
            args = []
            $(exprs...)
            __cmd(playerid, args...)
         end
         __jcmds__[$cmd] = wrapper
      end
   end
   # ... remainder of macro, returning an expression
end

function strtok(stringView::AbstractString, type::Type{String})::Tuple{String, AbstractString}
   return string(stringView), SubString("")

end

function strtok(stringView::AbstractString, type::Type{Integer})::Tuple{Integer, AbstractString}
   token, nextview = strtok(stringView)
   number = tryparse(Int, token)
   return number, nextview
end

function strtok(stringView::AbstractString, type::Type{Float32})::Tuple{Float32, AbstractString}
   token, nextview = strtok(stringView)
   number = tryparse(Float32, token)
   return number, nextview
end

function strtok(stringView::AbstractString, type::Type{Number})::Tuple{Number, AbstractString}
   return strtok(stringView, Float32)
end

function strtok(stringView::AbstractString, type::Type{PlayerId})::Tuple{PlayerId, AbstractString}
   token, nextview = strtok(stringView)
   playerid = tryparse(Int32, token)
   if (playerid === nothing)
      playerid = findplayer(token)
   end
   return playerid, nextview
end

function strtok(stringView::AbstractString)::Tuple{AbstractString, AbstractString}
   index = findfirst(' ', stringView)
   if (index === nothing)
      return stringView, ""
   end
   return SubString(stringView, 1, index - 1), SubString(stringView, index + 1)
end

function findplayer(name::AbstractString)
   for pid = 1:500
      if (startswith(GetPlayerName(pid), name))
         return pid
      end
   end
   return nothing
end


@jcmd function jcmdtest(playerid::PlayerId, target::PlayerId, hp::Float32, test::String)
   println("inside jcmdtest $(playerid) $(target) $(hp) $(test)")
end

@jcmd function jcmdtestint(playerid::PlayerId, num::Integer)
   println("inside jcmdtestint $(playerid) $(num)")
end

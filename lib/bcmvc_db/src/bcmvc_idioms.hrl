-compile({parse_transform, cut}).
-compile({parse_transform, do}).

-define(FUN(Body), fun() ->
                           Body
                   end).

-define(FUN1(Body), fun(X) ->
                           Body
                    end).

-define(DEFAULT(X, Y), case X of
                           undefined ->
                               Y;
                           not_found ->
                               Y;
                           _ ->
                               X
                       end).

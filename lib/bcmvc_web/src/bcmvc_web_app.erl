%%%----------------------------------------------------------------
%%% @author  Tristan Sloughter <tristan@mashape.com>
%%% @doc
%%% @end
%%% @copyright 2012 Tristan Sloughter
%%%----------------------------------------------------------------
-module(bcmvc_web_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%%===================================================================
%%% Application callbacks
%%%===================================================================

%% @private
-spec start(normal | {takeover, node()} | {failover, node()},
            any()) -> {ok, pid()} | {ok, pid(), State::any()} |
                      {error, Reason::any()}.
start(_StartType, _StartArgs) ->
    case bcmvc_web_sup:start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Error ->
            Error
    end.

%% @private
-spec stop(State::any()) -> ok.
stop(_State) ->
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================

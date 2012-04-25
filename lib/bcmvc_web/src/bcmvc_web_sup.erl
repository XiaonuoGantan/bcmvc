%%%----------------------------------------------------------------
%%% @author  Tristan Sloughter <tristan@mashape.com>
%%% @doc
%%% @end
%%% @copyright 2012 Tristan Sloughter
%%%----------------------------------------------------------------
-module(bcmvc_web_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

-spec start_link() -> {ok, pid()} | any().
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================


%% @private
-spec init(list()) -> {ok, {SupFlags::any(), [ChildSpec::any()]}} |
                       ignore | {error, Reason::any()}.
init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxSecondsBetweenRestarts = 3600,

    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

    ChildSpec = cowboy:child_spec(bcmvc_cowboy, 100, cowboy_tcp_transport, 
                                  [{port, 8080}], cowboy_http_protocol, [{dispatch, dispatch()}]),

    {ok, {SupFlags, [ChildSpec]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

dispatch() ->
    [{'_', [{[<<"todos">>], bcmvc_todo_handler, []},
            {[<<"todos">>, todo], bcmvc_todo_handler, []}]}].

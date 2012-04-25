%%%-------------------------------------------------------------------
%%% @author Tristan Sloughter <>
%%% @copyright (C) 2011, Tristan Sloughter
%%% @doc
%%%
%%% @end
%%% Created :  5 Jul 2011 by Tristan Sloughter <>
%%%-------------------------------------------------------------------
-module(bcmvc_model_todo).

%% API
-export([all/0,
         find/1,
         to_json/1,
         to_record/1,
         save/1,
	 update/1,
         delete/1]).

-include_lib("bcmvc_models/include/bcmvc_model.hrl").
-include_lib("bcmvc_models/include/jsonerl.hrl").

-record(bcmvc_model_todo, {id = ossp_uuid:make(v1, text) :: string(),
                           body                          :: binary(),
                           isDone                        :: boolean()}).

%%%===================================================================
%%% API
%%%===================================================================

all() ->
    bcmvc_db:all(?MODULE).

find(Criteria) when is_list(Criteria) ->
    bcmvc_db:find(?MODULE, Criteria);
find(Criteria) when is_tuple(Criteria)->
    bcmvc_db:find(?MODULE, [Criteria]).

to_json(Record) ->
    ?record_to_json(?MODULE, Record).

to_record(JSON) ->
    ?json_to_record(?MODULE, JSON).

save(Model) ->
    bcmvc_db:store(Model).

update(Model) ->
    bcmvc_db:update(Model).

delete(Id) ->
    bcmvc_db:delete(Id).

%%%===================================================================
%%% Internal functions
%%%===================================================================

-module(bcmvc_todo_handler).

-export([init/3,
         allowed_methods/2,
         content_types_accepted/2,
         content_types_provided/2,
         process_post/2,
         delete_resource/2,
         get_json/2,
         put_json/2]).

init(_Transport, _Req, _Opts) ->
    {upgrade, protocol, cowboy_http_rest}.

allowed_methods(Req, State) ->
    {['HEAD', 'GET', 'PUT', 'POST', 'DELETE'], Req, State}.

content_types_accepted(Req, State) ->
    {[{{<<"application">>, <<"json">>, []}, put_json}], Req, State}.

content_types_provided(Req, State) ->
    {[{{<<"application">>, <<"json">>, []}, get_json}], Req, State}.

process_post(Req, State) ->
    {ok, Body, Req1} = cowboy_http_req:body(Req),
    Todo = bcmvc_model_todo:to_record(Body),
    bcmvc_model_todo:save(Todo),
    {true, Req1, State}.

delete_resource(Req, State) ->
    {TodoId, Req1} = cowboy_http_req:binding(todo, Req),
    bcmvc_model_todo:delete(TodoId),
    {true, Req1, State}.

put_json(Req, State) ->
    {ok, Body, Req1} = cowboy_http_req:body(Req),
    {TodoId, Req2} = cowboy_http_req:binding(todo, Req1),

    Todo = bcmvc_model_todo:to_record(Body),
    Todo2 = bcmvc_model_todo:set([{id, TodoId}], Todo),
    bcmvc_model_todo:update(Todo2),
    
    {true, Req2, State}.

get_json(Req, State) ->
    JsonModels = lists:foldr(fun(X, <<"">>) ->
                                 X;
                            (X, Acc) ->
                                 <<Acc/binary, ",", X/binary>>
                         end, <<"">>, [bcmvc_model_todo:to_json(Model) || Model <- bcmvc_model_todo:all()]),

    {<<"[", JsonModels/binary, "]">>, Req, State}.

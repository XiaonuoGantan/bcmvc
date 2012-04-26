%%%-------------------------------------------------------------------
%%% @author Tristan Sloughter <>
%%% @copyright (C) 2011, Tristan Sloughter
%%% @doc
%%%
%%% @end
%%% Created :  4 Sep 2011 by Tristan Sloughter <>
%%%-------------------------------------------------------------------
-module(bcmvc_model_utils).

-export([create_tables/0,
         to_ex_a/1]).

create_tables() ->
    [bcmvc_db:create_table(Model, Model:fields()) || Model <- [bcmvc_model_todo]].

to_ex_a(A) when is_atom(A) -> A;
to_ex_a(B) when is_binary(B) ->
  to_ex_a(binary_to_list(B));
to_ex_a(S) when is_list(S) ->
  list_to_existing_atom(S);
to_ex_a(T) ->
  to_ex_a(io_lib:print(T)).

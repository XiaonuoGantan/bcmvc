-module(bcmvc_web_utils).

-export([qs_to_proplist/1]).

qs_to_proplist(Body) ->
    cowboy_http:x_www_form_urlencoded(Body, fun(X) ->             
                                                    Value = cowboy_http:urldecode(X),
                                                    case re:run(Value,
                                                                <<"todo\\[(.*)\\]">>, [{capture, [1], binary}]) of
                                                        nomatch ->
                                                            Value;
                                                        {match, [Key]} ->
                                                            bcmvc_model_utils:to_ex_a(Key)
                                                    end
                                            end).

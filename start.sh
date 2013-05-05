#!/bin/sh
erl -sname cowboy_chat -pa ebin deps/*/ebin -boot start_sasl -s my_app

#!/bin/bash

function get_logs (){ \
	FUNCTIONNAME=$( \
		terraform state show $1 | \
			awk '$1 == "function_name" {print $3}' \
	); aws logs get-log-events \
		--limit 100 \
		--log-group-name "/aws/lambda/$FUNCTIONNAME" \
		--log-stream-name "$( \
			aws logs describe-log-streams \
				--log-group-name "/aws/lambda/$FUNCTIONNAME" | \
					jq -r '.logStreams | sort_by(.lastEventTimestamp) | .[-1].logStreamName' \
		)" | \
			jq -r '.events[].message | gsub("\n$"; "")'; }; \
get_logs "$@"

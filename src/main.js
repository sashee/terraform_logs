exports.handler = function(event, context, callback) {
	const resp = `Called at ${new Date().toISOString()}`;

	console.log(resp);

	const response = {
		statusCode: 200,
		headers: {
			"Content-Type": "text/plain; charset=utf-8"
		},
		body: resp,
	};

	callback(null, response);
};

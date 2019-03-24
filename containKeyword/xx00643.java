|        Content-Security-Policy: default-src 'self'   --only allow content from your own site
        X-XSS-Protection: 1; mode=block   --prevent some reflective attacks in some browsers
        X-Content-Type-Options: nosniff   --can't trick browser into detecting and running js in other content types

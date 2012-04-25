## Batman-Cowboy TodoMVC

### Dependencies

Application |          Version 
----------- | -----------------
proper      |              1.0 
eunit       |            2.2.2 
mnesia      |              4.6 
jiffy       | 0.4.1-2.g64d0e65 
ossp_uuid   |                1 
cowboy      |            0.5.0 

### Nginx Setup

```nginx
server {
  listen 80;
  server_name localhost;

  location / {
    root   <PATH TO CLONE>/bcmvc/lib/bcmvc_web/priv/;

    if ($request_method ~* POST) {
	  proxy_pass        http://localhost:8080;
    }

    if ($http_accept ~* application/json) {
	  proxy_pass        http://localhost:8080;
    }
  }
}
```

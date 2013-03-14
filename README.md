
fluent-plugin-ustream
=====================


fluentd plugin of inputs from ustream data api.




## sample configuration

```test-ustream.conf
<source>
  type forward
</source>

<source>
  type ustream
  api_key yourDevKey
  channel yuiseki
  tag debug.ustream
</source>

<match debug.**>
  type stdout
</match>
```

will inputs

```
{"viewersNow"=>"0", "totalViews"=>"4326", "url"=>"http://www.ustream.tv/channel/yuiseki", "status"=>"offline"}
```

## TODO
- supporting configure multiple channels
- supporting configure the pooling interval

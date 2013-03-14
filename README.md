fluent-plugin-ustream
=====================


fluentd plugin of inputs from ustream data api.


## install

```
git clone git@github.com:yuiseki/fluent-plugin-ustream.git
cd fluent-plugin-ustream
sudo rake install
```



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

```
fluentd -c fluent/test-ustream.conf
```

will inputs

```
{"viewersNow"=>"0", "totalViews"=>"4326", "url"=>"http://www.ustream.tv/channel/yuiseki", "status"=>"offline"}
```


## TODO
- support to configure multiple channels
- support to configure the pooling interval
- register to rubygems.org


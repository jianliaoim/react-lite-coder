var
  stir $ require :stir-template

var
  ({}~ html head title body meta script link div a span) stir

var
  line $ \ (text) (div ({} (:className :line)) text)

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null ":React Lite Coder"
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :http://tp4.sinaimg.cn/5592259015/180/5725970590/1
        script $ object (:src data.vendor) (:defer true)
        script $ object (:src data.main) (:defer true)
      body null
        div ({} (:class :intro))
          div ({} (:class :title)) ":Code Editor and Code Viewer of jianliao.com."
          div null
            span null ":Read more at "
            a
              {} (:href :http://github.com/teambition/react-lite-coder)
              , :github.com/teambition/react-lite-coder
            span null :.
        div ({} (:id :example))

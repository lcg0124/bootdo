(function($) {
    // 首先备份下jquery的ajax方法
    var _ajax = $.ajax;

    // 重写jquery的ajax方法
    $.ajax = function(options) {
        // 备份opt中error和success方法
        var callback = {
            "beforeSend" : function(XHR) {
            },
            "complete" : function(XHR, TS) {
            },
            "error" : function(XMLHttpRequest, textStatus, errorThrown) {
            },
            "success" : function(data, textStatus) {
            }
        }

        // 判断参数中是否有beforeSend回调函数
        if (options.beforeSend) {
            callback.beforeSend = options.beforeSend;
        }

        // 判断参数中是否有complete回调函数
        if (options.complete) {
            callback.complete = options.complete;
        }

        // 判断参数中是否有error回调函数
        if (options.error) {
            callback.error = options.error;
        }

        // 判断参数中是否有success回调函数
        if (options.success) {
            callback.success = options.success;
        }

        // 扩展增强处理
        var _opt = $.extend(options, {
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                // 错误方法增强处理
                callback.error(XMLHttpRequest, textStatus, errorThrown);
            },
            success : function(data, textStatus) {
                // 成功回调方法增强处理
                callback.success(data, textStatus);
            },
            beforeSend : function(XHR) {
                // 提交前回调方法
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] //0.1透明度的白色背景
                });
                callback.beforeSend(XHR);
            },
            complete : function(XHR, TS) {
                // 请求完成后回调函数 (请求成功或失败之后均调用)。
                layer.closeAll('loading');
                callback.complete(XHR, TS);
            }
        });

        // 返回重写的ajax
        return _ajax(_opt);
    };
})(jQuery);
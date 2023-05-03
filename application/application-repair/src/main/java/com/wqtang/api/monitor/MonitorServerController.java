package com.wqtang.api.monitor;

import com.wqtang.object.domain.server.Server;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/server")
public class MonitorServerController {

    /**
     * 获取服务器的资源信息
     *
     * @return
     */
    @GetMapping
    public Server getServerInfo() {
        Server server = new Server();
        server.enrichFields();
        return server;
    }

}

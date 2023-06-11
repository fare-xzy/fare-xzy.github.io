package doc.study.Language.Java.JavaCode.Test;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

/***************************************************************************
 * <pre></pre>
 * @文件名称: Essays
 * @包路径： com.xzy.Java.JavaCode.Test
 * @版权所有： 北京数字认证股份有限公司 (C) 2017
 *
 * @类描述: 网络接口信息
 * @版本: V2.0
 * @创建人： XuZiyu
 * @创建时间： 2018-3-19 14:33
 *
 ***************************************************************************/
public class NetworkInterfaceTest {
    public static void main(String[] args) throws SocketException {
        // 获取本机所有网络接口
        Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
        while (networkInterfaces.hasMoreElements()) {
            NetworkInterface networkInterface = networkInterfaces.nextElement();

            // 获得与该网络接口绑定的 IP 地址，一般只有一个
            Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
            while (inetAddresses.hasMoreElements()) {
                InetAddress inetAddress = inetAddresses.nextElement();

                // 只关心 IPv4 地址
                if (inetAddress instanceof Inet4Address) {
                    System.out.println("网卡接口名称：" + networkInterface.getName());
                    System.out.println("网卡接口地址：" + inetAddress.getHostAddress());
                    System.out.println();
                }
            }

        }
    }
}
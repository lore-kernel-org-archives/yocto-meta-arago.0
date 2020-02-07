Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E4DFF529D8
	for <meta-arago@arago-project.org>;
	Fri,  7 Feb 2020 16:46:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017GiuWm037490
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 10:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581093896;
	bh=aSZxSsLFD5I6D+r9hTHZYfg8F7rX847Uf3UiClQikRA=;
	h=To:CC:From:Subject:Date;
	b=nCGGKfmIDquGhVP+VVzUlkfJUv+J9v9LVGfRCKjsIieXB6SWLwy5iSzUBC/FNmWzP
	a/Nwji+DRklyRG17sLb1eBeZGujbF8I6ClGUeRPyojwOblJ4CZ03mIAwSFhx85VvAE
	y77au9LKMaGC+cZ2E6AosfMkf8m1ln7/PL0tSMXE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017GiuHn063436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 10:44:56 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 7 Feb 2020 10:44:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 7 Feb 2020 10:44:55 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017Girej046804;
	Fri, 7 Feb 2020 10:44:54 -0600
To: "Dmytriyenko, Denys" <denys@ti.com>, <j-stiffler@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <7a652dc1-3e74-6da5-11c0-0d79684351e9@ti.com>
Date: Fri, 7 Feb 2020 22:13:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Failure to build docker
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 16:46:51 -0000
Content-Type: multipart/alternative;
	boundary="------------D6DF163389BC89ADA16D50C7"
Content-Language: en-US

--------------D6DF163389BC89ADA16D50C7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys/Jake,

I am trying to build a filesystem with docker for j7-evm machine.
I am able to build the package 'docker' but when I create a rootfs with 
the packagegroup including docker,
I get following error:
**
**[...]
*Installing docker (18.09.0+git489b8eda6674523df8b82a210399b7d2954427d0) 
on root
Downloading 
file:/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/oe-rootfs-repo/aarch64/docker_18.09.0+git489b8eda6674523df8b82a210399b7d2954427d0-r0.0_aarch64.ipk.
[...]**
**update-rc.d: 
/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/rootfs/etc/init.d/docker.init: 
file does not exist
***[...]
***
**WARNING: docker.postinst returned 1, marking as unpacked only, 
configuration required on target.**
**ERROR: Postinstall scriptlets of ['docker'] have failed. If the 
intention is to defer them to first boot,**
**then please place them into pkg_postinst_ontarget_${PN} ().**
**Deferring to first boot via 'exit 1' is no longer supported.**
**Details of the failure are in 
/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/temp/log.do_rootfs.**
**DEBUG: Python function do_rootfs finished**
**ERROR: Function failed: do_rootfs**
*

I tried to find online about this error, but didn't get the solution for 
this.
Please let me know how to fix this:
Detailed log at ftp://swubn03.india.ti.com/work/nikhil/log.do_rootfs.15595

Regards,
Nikhil D

--------------D6DF163389BC89ADA16D50C7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Verdana">Hi Denys/Jake,<br>
      <br>
      I am trying to build a filesystem with docker for j7-evm machine.<br>
      I am able to build the package 'docker' but when I create a rootfs
      with the packagegroup including docker, <br>
      I get following error:<br>
      <b></b></font><br>
    <font face="Verdana"><b><font face="Verdana"><b>[...]<br>
          </b></font>Installing docker
        (18.09.0+git489b8eda6674523df8b82a210399b7d2954427d0) on root<br>
        Downloading
<a class="moz-txt-link-freetext" href="file:/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/oe-rootfs-repo/aarch64/docker_18.09.0+git489b8eda6674523df8b82a210399b7d2954427d0-r0.0_aarch64.ipk">file:/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/oe-rootfs-repo/aarch64/docker_18.09.0+git489b8eda6674523df8b82a210399b7d2954427d0-r0.0_aarch64.ipk</a>.<br>
        [...]</b><b><br>
      </b><b>update-rc.d:
/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/rootfs/etc/init.d/docker.init:
        file does not exist<br>
      </b></font><font face="Verdana"><b><font face="Verdana"><b>[...]<br>
          </b></font></b><b><br>
      </b><b>WARNING: docker.postinst returned 1, marking as unpacked
        only, configuration required on target.</b><b><br>
      </b><b>ERROR: Postinstall scriptlets of ['docker'] have failed. If
        the intention is to defer them to first boot,</b><b><br>
      </b><b>then please place them into pkg_postinst_ontarget_${PN} ().</b><b><br>
      </b><b>Deferring to first boot via 'exit 1' is no longer
        supported.</b><b><br>
      </b><b>Details of the failure are in
/work/nikhil/ybd/k3-yocto-17-Jan/build/arago-tmp-external-arm-toolchain/work/j7_evm-linux/tisdk-rootfs-image/1.0-r0_psdkla/temp/log.do_rootfs.</b><b><br>
      </b><b>DEBUG: Python function do_rootfs finished</b><b><br>
      </b><b>ERROR: Function failed: do_rootfs</b><b><br>
      </b><br>
      <br>
      I tried to find online about this error, but didn't get the
      solution for this.<br>
      Please let me know how to fix this:<br>
      Detailed log at
      <a class="moz-txt-link-freetext" href="ftp://swubn03.india.ti.com/work/nikhil/log.do_rootfs.15595">ftp://swubn03.india.ti.com/work/nikhil/log.do_rootfs.15595</a><br>
      <br>
      Regards,<br>
      Nikhil D<br>
    </font>
  </body>
</html>

--------------D6DF163389BC89ADA16D50C7--

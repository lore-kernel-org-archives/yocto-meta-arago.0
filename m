Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A42C004C0
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 22:04:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.40696.1697753078696838745
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 15:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mod6Wu0h;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JM4bov048969;
	Thu, 19 Oct 2023 17:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697753077;
	bh=MpHFOqSK/eOQI5aoafghSjl+XdL74HHv/8Hr5V4uAqM=;
	h=From:To:Subject:Date;
	b=mod6Wu0h+sQ66LpAvHFHjoQhYkhPPB/0qnK0Ol53GEieacbZF206CNtpuTgiScuaX
	 oMxsnKDXjKsfMtHrYU/pWwttv2D4htoEEm45cX6jLsf8Y0QcJdh6vgDJhh6gZXQxlF
	 r5+M8rA7Rldegj2kumYS6LDgc1eHWJtOeq1YCrhg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JM4bLg010383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 17:04:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 17:04:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 17:04:37 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JM4bND086116;
	Thu, 19 Oct 2023 17:04:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qtb88-0007VX-OJ; Thu, 19 Oct 2023 17:04:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] systemd-telnetd: Unit files for starting telnetd under systemd
Date: Thu, 19 Oct 2023 17:04:35 -0500
Message-ID: <20231019220436.28260-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 22:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14959

With the recent changes to moving to systemd for all images, we lost the
needed files that started telnetd via the sysvinit method.  This just
adds the needed systemd files to do that directly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../systemd-telnetd/systemd-telnetd.bb        | 20 +++++++++++++
 .../systemd-telnetd/telnetd.service           | 29 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
 create mode 100644 meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service

diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
new file mode 100644
index 00000000..3158da5a
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -0,0 +1,20 @@
+SUMMARY = "telnetd"
+DESCRIPTION = "systemd config for starting telnetd."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://telnetd.service;beginline=1;endline=17;md5=d134d0d385c53f9201a270fef8448f29"
+
+SRC_URI = "file://telnetd.service"
+
+S = "${WORKDIR}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "telnetd.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "enable"
+
+do_install:append () {
+    # install systemd unit files
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/telnetd.service ${D}${systemd_system_unitdir}
+}
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service
new file mode 100644
index 00000000..d8b34373
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service
@@ -0,0 +1,29 @@
+#Permission is hereby granted, free of charge, to any person obtaining a copy
+#of this software and associated documentation files (the "Software"), to deal
+#in the Software without restriction, including without limitation the rights
+#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#copies of the Software, and to permit persons to whom the Software is
+#furnished to do so, subject to the following conditions:
+#
+#The above copyright notice and this permission notice shall be included in
+#all copies or substantial portions of the Software.
+#
+#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#THE SOFTWARE.
+
+[Unit]
+Description=Telnet Server
+After=local-fs.target
+
+[Service]
+RemainAfterExit=true
+Type=oneshot
+ExecStart=/usr/sbin/telnetd
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1



Return-Path: <anandb@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id BF91D52A26
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 09:25:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4G9PRcf018101
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 04:25:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4G9PRQl032073
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 04:25:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 May 2016 04:25:27 -0500
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4G9PP1u011359;	Mon, 16 May 2016 04:25:26 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 May 2016 14:55:23 +0530
Message-ID: <1463390723-32245-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] weston-init: add dependency on SGX DDK service
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
X-List-Received-Date: Mon, 16 May 2016 09:25:28 -0000
Content-Type: text/plain

- systemd starts Weston service much before DDK initialization
- Ensure that Weston service is started *after rc.pvr.service

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../wayland/weston-init/weston.service             |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
new file mode 100644
index 0000000..401c10e
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Weston Wayland compositor startup
+RequiresMountsFor=/run
+After=rc.pvr.service
+
+[Service]
+User=root
+EnvironmentFile=-/etc/default/weston
+Environment="XDG_RUNTIME_DIR=/run/user/root"
+ExecStartPre=/bin/mkdir -p /run/user/root
+ExecStartPre=/bin/chmod 0700 /run/user/root
+ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
+
+[Install]
+WantedBy=multi-user.target
+
-- 
1.7.9.5



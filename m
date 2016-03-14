Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 41DF1529C7
	for <meta-arago@arago-project.org>;
	Mon, 14 Mar 2016 14:43:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2EEhMS3025048
	for <meta-arago@arago-project.org>; Mon, 14 Mar 2016 09:43:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2EEhM8L022375
	for <meta-arago@arago-project.org>; Mon, 14 Mar 2016 09:43:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Mar 2016 09:43:21 -0500
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2EEhLiN002002;	Mon, 14 Mar 2016 09:43:21 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Mar 2016 10:43:19 -0400
Message-ID: <1457966599-5238-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] udev-cache: keystone: Disable udev cache for keystone devices by default
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
X-List-Received-Date: Mon, 14 Mar 2016 14:43:22 -0000
Content-Type: text/plain

This fixes issue with rpmsg-rpc devices sharing major numbers
and obtaining random minor number which may not be consistent between
booting.

Also fixes similar issue with uio devices enumeration.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default

diff --git a/meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default b/meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default
new file mode 100644
index 0000000..b1aa63f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default
@@ -0,0 +1,5 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+#DEVCACHE="/etc/dev.tar"
+PROBE_PLATFORM_BUS="yes"
-- 
1.9.1



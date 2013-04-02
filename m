Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 5CEC3529F0
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 00:52:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKL000V4RQ5M5A0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Apr 2013 19:51:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 40FFA201C7; Mon,
	01 Apr 2013 20:51:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Apr 2013 20:51:07 -0400
Message-id: <1364863868-14687-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1364863868-14687-1-git-send-email-denis@denix.org>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] branding-amsdk: add the initial AM-SDK branding policy
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
X-List-Received-Date: Tue, 02 Apr 2013 00:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Pin the kernel and u-boot providers/versions to the previous stable releases

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-amsdk.inc | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-amsdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
new file mode 100644
index 0000000..c50348c
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -0,0 +1,8 @@
+# AM-SDK branding configuration
+
+# Use the SDK supported kernel and kernel version
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
+PREFERRED_VERSION_linux-am335x = "3.2.0-psp05.06.00.00"
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
+PREFERRED_VERSION_u-boot-am33x = "2012.10"
-- 
1.8.1.5



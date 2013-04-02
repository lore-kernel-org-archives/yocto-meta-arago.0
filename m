Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 760975298C
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 00:52:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKL00LM5RQ6ZIW0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Apr 2013 19:51:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EED9420463; Mon,
	01 Apr 2013 20:51:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Apr 2013 20:51:08 -0400
Message-id: <1364863868-14687-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1364863868-14687-1-git-send-email-denis@denix.org>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] arago-prefs: set default preferences to the latest TI staging kernel and u-boot
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
X-List-Received-Date: Tue, 02 Apr 2013 00:52:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

As branded products can now pin older stable releases, if needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 7a0cc24..8f57fc1 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -14,12 +14,9 @@ ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gle
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
-# Use the SDK supported kernel and kernel version
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
-PREFERRED_VERSION_linux-am335x = "3.2.0-psp05.06.00.00"
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
-PREFERRED_VERSION_u-boot-am33x = "2012.10"
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
-- 
1.8.1.5



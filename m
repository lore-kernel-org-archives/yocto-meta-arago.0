Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1DD445297F
	for <meta-arago@arago-project.org>;
	Sat,  3 Aug 2019 16:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D36F40BF9;
	Sat,  3 Aug 2019 16:41:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FYb62aPyqNrO; Sat,  3 Aug 2019 16:41:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63ED440BAF;
	Sat,  3 Aug 2019 16:41:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 441AC171F39;
	Sat,  3 Aug 2019 12:41:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat,  3 Aug 2019 12:41:43 -0400
Message-Id: <1564850504-22118-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] ufs-tool: add tool to access UFS devices from user space
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
X-List-Received-Date: Sat, 03 Aug 2019 16:42:42 -0000

https://github.com/westerndigitalcorporation/ufs-tool

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb b/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb
new file mode 100644
index 0000000..3b780c8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ufs/ufs-tool_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Tool to access UFS device from user space"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PV = "1.3"
+
+BRANCH ?= "dev"
+
+SRCREV = "8b00e33003b57d7071943f63863fcf8cc48d5be9"
+
+SRC_URI = "git://github.com/westerndigitalcorporation/ufs-tool.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/ufs-tool ${D}${bindir}/
+}
-- 
2.7.4



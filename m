Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D067C520E3
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA01620BF4;
	Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ROu1kKALBUbt; Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A32BC20B87;
	Tue, 16 May 2017 02:50:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 252281624C3;
	Mon, 15 May 2017 22:50:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 22:50:38 -0400
Message-Id: <1494903038-55614-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494903038-55614-1-git-send-email-denis@denix.org>
References: <1494903038-55614-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago-armv8: add a generic ARMv8 target for testing
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
X-List-Received-Date: Tue, 16 May 2017 02:50:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/machine/arago-armv8.conf | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/conf/machine/arago-armv8.conf

diff --git a/meta-arago-distro/conf/machine/arago-armv8.conf b/meta-arago-distro/conf/machine/arago-armv8.conf
new file mode 100644
index 0000000..e953985
--- /dev/null
+++ b/meta-arago-distro/conf/machine/arago-armv8.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: Arago unified/fake machine
+#@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARMv7 platforms
+
+include conf/machine/include/arm/arch-armv8.inc
+
+IMAGE_FSTYPES = "tar.xz cpio.xz"
+
+KERNEL_IMAGETYPE = "Image"
+UBOOT_LOADADDRESS = "0"
+
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2  115200;ttyS3 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+#PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+
+MACHINE_FEATURES = ""
+
+RDEPENDS_kernel-base = ""
-- 
2.7.4



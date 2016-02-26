Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 5AFFD52AB5
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 21:09:54 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O36000KJAS1RG90@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Feb 2016 15:09:37 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=VwQbUJbxAAAA:8
	a=m31PO5faV7whu7CbX6YA:9
Received: by 100.15.86.14 with SMTP id 54d2d58e; Fri, 26 Feb 2016 21:09:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9A86B161ED5;	Fri,
	26 Feb 2016 16:09:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Feb 2016 16:09:35 -0500
Message-id: <1456520976-17176-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] timestamping: add timestamping tool to test PTP
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
X-List-Received-Date: Fri, 26 Feb 2016 21:09:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../timestamping/timestamping_4.1.bb               | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb

diff --git a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
new file mode 100644
index 0000000..077b888
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Linux Kernel timestamping"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
+SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+
+S = "${WORKDIR}/linux-${PV}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_compile () {
+	cd ${S}/Documentation/networking/timestamping
+	${CC} -o timestamping timestamping.c
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/Documentation/networking/timestamping/timestamping ${D}${bindir}
+}
-- 
2.2.0



Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1A26152996
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 03:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7DE8209A1;
	Mon, 13 Feb 2017 03:38:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id brc1s_Xu1Xw5; Mon, 13 Feb 2017 03:38:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83BEC2014F;
	Mon, 13 Feb 2017 03:38:09 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8F39F162325;
	Sun, 12 Feb 2017 22:38:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 12 Feb 2017 22:38:08 -0500
Message-Id: <1486957088-78882-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pcitest: add PCI testing app
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
X-List-Received-Date: Mon, 13 Feb 2017 03:38:11 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/pcitest/pcitest_4.9.bb            | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb
new file mode 100644
index 0000000..718dc45
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_4.9.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Linux Kernel PCI test"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+BRANCH = "ti-lsk-linux-4.9.y"
+SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	cd ${S}/tools/pci
+	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
+	install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bindir}
+}
-- 
2.7.4



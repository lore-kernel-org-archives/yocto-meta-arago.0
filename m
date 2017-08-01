Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E0267529D9
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA30A20B21;
	Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1gkBuqdfW98b; Tue,  1 Aug 2017 17:54:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0A3120AF0;
	Tue,  1 Aug 2017 17:54:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0A260162537;
	Tue,  1 Aug 2017 13:54:16 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  1 Aug 2017 13:54:14 -0400
Message-Id: <1501610055-10022-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] sysvinit: add initramfs subpackage with /init symlink for ramdisks
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
X-List-Received-Date: Tue, 01 Aug 2017 17:54:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend

diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
new file mode 100644
index 0000000..6936e37
--- /dev/null
+++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".arago1"
+
+PACKAGES =+ "${PN}-initramfs"
+
+do_install_append() {
+	[ ! -e ${D}/init ] && ln -s ${base_sbindir}/init ${D}/init
+}
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
-- 
2.7.4



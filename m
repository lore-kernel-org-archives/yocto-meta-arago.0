Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 8763452A1C
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 22:16:25 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00J2RKIU1000@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Apr 2016 17:16:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=YT3ay99e0QeVPpk4SAAA:9
	a=GN_-BU0HkDchDwpj:21 a=ZW7MmOZ8H88jWEzG:21
Received: by 100.15.86.14 with SMTP id 5da597e4; Tue, 12 Apr 2016 22:16:07 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8E01D161F9E;	Tue,
	12 Apr 2016 18:16:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Apr 2016 18:16:06 -0400
Message-id: <1460499366-25763-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-server-extra: disable recovery-kernel for now
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
X-List-Received-Date: Tue, 12 Apr 2016 22:16:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

init/do_mounts_initrd.o: In function `return_address': .../git/arch/arm/include/asm/ftrace.h:51: multiple definition of `return_address'
init/do_mounts.o:.../git/arch/arm/include/asm/ftrace.h:51: first defined here

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 3f94c0e..361fce8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -143,6 +143,7 @@ ARAGO_TI_PKGS_append_k2e-evm = "\
     nwal-lld \
     "
 
+#    recovery-kernel
 RDEPENDS_${PN} = "\
     ${ARAGO_LIBNL} \
     ${ARAGO_PERL} \
@@ -175,7 +176,6 @@ RDEPENDS_${PN} = "\
     file \
     libbz2 \
     boost \
-    recovery-kernel \
     k2-initramfs \
     parse-ip \
     "
-- 
2.2.0



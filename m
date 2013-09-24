Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 69ED8529A8
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 05:46:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTM00HFK8110JP3@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 24 Sep 2013 00:46:28 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1875B20011; Tue,
	24 Sep 2013 01:46:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 24 Sep 2013 01:46:09 -0400
Message-id: <1380001570-25248-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] gadget-init: replace RDEPENDS with RRECOMMENDS for recommended modules
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
X-List-Received-Date: Tue, 24 Sep 2013 05:46:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
index 34885c7..477f16a 100644
--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 COMPATIBLE_MACHINE = "ti33x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "file://init"
 
@@ -21,4 +21,4 @@ do_install() {
 }
 
 FILES_${PN} = "${sysconfdir} ${bindir}"
-RDEPENDS_${PN} += "kernel-module-g-ether kernel-module-g-mass-storage"
+RRECOMMENDS_${PN} += "kernel-module-g-ether kernel-module-g-mass-storage"
-- 
1.8.3.2



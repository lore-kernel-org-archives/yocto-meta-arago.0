Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CC31152A93
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 14:54:59 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAREsuKJ007151
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2012 08:54:57 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREsttv012444
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 20:24:55 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 27 Nov 2012 20:24:54 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREsqoM026073;
	Tue, 27 Nov 2012 20:24:53 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Nov 2012 08:54:46 -0600
Message-ID: <1354028089-4919-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] ti-crypto-examples: Add cryptography example C applications
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
X-List-Received-Date: Tue, 27 Nov 2012 14:55:03 -0000
Content-Type: text/plain

* Added recipe to build example C applications that use the
  openssl libraries for cryptographic operations.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
new file mode 100644
index 0000000..a35524f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "TI Cryptography Example Applications"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
+SECTION = "console"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "d3cc223206367a02097c7ad4e997cf2bef975277"
+
+SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    # build the release version
+    oe_runmake release
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
-- 
1.7.0.4



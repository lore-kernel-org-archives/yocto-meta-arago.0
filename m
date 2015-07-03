Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 0F81552A93
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00LP65S65G20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=IJwE5f0TIyDb-50c5NIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 600AA161AF2;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:09 -0400
Message-id: <1435892533-6046-51-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 50/54] external-linaro-toolchain-cross: recipe to stage unwind.h required for target gcc
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain-cross.bb    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
new file mode 100644
index 0000000..d0b5bfe
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+PR = "r0"
+
+inherit cross
+
+do_install() {
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
+}
-- 
2.2.0



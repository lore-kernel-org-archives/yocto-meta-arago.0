Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id BB333529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:22:37 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1321581oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=r3z0AK00+c+/pOksqGZycRz3ywZeffhvRY1slHX9+XQ=;
	b=f0fity8UioXBcm1k5XBLtDqigBFC2uU2ZPC34TC68bMy3NRz2Yea1vCInTWo7Jccv5
	llK/7nGJx7uJtXdZ470b3nm/R+vP3u9fefBaXr12vaL/7tgnsnBwQ9gB8e79wF0KAFS8
	MQsXCgWhBTIZ5mb0l0SYE8OPs835Smx6SXxhMAeWi7SpOtu+fd/FG43e2wmfMeBVCROD
	zop64Ti2FCJ0jkhez+UhsGawmyHD/dos8sUv1CO3UilA1Z/s8YuoITz4aZXL+7htPrAh
	JQYfsMZ9Z1wYJ7r4RkQm/u40n5yRR0bBxHlCC8zTCQrBQ9clTWhEheuG2QO44Cs7Rk8/
	I6OA==
Received: by 10.60.4.67 with SMTP id i3mr6543765oei.38.1349418157147;
	Thu, 04 Oct 2012 23:22:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k7sm6799440oek.6.2012.10.04.23.22.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:22:36 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:50:58 -0500
Message-Id: <1349419858-21729-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] ltp-ddt: Add Arago tweaks
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
X-List-Received-Date: Fri, 05 Oct 2012 06:22:37 -0000

* Port tweaks from Arago
* AUTOREV the recipe to get the latest changes.
* Compile test kernel modules.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
new file mode 100644
index 0000000..65a16f9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -0,0 +1,32 @@
+PR_append = "-arago0+gitr${SRCPV}"
+
+# Auto rev so we pick up the latest changes
+SRCREV = "${AUTOREV}"
+
+do_compile_kmodules() {
+        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+        oe_runmake modules
+}
+
+addtask compile_kmodules after do_compile before do_install
+
+# Grab a portion of the module.bbclass to provide the needed kernel application
+# scripts/basic/fixdep. This issue is discussed in the following thread.
+# http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005536.html
+
+inherit module-base
+
+#
+# Ensure the hostprogs are available for module compilation. Modules that
+# inherit this recipe and override do_compile() should be sure to call
+# do_make_scripts() or ensure the scripts are built independently.
+#
+do_make_scripts() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} scripts
+}
+
+addtask make_scripts before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[deptask] = "do_populate_sysroot"
-- 
1.7.0.4



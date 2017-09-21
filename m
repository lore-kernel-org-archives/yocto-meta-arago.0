Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5DB95529AF
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 19:05:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LJ5NtD026624
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 14:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506020723;
	bh=9h7jgce4h8gTaldEpqEzc06j7Oj4a2hxySDUifSfuUU=;
	h=From:To:CC:Subject:Date;
	b=DHJ6iBobZ0PVjKKbwKX6lyY1aLeXQcVPQu5q6Np8ChCCrbG1ADg4FunJo1yf7vMy1
	gGJPzZTZbfmB8DfMdRHjoIOBruvHSVeghTpZH9IAXYtrk2sGe8RerdkSnpV4pLoyAo
	edeYnW9MkSHPWpDuke1djN9RfeHZfTZn5ihN8etg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LJ5Ntr016656
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 14:05:23 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 14:05:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 14:05:22 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LJ5MtX016967;
	Thu, 21 Sep 2017 14:05:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Sep 2017 14:57:45 -0400
Message-ID: <1506020265-19414-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: spatton@ti.com, Michael Erdahl <m-erdahl@ti.com>
Subject: [meta-processor-sdk][PATCH] mstpd: add support for Multiple Spanning Tree Protocol Daemon
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
X-List-Received-Date: Thu, 21 Sep 2017 19:05:23 -0000
Content-Type: text/plain

From: Michael Erdahl <m-erdahl@ti.com>

Project repo: https://github.com/mstpd/mstpd

Signed-off-by: Michael Erdahl <m-erdahl@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Michael,

Here is my refactoring of your patches for meta-processor-sdk. Let me know if you see any problems.


 .../packagegroups/packagegroup-arago-test.bbappend |  5 +++
 recipes-support/mstpctl/mstpd_git.bb               | 39 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-test.bbappend
 create mode 100644 recipes-support/mstpctl/mstpd_git.bb

diff --git a/recipes-core/packagegroups/packagegroup-arago-test.bbappend b/recipes-core/packagegroups/packagegroup-arago-test.bbappend
new file mode 100644
index 0000000..4cb58db
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-test.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+ARAGO_TEST_append_ti33x = " mstpd"
+ARAGO_TEST_append_ti43x = " mstpd"
+ARAGO_TEST_append_omap-a15 = " mstpd"
diff --git a/recipes-support/mstpctl/mstpd_git.bb b/recipes-support/mstpctl/mstpd_git.bb
new file mode 100644
index 0000000..abe2ca9
--- /dev/null
+++ b/recipes-support/mstpctl/mstpd_git.bb
@@ -0,0 +1,39 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to be fully functional.
+# (Feel free to remove these comments when editing.)
+SUMMARY = "Multiple Spanning Tree Protocol Daemon"
+
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
+# your responsibility to verify that the values are complete and correct.
+#
+# NOTE: multiple licenses have been detected; if that is correct you should separate
+# these in the LICENSE value using & if the multiple licenses all apply, or | if there
+# is a choice between the multiple licenses. If in doubt, check the accompanying
+# documentation to determine which situation is applicable.
+#
+# The following license files were not able to be identified and are
+# represented as "Unknown" below, you will need to check them yourself:
+#   debian/copyright
+#
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
+                    file://debian/copyright;md5=332234a99007d25da40f41ee96aa388f"
+
+SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https"
+
+# Modify these as desired
+PV = "0.0.5+git${SRCPV}"
+SRCREV = "3dbd68c11dfed6c8f6f2423f429d3b4a2acc27f8"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "python"
+RDEPENDS_${PN} = "python-core"
+
+# NOTE: if this software is not capable of being built in a separate build directory
+# from the source, you should replace autotools with autotools-brokensep in the
+# inherit line
+inherit autotools
+
+# Specify any options you want to pass to the configure script using EXTRA_OECONF:
+EXTRA_OECONF = "--sbindir=/sbin"
-- 
2.7.4



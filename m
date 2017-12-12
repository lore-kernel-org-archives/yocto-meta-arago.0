Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8141F52093
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 00:13:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBC0Dnwo019093
	for <meta-arago@arago-project.org>; Mon, 11 Dec 2017 18:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513037629;
	bh=Va2fM6KghFEKcNJ2KD93tjFOVEE4FjMzIJVOsJWQSpo=;
	h=From:To:CC:Subject:Date;
	b=O6owaV2A1dQzuToJ5E6s1LED8hRFiA1xNdlWaKC16lu0p4VzCsI51DOUushJxFHxr
	IcHMcpLtXc49Y6KQnJBbpXWQKND/jhfcu/4f0N48yVpVk1TUC2f8jTJRfscwmjL1TE
	UX7t+BqmUCiAfguXqUrj6eGxQ6bKLNFaYwkjpw2w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBC0Dnew005661
	for <meta-arago@arago-project.org>; Mon, 11 Dec 2017 18:13:49 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 11 Dec 2017 18:13:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 11 Dec 2017 18:13:49 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBC0Dneq019263;
	Mon, 11 Dec 2017 18:13:49 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Dec 2017 19:13:42 -0500
Message-ID: <1513037623-6080-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 1/2] packagegroup-*-qte*: add QtWebKit and remove QtWenEngine for non-sgx build
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
X-List-Received-Date: Tue, 12 Dec 2017 00:13:51 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-qte-toolchain-target.bbappend             | 9 +++++++++
 recipes-core/packagegroups/packagegroup-arago-qte.bbappend       | 9 +++++++++
 recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend | 9 +++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-qte.bbappend
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend

diff --git a/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
new file mode 100644
index 0000000..691916d
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
@@ -0,0 +1,9 @@
+PR_append = ".tisdk0"
+
+QT5_DEV_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
+"
+
+QT5_DEV_append = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
new file mode 100644
index 0000000..ac545ec
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
@@ -0,0 +1,9 @@
+PR_append = ".tisdk0"
+
+QT5_ESSENTIALS_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-qmlplugins', d)} \
+"
+
+QT5_ESSENTIALS_append = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-qmlplugins qtquick1-plugins qtquick1-qmlplugins', d)} \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
new file mode 100644
index 0000000..6fa1035
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
@@ -0,0 +1,9 @@
+PR_append = ".tisdk0"
+
+QT5_DEMOS_remove = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
+"
+
+QT5_DEMOS_append = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtquick1-examples qtwebkit-examples-examples', d)} \
+"
-- 
1.9.1



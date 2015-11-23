Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E50EB52A42
	for <meta-arago@arago-project.org>;
	Mon, 23 Nov 2015 17:40:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANHehfM004207
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:43 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHehBG001517
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 11:40:43 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHegZI006663;
	Mon, 23 Nov 2015 11:40:42 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a0v6Y-0005JE-JU; Mon, 23 Nov 2015 12:40:42 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Nov 2015 12:40:34 -0500
Message-ID: <1448300436-20360-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
References: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] meta-toolchain-arago-tisdk: Split common content into inc file
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
X-List-Received-Date: Mon, 23 Nov 2015 17:40:48 -0000
Content-Type: text/plain

* Use inc file so that all tisdk devkits provide a common environment

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-tisdk.bb              | 9 ++-------
 .../recipes-core/meta/meta-toolchain-arago-tisdk.inc             | 8 ++++++++
 2 files changed, 10 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 6768ac8..4f272a5 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -1,11 +1,6 @@
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-toolchain-tisdk-target"
 TOOLCHAIN_SUFFIX ?= "-tisdk"
-TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev coreutils"
 
+require meta-toolchain-arago-tisdk.inc
 require recipes-core/meta/meta-toolchain-arago-qte.bb
 
-PR = "r4"
-
-toolchain_create_sdk_env_script_append() {
-    echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
-}
+PR = "${INC_PR}.0"
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
new file mode 100644
index 0000000..be89fea
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
@@ -0,0 +1,8 @@
+TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-toolchain-tisdk-target"
+TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev coreutils"
+
+INC_PR = "r5"
+
+toolchain_create_sdk_env_script_append() {
+    echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
+}
-- 
1.9.1



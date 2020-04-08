Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 98CBB52A52
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2286A40C34;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fd6cL6Jrjo7k; Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07C0440C31;
	Wed,  8 Apr 2020 00:45:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B97B9171900;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:43 -0400
Message-Id: <1586306702-7953-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 05/24] big-data-ipc-demo-linux: require dsp machine feature
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 3 +--
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb     | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 50c24ae..bc2d121 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -144,8 +144,7 @@ EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
 EXTRA_PACKAGES_append_omap-a15 = " \
-    big-data-ipc-demo-linux \
-    big-data-ipc-demo-linux-firmware \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-linux big-data-ipc-demo-linux-firmware','',d)} \
 "
 
 # acontis-atemsys
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
index 858dc2d..a75b4aa 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
@@ -3,6 +3,10 @@ SUMMARY = "TI Big data IPC: Host linux examples"
 require recipes-ti/includes/ti-paths.inc
 require big-data-ipc-demo.inc
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+
 DEPENDS = "ti-ipc \
            ti-xdctools-native \
            ti-sysbios \
-- 
2.7.4



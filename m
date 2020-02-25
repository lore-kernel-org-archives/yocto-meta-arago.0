Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A261252994
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 04:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54DE740C2E;
	Tue, 25 Feb 2020 04:44:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u8zBPVCDGzPX; Tue, 25 Feb 2020 04:44:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C6DE40A46;
	Tue, 25 Feb 2020 04:44:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 030F51738D4;
	Mon, 24 Feb 2020 23:44:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Feb 2020 23:44:30 -0500
Message-Id: <1582605871-34892-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582605871-34892-1-git-send-email-denis@denix.org>
References: <1582605871-34892-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH v2 2/3] packagegroup-*-gtk*: cleanup
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
X-List-Received-Date: Tue, 25 Feb 2020 04:46:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-gtk-sdk-target.bb           |  8 ++++++--
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb        | 16 ++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index 24db604..d1783d1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -1,8 +1,12 @@
 DESCRIPTION = "Task to install Gtk dev packages in SDK"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
-inherit packagegroup
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup machine_features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 RDEPENDS_${PN} = "\
     gtk+3-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index d6b9326..4baba84 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -1,18 +1,14 @@
 DESCRIPTION = "Task to add Gtk embedded related packages"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
-inherit packagegroup
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GTK = "\
-    gtk+3 \
-"
+inherit packagegroup machine_features_check
 
-GTK_DEMOS = "\
-    gtk+3-demo \
-"
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 RDEPENDS_${PN} = "\
-    ${GTK} \
-    ${GTK_DEMOS} \
+    gtk+3 \
+    gtk+3-demo \
 "
-- 
2.7.4



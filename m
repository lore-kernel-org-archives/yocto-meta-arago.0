Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C8C18529A6
	for <meta-arago@arago-project.org>;
	Tue, 22 Jan 2019 21:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 706B340BD5;
	Tue, 22 Jan 2019 21:19:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id svPhpku_Oadq; Tue, 22 Jan 2019 21:19:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2092D40BCB;
	Tue, 22 Jan 2019 21:19:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 69C36169B0E;
	Tue, 22 Jan 2019 16:19:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 16:19:15 -0500
Message-Id: <1548191956-2527-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548191956-2527-1-git-send-email-denis@denix.org>
References: <1548191956-2527-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/3] packagegroups: disable armnn for now due to gcc8 breakage
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
X-List-Received-Date: Tue, 22 Jan 2019 21:19:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb  | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb             | 9 +++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 77ddbe1..062f5c5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -153,7 +153,8 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
-ARMNN_PACKAGES = "armnn-dev"
+ARMNN_PACKAGES = ""
+#ARMNN_PACKAGES = "armnn-dev"
 
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 11e41f7..b3a5c09 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -144,7 +144,8 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = "armnn"
+ARMNN_PACKAGES = ""
+#ARMNN_PACKAGES = "armnn"
 
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 530f70c..101fb0b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -86,10 +86,11 @@ MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-simplepeopletracking \
 "
 
-MATRIX_ARMNN_APPS = " \
-    matrix-armnn-demo-staticimg     \
-    matrix-armnn-demo-livecam       \
-"
+MATRIX_ARMNN_APPS = ""
+#MATRIX_ARMNN_APPS = " \
+#    matrix-armnn-demo-staticimg     \
+#    matrix-armnn-demo-livecam       \
+#"
 
 MATRIX_APPS = ""
 
-- 
2.7.4



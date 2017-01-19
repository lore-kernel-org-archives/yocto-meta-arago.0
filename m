Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 29B0252094
	for <meta-arago@arago-project.org>;
	Thu, 19 Jan 2017 00:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C214A20B65;
	Thu, 19 Jan 2017 00:55:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m3xVFuEe9IYd; Thu, 19 Jan 2017 00:55:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98A4B20A37;
	Thu, 19 Jan 2017 00:55:47 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id B555216231C;
	Wed, 18 Jan 2017 19:55:46 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 18 Jan 2017 19:55:46 -0500
Message-Id: <1484787346-28451-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] README, layer.conf: update for master and list dependencies
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
X-List-Received-Date: Thu, 19 Jan 2017 00:55:49 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README          | 17 +++++++++++++----
 meta-arago-distro/conf/layer.conf | 14 ++++++++++++++
 meta-arago-extras/README          | 10 +++++++---
 meta-arago-extras/conf/layer.conf | 10 ++++++++++
 4 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index d07d989..03157ae 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,6 +1,6 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 2.1+) and tracks
+This layer works with the latest Yocto Project release (currently 2.2+) and tracks
 the stable/maintenance branches (currently "master") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
@@ -11,16 +11,25 @@ layers: meta
 URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
-layers: meta-oe, toolchain-layer, meta-networking
+layers: meta-oe, meta-networking, meta-python
 
-URI: git://arago-project.org/git/meta-ti
+URI: git://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
 
+URI: https://github.com/meta-qt5/meta-qt5
+branch: master
+revision: HEAD
+
+URI: git://arago-project.org/git/meta-arago
+branch: master
+revision: HEAD
+layers: meta-arago-extras
+
 URI: git://git.linaro.org/openembedded/meta-linaro
 branch: master
 revision: HEAD
-layers: meta-linaro-toolchain
+layers: meta-linaro-toolchain, meta-optee
 
 Send pull requests to meta-arago@arago-project.org
 
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index f4e2a17..c86a41a 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,6 +8,20 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
+LAYERDEPENDS_meta-arago-distro = " \
+    core \
+    meta-ti \
+    openembedded-layer \
+    networking-layer \
+    meta-python \
+    linaro-toolchain \
+    meta-optee \
+    qt5-layer \
+    meta-arago-extras \
+"
+
+BB_DANGLINGAPPENDS_WARNONLY = "true"
+
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     weston-init->weston \
     weston-init->kbd \
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index fb97d4b..62416cd 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,6 +1,6 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 2.1+) and tracks
+This layer works with the latest Yocto Project release (currently 2.2+) and tracks
 the stable/maintenance branches (currently "master") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
@@ -11,9 +11,13 @@ layers: meta
 URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
-layers: meta-oe, toolchain-layers, meta-networking
+layers: meta-oe, meta-networking, meta-python
 
-URI: git://arago-project.org/git/meta-ti
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+
+URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
 
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 605d083..83ac107 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -13,6 +13,16 @@ ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
+LAYERDEPENDS_meta-arago-extras = " \
+    core \
+    meta-ti \
+    openembedded-layer \
+    networking-layer \
+    meta-python \
+    linaro-toolchain \
+    qt5-layer \
+"
+
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-multimedia-demos->amsdk-av-files \
     matrix-gui-oprofile-demos->oprofile \
-- 
2.7.4



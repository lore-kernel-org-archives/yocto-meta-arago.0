Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 10B175299C
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41B6A40BFF
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:15:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bgDHUY71-OG0 for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:15:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 359FC400CF
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:15:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EC43717454E;
	Tue, 23 Mar 2021 17:15:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 23 Mar 2021 17:15:50 -0400
Message-Id: <1616534150-46517-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] configs/arago-dunfell: more detailed template for enabling chromium
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
X-List-Received-Date: Tue, 23 Mar 2021 21:15:38 -0000

Disabled (commented out) by default.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 configs/arago-dunfell-config.txt                  |  6 +++++-
 configs/arago-dunfell-next-config.txt             |  6 +++++-
 sample-files/bblayers-dunfell-browser.conf.sample | 12 ++++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 sample-files/bblayers-dunfell-browser.conf.sample

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index b45ee3e..173499b 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -3,7 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
@@ -11,4 +12,7 @@ meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
+# use below for OECORELAYERCONF to mark it compatible with dunfell
+#OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 8d629c4..9f5eeb9 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -3,7 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
@@ -11,4 +12,7 @@ meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
+# use below for OECORELAYERCONF to mark it compatible with dunfell
+#OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/sample-files/bblayers-dunfell-browser.conf.sample b/sample-files/bblayers-dunfell-browser.conf.sample
new file mode 100644
index 0000000..1e525d5
--- /dev/null
+++ b/sample-files/bblayers-dunfell-browser.conf.sample
@@ -0,0 +1,12 @@
+# This template file was created by taking the oe-core/meta/conf/bblayers.conf
+# file and removing the BBLAYERS section at the end.
+
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "6"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+OVERRIDES = "forcevariable"
+LAYERSERIES_COMPAT_browser-layer_forcevariable = "dunfell"
-- 
2.7.4



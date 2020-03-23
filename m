Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 34518529EE
	for <meta-arago@arago-project.org>;
	Mon, 23 Mar 2020 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E627840C4E;
	Mon, 23 Mar 2020 19:33:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JGQD6O-ZmULp; Mon, 23 Mar 2020 19:33:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49F0D40C48;
	Mon, 23 Mar 2020 19:33:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E1BE616D8D2;
	Mon, 23 Mar 2020 15:33:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Mar 2020 15:33:50 -0400
Message-Id: <1584992030-8173-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] configs: enable overriding meta-browser compatibility with zeus
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
X-List-Received-Date: Mon, 23 Mar 2020 19:36:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-master-config.txt                |  4 ++--
 configs/arago-zeus-config.txt                  |  4 ++--
 configs/arago-zeus-next-config.txt             |  4 ++--
 sample-files/bblayers-zeus-browser.conf.sample | 12 ++++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 sample-files/bblayers-zeus-browser.conf.sample

diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index c0c1d0c..8aed789 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-selinux,git://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
@@ -11,5 +11,5 @@ meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layer
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-zeus-config.txt b/configs/arago-zeus-config.txt
index 8f6e2ec..d33b277 100644
--- a/configs/arago-zeus-config.txt
+++ b/configs/arago-zeus-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,zeus,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
 meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,zeus,HEAD,layers=
@@ -11,5 +11,5 @@ meta-openembedded,git://git.openembedded.org/meta-openembedded,zeus,HEAD,layers=
 meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,zeus,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-zeus-next-config.txt b/configs/arago-zeus-next-config.txt
index 8797f13..5377781 100644
--- a/configs/arago-zeus-next-config.txt
+++ b/configs/arago-zeus-next-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,zeus-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
 meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,zeus,HEAD,layers=
@@ -11,5 +11,5 @@ meta-openembedded,git://git.openembedded.org/meta-openembedded,zeus,HEAD,layers=
 meta-ti,git://git.yoctoproject.org/meta-ti,zeus-next,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,zeus,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/sample-files/bblayers-zeus-browser.conf.sample b/sample-files/bblayers-zeus-browser.conf.sample
new file mode 100644
index 0000000..bb83fac
--- /dev/null
+++ b/sample-files/bblayers-zeus-browser.conf.sample
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
+LAYERSERIES_COMPAT_browser-layer_forcevariable = "zeus"
-- 
2.7.4



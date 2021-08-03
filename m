Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B8BEF529F0
	for <meta-arago@arago-project.org>;
	Tue,  3 Aug 2021 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF59E40C8E;
	Tue,  3 Aug 2021 19:42:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ram1ZlwmyNlg; Tue,  3 Aug 2021 19:42:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CFCDA40BE8;
	Tue,  3 Aug 2021 19:42:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 18E6617464D;
	Tue,  3 Aug 2021 15:42:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  3 Aug 2021 15:42:17 -0400
Message-Id: <1628019737-50909-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [oe-layersetup][PATCH] configs, local.conf: update to version 2 due to new override syntax
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
X-List-Received-Date: Tue, 03 Aug 2021 19:42:10 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Also image-mklibs class has been deprecated, so remove it from local.conf

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 configs/arago-master-config.txt                                      | 2 +-
 configs/distroless-master-config.txt                                 | 2 +-
 configs/poky-master-config.txt                                       | 2 +-
 .../{local-arago64.conf.sample => local-arago64-v2.conf.sample}      | 5 ++---
 sample-files/{local-poky.conf.sample => local-poky-v2.conf.sample}   | 5 ++---
 sample-files/{local.conf.sample => local-v2.conf.sample}             | 5 ++---
 6 files changed, 9 insertions(+), 12 deletions(-)
 copy sample-files/{local-arago64.conf.sample => local-arago64-v2.conf.sample} (97%)
 copy sample-files/{local-poky.conf.sample => local-poky-v2.conf.sample} (97%)
 copy sample-files/{local.conf.sample => local-v2.conf.sample} (97%)

diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 0788679..e4c6d7f 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -11,4 +11,4 @@ meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index c8c400c..8211bd5 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -5,4 +5,4 @@ meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local.conf.sample
+OECORELOCALCONF=./sample-files/local-v2.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index 1dc261f..f213411 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -5,4 +5,4 @@ poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yoct
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-poky.conf.sample
+OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64-v2.conf.sample
similarity index 97%
copy from sample-files/local-arago64.conf.sample
copy to sample-files/local-arago64-v2.conf.sample
index 68f0bff..9549e8a 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64-v2.conf.sample
@@ -1,5 +1,5 @@
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
-CONF_VERSION = "1"
+CONF_VERSION = "2"
 
 #
 # Where to place downloads
@@ -112,12 +112,11 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable 
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-prelink"
 
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky-v2.conf.sample
similarity index 97%
copy from sample-files/local-poky.conf.sample
copy to sample-files/local-poky-v2.conf.sample
index ba5d4c1..5cbe6ef 100644
--- a/sample-files/local-poky.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -1,5 +1,5 @@
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
-CONF_VERSION = "1"
+CONF_VERSION = "2"
 
 #
 # Where to place downloads
@@ -109,12 +109,11 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable 
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-prelink"
 
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
diff --git a/sample-files/local.conf.sample b/sample-files/local-v2.conf.sample
similarity index 97%
copy from sample-files/local.conf.sample
copy to sample-files/local-v2.conf.sample
index e60bedc..e0df8f5 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local-v2.conf.sample
@@ -1,5 +1,5 @@
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
-CONF_VERSION = "1"
+CONF_VERSION = "2"
 
 #
 # Where to place downloads
@@ -109,12 +109,11 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable 
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-prelink"
 
 # By default disable interactive patch resolution (tasks will just fail instead):
 PATCHRESOLVE = "noop"
-- 
2.7.4



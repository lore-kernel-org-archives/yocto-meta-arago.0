Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1527B529A8
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2020 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A100440C26;
	Mon,  4 May 2020 22:15:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Za1bBgcgGfSV; Mon,  4 May 2020 22:15:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8756540AF3;
	Mon,  4 May 2020 22:15:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DAF0E16EC83;
	Mon,  4 May 2020 18:15:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  4 May 2020 18:15:07 -0400
Message-Id: <1588630507-55181-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] local-arago*.conf: restore custom parallel settings, DEPLOY_DIR
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
X-List-Received-Date: Mon, 04 May 2020 22:17:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

1. Unfortunately, even with memory-limiting changes in upstream, our build
   VMs sometimes can trigger OOM killer - go back to limiting threads.
2. There was no need to separate TMPDIR for now, so while the support is
   there, do not enable it by default

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/local-arago.conf.sample   | 10 +++++-----
 sample-files/local-arago64.conf.sample | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index 7c7a336..96dfaf9 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -49,7 +49,9 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
 TMPDIR = "${TOPDIR}/arago-tmp"
-DEPLOY_DIR = "${TOPDIR}/deploy"
+
+# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside
+#DEPLOY_DIR = "${TOPDIR}/deploy"
 
 #
 # Machine Selection
@@ -136,17 +138,15 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-#BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS = "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-#PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE = "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
-# These options don't need to be set manually, as OE will determine them automatically,
-# unless need to override that default.
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
index 1e21185..f48db77 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -49,7 +49,9 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
 TMPDIR = "${TOPDIR}/arago-tmp"
-DEPLOY_DIR = "${TOPDIR}/deploy"
+
+# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside
+#DEPLOY_DIR = "${TOPDIR}/deploy"
 
 #
 # Machine Selection
@@ -136,17 +138,15 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-#BB_NUMBER_THREADS = "1"
+BB_NUMBER_THREADS = "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-#PARALLEL_MAKE = "-j 1"
+PARALLEL_MAKE = "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
-# These options don't need to be set manually, as OE will determine them automatically,
-# unless need to override that default.
 
 DISTRO   = "arago"
 
-- 
2.7.4



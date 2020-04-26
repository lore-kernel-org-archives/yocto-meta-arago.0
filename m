Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E06FE52A3F
	for <meta-arago@arago-project.org>;
	Sun, 26 Apr 2020 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D066F40BAC;
	Sun, 26 Apr 2020 21:01:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jCTVtXgW-5Vh; Sun, 26 Apr 2020 21:01:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B388740A9E;
	Sun, 26 Apr 2020 21:01:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EC83A16E247;
	Sun, 26 Apr 2020 17:01:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Apr 2020 17:01:14 -0400
Message-Id: <1587934874-44923-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] local-arago*.conf: set DEPLOY_DIR explicitly, deprecate custom parallel settings
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
X-List-Received-Date: Sun, 26 Apr 2020 21:03:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/local-arago.conf.sample   | 9 ++++++---
 sample-files/local-arago64.conf.sample | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index ea37da9..7c7a336 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -48,7 +48,8 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/arago-tmp"
+TMPDIR = "${TOPDIR}/arago-tmp"
+DEPLOY_DIR = "${TOPDIR}/deploy"
 
 #
 # Machine Selection
@@ -135,15 +136,17 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+#BB_NUMBER_THREADS = "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+#PARALLEL_MAKE = "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+# These options don't need to be set manually, as OE will determine them automatically,
+# unless need to override that default.
 
 DISTRO   = "arago"
 
diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
index e5113fe..1e21185 100644
--- a/sample-files/local-arago64.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -48,7 +48,8 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/arago-tmp"
+TMPDIR = "${TOPDIR}/arago-tmp"
+DEPLOY_DIR = "${TOPDIR}/deploy"
 
 #
 # Machine Selection
@@ -135,15 +136,17 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
 # These two options control how much parallelism BitBake should use. The first 
 # option determines how many tasks bitbake should run in parallel:
 #
-BB_NUMBER_THREADS = "1"
+#BB_NUMBER_THREADS = "1"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-PARALLEL_MAKE = "-j 1"
+#PARALLEL_MAKE = "-j 1"
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example
+# These options don't need to be set manually, as OE will determine them automatically,
+# unless need to override that default.
 
 DISTRO   = "arago"
 
-- 
2.7.4



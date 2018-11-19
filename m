Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2E1B15297E
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 19:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB5DB40AE0;
	Mon, 19 Nov 2018 19:21:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sTEtX65acphB; Mon, 19 Nov 2018 19:21:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF88940A58;
	Mon, 19 Nov 2018 19:21:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B4C94164CC2;
	Mon, 19 Nov 2018 14:21:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Nov 2018 14:21:01 -0500
Message-Id: <1542655261-45996-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] local.conf, local-poky.conf: unset ENABLE_BINARY_LOCALE_GENERATION = "0"
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
X-List-Received-Date: Mon, 19 Nov 2018 19:21:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

It is currently results in error in master/thud due to postinst code refactoring:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13028

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/local-poky.conf.sample | 2 +-
 sample-files/local.conf.sample      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky.conf.sample
index af324df..34b6b10 100644
--- a/sample-files/local-poky.conf.sample
+++ b/sample-files/local-poky.conf.sample
@@ -120,7 +120,7 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 PATCHRESOLVE = "noop"
 
 # Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
+#ENABLE_BINARY_LOCALE_GENERATION = "0"
 
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
index 9c732f6..d971b97 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local.conf.sample
@@ -120,7 +120,7 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 PATCHRESOLVE = "noop"
 
 # Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
-ENABLE_BINARY_LOCALE_GENERATION = "0"
+#ENABLE_BINARY_LOCALE_GENERATION = "0"
 
 # By default the machine configuration file sets the IMAGE_FSTYPES.  But if you
 # would like to add additional file system types you can uncomment the
-- 
2.7.4



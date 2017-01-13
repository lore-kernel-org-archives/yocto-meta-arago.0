Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6B42652A93
	for <meta-arago@arago-project.org>;
	Fri, 13 Jan 2017 21:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 29F7620AAE;
	Fri, 13 Jan 2017 21:31:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KucJSR61WVW4; Fri, 13 Jan 2017 21:31:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E5C232078F;
	Fri, 13 Jan 2017 21:31:23 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 1A77F16231E;
	Fri, 13 Jan 2017 16:31:23 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 13 Jan 2017 16:30:54 -0500
Message-Id: <1484343054-16397-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: charlsie@ti.com, j-manbeck2@ti.com, dkay@ti.com
Subject: [PATCH] openssl, openssh, dropbear: remove TSU notice from crypto packages
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
X-List-Received-Date: Fri, 13 Jan 2017 21:31:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/openssh/openssh_%.bbappend        | 13 -------------
 .../recipes-connectivity/openssl/openssl_1.0.2h.bbappend   | 10 ----------
 .../recipes-core/dropbear/dropbear_%.bbappend              | 14 --------------
 3 files changed, 37 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
deleted file mode 100644
index 597d6da..0000000
--- a/meta-arago-distro/recipes-connectivity/openssh/openssh_%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-######################### TSU EXEMPTION REQUIRED ###############################
-################################################################################
-# This package requires TSU exemption. Any update to the version of openssh being
-# appended must be double checked to see if a new TSU exemption must be made.
-#
-# Versions of openssh that are TSU Exempted:
-# openssh-5.6p1
-# openssh-5.9p1
-# openssh-6.1p1
-# openssh-6.2p2
-
-PR_append = ".arago0"
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend
index 96d6263..e74bcba 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend
@@ -1,13 +1,3 @@
-################################################################################
-######################### TSU EXEMPTION REQUIRED ###############################
-################################################################################
-# Versions of openssl that are TSU Exempted:
-# openssl-1.0.0a
-# openssl-1.0.0d
-#
-# This package requires TSU exemption. Any update to the version of openssl being
-# appended must be double checked to see if a new TSU exemption must be made.
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago0"
diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
deleted file mode 100644
index e8ffa4a..0000000
--- a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-######################### TSU EXEMPTION REQUIRED ###############################
-################################################################################
-# Versions of dropbear that are TSU Exempted:
-# dropbear-0.51
-# dropbear-2012.55
-# dropbear-2013.58
-# dropbear-2014.63
-# dropbear-2015.71
-#
-# This package requires TSU exemption. Any update to the version of dropbear being
-# appended must be double checked to see if a new TSU exemption must be made.
-
-PR_append = ".arago1"
-- 
2.7.4



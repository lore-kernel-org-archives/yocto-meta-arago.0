Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3323C52994
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2020 01:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E91740BFD;
	Thu, 27 Feb 2020 01:47:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2aE_2bzeWy9L; Thu, 27 Feb 2020 01:47:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56DA540A13;
	Thu, 27 Feb 2020 01:47:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DB3E6172FDE;
	Wed, 26 Feb 2020 20:47:12 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 26 Feb 2020 20:47:12 -0500
Message-Id: <1582768032-22495-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] can-utils: drop deprecated bbappends
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
X-List-Received-Date: Thu, 27 Feb 2020 01:49:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-extended/socketcan/can-utils_git.bbappend             | 3 ---
 .../recipes-extended/socketcan/canutils_4.0.6.bbappend            | 8 --------
 2 files changed, 11 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend

diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
deleted file mode 100644
index c0e6666..0000000
--- a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
-
-PR_append = ".arago0"
diff --git a/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend b/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
deleted file mode 100644
index ae2c32f..0000000
--- a/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# Take the top of the tree which is currenlty 4.0.6 plus two patches.
-# One of the patches adds error message support which is what we want
-TAG = "bab595e38295dcafcfc17a011d3d51f2df1618e6"
-
-# Set the PV to 4.0.6 plus the commit id
-PV = "4.0.6+gitr${SRCPV}"
-
-PR_append = ".arago0"
-- 
2.7.4



Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B3637529E2
	for <meta-arago@arago-project.org>;
	Wed,  2 Dec 2015 18:37:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB2IaxPa021063
	for <meta-arago@arago-project.org>; Wed, 2 Dec 2015 12:36:59 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB2IaxDn016848
	for <meta-arago@arago-project.org>; Wed, 2 Dec 2015 12:36:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Dec 2015 12:36:58 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB2Iawu5019831;
	Wed, 2 Dec 2015 12:36:58 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a4CGv-0000tn-Tl; Wed, 02 Dec 2015 13:36:57 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Dec 2015 13:36:56 -0500
Message-ID: <1449081416-3421-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Revert "HACK: dspdce-fw: Add ipumm-fw to DEPENDS"
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
X-List-Received-Date: Wed, 02 Dec 2015 18:37:01 -0000
Content-Type: text/plain

* The root issue has been resolved in upstream sources

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-bsp/dspdce-fw/dspdce-fw_git.bbappend | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/dspdce-fw/dspdce-fw_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/dspdce-fw/dspdce-fw_git.bbappend b/meta-arago-distro/recipes-bsp/dspdce-fw/dspdce-fw_git.bbappend
deleted file mode 100644
index 77a7b03..0000000
--- a/meta-arago-distro/recipes-bsp/dspdce-fw/dspdce-fw_git.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR_append = "-arago0"
-
-# This is a crude workaround to prevent dspdce and ipumm from
-# attempting to concurrently rebuild common packages (such as
-# fc and ce) in the sysroot.
-DEPENDS_append = " \
-    ipumm-fw \
-"
-- 
1.9.1



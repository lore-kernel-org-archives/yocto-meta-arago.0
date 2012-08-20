Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E5E9052960
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2012 15:53:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7KFrKw2013864
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2012 10:53:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7KFrKs1032074
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2012 10:53:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 20 Aug 2012 10:53:20 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7KFrKNI004216;	Mon, 20 Aug 2012 10:53:20 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T3UT6-0001i6-MN; Mon, 20 Aug 2012 11:04:44 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Aug 2012 11:04:43 -0500
Message-ID: <1345478683-6539-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] php: Add libiconv as a dependency. (Temporary)
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
X-List-Received-Date: Mon, 20 Aug 2012 15:53:23 -0000
Content-Type: text/plain

* Adding libiconv as a dependency since external-linaro-toolchain.bb who
  PROVIDES virtual/libiconv isn't providing the needed files for PHP.
* Configuring PHP fails with
  /home/<user>/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux/bin/../
  lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld:
  cannot find -liconv collect2: ld returned 1 exit status
* This should be a temporary fix until a proper fix is made in the toolchain.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/php/php_5.3.6.bbappend        |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
index 0d16ebe..e30664d 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
@@ -4,3 +4,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PR_append = "-arago0"
 
 SRC_URI += "file://0001-php-native-Fix-host-contamination-issue.patch"
+
+DEPENDS += "libiconv"
-- 
1.7.0.4



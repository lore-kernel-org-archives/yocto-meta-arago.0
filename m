Return-Path: <a0862859@udb0862859>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D9B5752A79
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 10:52:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4AAqgEP015564
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 05:52:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4AAqcBe002456
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 05:52:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 10 May 2013 05:47:28 -0500
Received: from udb0862859 (udb0862859.am.dhcp.ti.com [10.218.112.220])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4AAlSFq022370;
	Fri, 10 May 2013 05:47:28 -0500
Received: from a0862859 by udb0862859 with local (Exim 4.76)	(envelope-from
	<a0862859@udb0862859>)	id 1UakrI-0002Dn-Bz;
	Fri, 10 May 2013 06:47:28 -0400
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2013 06:47:25 -0400
Message-ID: <1368182845-8507-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Add recipe for test images
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
X-List-Received-Date: Fri, 10 May 2013 10:52:43 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/images/arago-test-image.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
index f220127..ff4cd26 100644
--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -3,7 +3,7 @@
 
 require arago-image.inc
 
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|keystone-evm"
+COMPATIBLE_MACHINE = "(?!arago)"
 
 # The size of the uncompressed ramdisk is 32MB
 ROOTFS_SIZE = "32768"
-- 
1.7.9.5



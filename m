Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id D896B52092
	for <meta-arago@arago-project.org>;
	Tue, 24 May 2016 11:59:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4OBxBZU005025
	for <meta-arago@arago-project.org>; Tue, 24 May 2016 06:59:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4OBxB8G017889
	for <meta-arago@arago-project.org>; Tue, 24 May 2016 06:59:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 24 May 2016 06:59:11 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4OBx9Do010415;
	Tue, 24 May 2016 06:59:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 24 May 2016 17:28:54 +0530
Message-ID: <1464091134-19523-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omapdrmtest: Bump SRCREV
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
X-List-Received-Date: Tue, 24 May 2016 11:59:12 -0000
Content-Type: text/plain

This patch fixes the segmentation fault while
running viddec3test application

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 18bcdd6..934d13e 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r13"
-SRCREV = "a1df4a987abcb2f868f0ebe759926bf0ea19b58c"
+PR = "r14"
+SRCREV = "2f399d737ea892aba66173b1d705594b5c201172"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 "
-- 
1.9.1



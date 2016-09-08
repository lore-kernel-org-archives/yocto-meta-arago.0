Return-Path: <nikhil.nd@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 811ED52AB8
	for <meta-arago@arago-project.org>;
	Thu,  8 Sep 2016 05:48:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u885mXJa018165
	for <meta-arago@arago-project.org>; Thu, 8 Sep 2016 00:48:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u885mWqp009865
	for <meta-arago@arago-project.org>; Thu, 8 Sep 2016 00:48:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Sep 2016 00:48:31 -0500
Received: from uda0132237.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u885mUs5026591;	Thu, 8 Sep 2016 00:48:30 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Sep 2016 11:18:27 +0530
Message-ID: <1473313707-19664-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: omapdrmtest: Bump SRCREV
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
X-List-Received-Date: Thu, 08 Sep 2016 05:48:34 -0000
Content-Type: text/plain

Fix issues with debug profiling

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 934d13e..b086379 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r14"
-SRCREV = "2f399d737ea892aba66173b1d705594b5c201172"
+PR = "r15"
+SRCREV = "a30dd9a5fc1ae7cdfb8c17a4685efb7eaf693ddc"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 "
-- 
1.9.1



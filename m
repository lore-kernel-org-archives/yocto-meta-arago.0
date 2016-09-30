Return-Path: <poojaprajod@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E2E7352975
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 15:09:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8UF9ZA6006234
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 10:09:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UF9XwA028948
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 10:09:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Sep 2016 10:09:32 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8UF9VjG012872;	Fri, 30 Sep 2016 10:09:32 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Sep 2016 20:39:29 +0530
Message-ID: <1475248169-26535-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [V2] omapdrmtest: Update-SRCREV
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
X-List-Received-Date: Fri, 30 Sep 2016 15:09:36 -0000
Content-Type: text/plain

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index a625e25..e219170 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r16"
-SRCREV = "c3f20b080571f5f363bfb7e0956b6c56004004f8"
+PR = "r18"
+SRCREV = "e4a2932a836c54f4a20b4be9d541d11d3a246a31"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 "
-- 
1.9.1



Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E427652094
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 11:26:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VBQKeV019256
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501500380;
	bh=QcEHJXi5sm4SXIkmIxb/FmQIeE1YFyLVnY51hLsULtg=;
	h=From:To:CC:Subject:Date;
	b=O0kOyZucgfhEK65QEQNKhe44GSgZosajDhaAgDmGOkhcBn0WBJbEsztsRZ/GFatEX
	QN5MhAyZi6Hpf5AGlNzhL9TWUzjzNn5bAxCNotT0X70BuimdmU0/BV5GIpRNCYzLRy
	BSsFlTrM+qIyEBz58eQeNaRltji6yz4XaRPQY0Ks=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBQF7s015776
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:26:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 06:26:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBQDeX010841;
	Mon, 31 Jul 2017 06:26:14 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 16:56:11 +0530
Message-ID: <1501500371-124018-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kmscube: Update SRCREV
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
X-List-Received-Date: Mon, 31 Jul 2017 11:26:33 -0000
Content-Type: text/plain

This patch enhances the app to find the desired pixel format from
the format list of the primary DRM plane

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 220cc75..14973b9 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -10,8 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r7"
-SRCREV = "0fa27a594fd3290644f5666eac62dc570f26f866"
+PR = "r8"
+SRCREV = "24e94f583119896b3ab8ecc7b35c7de3160dcb1f"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-- 
1.9.1



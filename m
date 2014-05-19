Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A42CD529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:21:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJL3aa013008
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:21:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJL2aw017642
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:21:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:21:01 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8CD001355;	Mon, 19 May 2014 14:21:00 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:06 -0500
Message-ID: <1400527207-17021-19-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 18/19] packagegroup-arago-test: Add drm and bltsville tests
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
X-List-Received-Date: Mon, 19 May 2014 19:21:03 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 29c8dae..c87f7aa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -31,6 +31,8 @@ ARAGO_TI_TEST = "\
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ipc-test-fw \
+    omapdrmtest \
+    bvtest \
     "
 
 ARAGO_TI_TEST_append_dra7xx-evm = " \
-- 
1.7.9.5



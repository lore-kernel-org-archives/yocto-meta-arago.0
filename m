Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C64B152AFD
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsNPG005622
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046063;
	bh=7sFQXi7jr+LNC46q23eytZtGCQJnB1S9uWu8MvKwZSg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PZpNnJswF91Hqu3T4ksixgvfST/Af59UZLIYJTsJTUGgWzd0OTJ+DBbdPy7HyN+0D
	xgsXYrDD1vE72PCvJxsnheU0FW18oqvoAaPMwC63/ZHHl+vkMlWpc3UnJP56iub9kJ
	XVsIrFfSeujiPYjO8bd6e5RaebBfUmCfkJayJft4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsIVV018711
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:18 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSC013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:03 -0400
Message-ID: <1507046051-57949-16-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 15/23] packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:34 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index e477295..19a627c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -29,3 +29,7 @@ TEST_ADDONS_TI_append_ti43x  = " \
 
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
+
+TEST_ADDONS_TI_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'omapdrmtest', '', d)} \
+    "
-- 
1.9.1



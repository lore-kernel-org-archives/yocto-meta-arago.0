Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 50E1152A25
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDvEU098027
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139237;
	bh=IouDYTYzSS7uxM6m24sZamz5ovYrqNQvt4crlbzmxMQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xrGVjS/dHL7e4913zXd1Z8waXVztK+1l7ClciBV3FlCkbzgEEraqa30p/T9yXvUYi
	ylu8r8cQJ6BMszRojajdcJt8q8t7TBFSbhMkhsXQHYRHxdc6sSoxe2VPpE543YU5tt
	6yxZhGCHg9mzQbClzvz7An0bCiDplQHZgqd0Au2Q=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDv9m046506
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDunv035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:25 -0400
Message-ID: <20190910181131.8808-4-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 3/9] HACK: packagegroup-arago-test-addons: remove omapdrmtest
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:04 -0000
Content-Type: text/plain

omapdrmtest does not build with mesa-based egl, remove it tentatively

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-test-addons.bbappend   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index 0a8d834..ad03d30 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -26,3 +26,7 @@ TEST_ADDONS_TI_append_am57xx-evm = " \
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_k2g-evm  = " icss-emac-lld-test"
+
+TEST_ADDONS_TI_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    "
-- 
2.17.1



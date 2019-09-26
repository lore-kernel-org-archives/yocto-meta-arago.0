Return-Path: <sjha@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A382752960
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 18:30:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QITRpj121355
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 13:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569522567;
	bh=LJpoAJ/5GqLZUlenIodMZ8swOJRvUL0qdlxosQ48vAA=;
	h=From:To:CC:Subject:Date;
	b=k15NjcPojKJJVtccjK+T8Ykk8OwUuIAed103K4ICj8whlljuH5x8M6sMOzlOFtOa5
	5g9iIr4X4QXnjVSSO2pu9MUYLmrIcfBtd4xxN5is3OGe60mX8Hc2NIT8zypNCSLaRI
	SnHBUpePCBTIf5tGfETFQY3ON4tvLzTMKsfhtR8M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QITRRu057895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 13:29:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 13:29:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 13:29:19 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QITRRO011316;
	Thu, 26 Sep 2019 13:29:27 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Sep 2019 13:28:58 -0500
Message-ID: <20190926182858.3589-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Thu, 26 Sep 2019 18:30:38 -0000
Content-Type: text/plain

Replacing ipc-lld-fw with ipc-lld-examples-rtos to
build from source.

Signed-off-by: Santosh Jha <sjha@ti.com>

---
Change from previous version of patch:
- Rebased to latest master
---
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index b4da6902..776a58bb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
                     jailhouse \
 "
 
-UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss"
+UTILS_append_j7-evm = " ipc-lld-examples-rtos ti-display-sharing-fw cpsw9g-eth-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.17.1



Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C54B4520DE
	for <meta-arago@arago-project.org>;
	Thu, 27 Aug 2020 12:47:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RCimR4041041
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598532288;
	bh=02ngQVX500TlesVA5/3iDfJURB2khpxRa0VfsX/pbQM=;
	h=From:To:CC:Subject:Date;
	b=xA9GUyIfRyGn/Jw5wzb5Aigz2heL3+FolHGU3ACyw5meod/cyBEIRqqMqCI8IfpcK
	MKVUg9duyIUvoQ9z0YlvehGz/CWpLnegCZFP+E65qk7+RJSqxm9LpV8uqxSscbT7Lc
	x9rzTSdLckK2znL1WcpNoJ98otiNMtBa72yrjBOE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07RCimcT043012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:44:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 27 Aug 2020 07:44:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 27 Aug 2020 07:44:48 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RCimVW122326;
	Thu, 27 Aug 2020 07:44:48 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	07RCimB1051245; Thu, 27 Aug 2020 07:44:48 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 27 Aug 2020 07:44:46 -0500
Message-ID: <20200827124446.12684-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-araga][dunfell/master][PATCH] nativesdk-packagegroup-arago-tisdk-host: remove nativesdk-meson
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
X-List-Received-Date: Thu, 27 Aug 2020 12:47:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

nativesdk-meson creates a wrapper with a predefined cross file. However
it is picking up some of the dependencies from the host machine causing
conflicts if there is version mismatch between host and nativesdk
version. Remove nativesdk-meson from tisdk-host until it is resolved.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../nativesdk-packagegroup-arago-tisdk-host.bb              | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 1ced42c1..4185f9c1 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -32,3 +32,7 @@ RDEPENDS_${PN} = "\
     nativesdk-mtd-utils-ubifs \
     ${EXTRA_TI_TOOLS} \
 "
+
+RDEPENDS_${PN}_remove = "\
+    nativesdk-meson \
+"
-- 
2.17.1



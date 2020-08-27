Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 446AE520DE
	for <meta-arago@arago-project.org>;
	Thu, 27 Aug 2020 13:00:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RCvEkP009161
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598533034;
	bh=XsiBEo/0t8FRajvOpJdgx+vTh+/j9FrPTEASRVeJdpE=;
	h=From:To:CC:Subject:Date;
	b=xYYdmLgZC/70WEEa7nN5m9n4pTxkyTtQSvzj5qiXRPiXcbNZbYJSbb6JDq9sbB+Cq
	zlLueNyk5jgN5BD8tvyVUUhSbi9Ym960vlTjg7MAPIOzvBa43xiBW40h09qjisAJp3
	pjKf/Ua19JB+ZJF0p9VsP6vTs424nB9ekmnl0MZY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07RCvEhv002505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:57:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 27 Aug 2020 07:57:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 27 Aug 2020 07:57:13 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RCvEqr014483;
	Thu, 27 Aug 2020 07:57:14 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07RCvDWL064386;
	Thu, 27 Aug 2020 07:57:13 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 27 Aug 2020 07:57:10 -0500
Message-ID: <20200827125710.32587-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH v2] nativesdk-packagegroup-arago-tisdk-host: remove nativesdk-meson
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
X-List-Received-Date: Thu, 27 Aug 2020 13:00:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

nativesdk-meson creates a wrapper with a predefined cross file. However
it is picking up some of the dependencies from the host machine causing
conflicts if there is version mismatch between host and nativesdk
version. Remove nativesdk-meson from tisdk-host until it is resolved.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2:
 - %s/meta-araga/meta-arago in the subject header

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



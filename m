Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 630EE52092
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 15:22:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLOTB103200
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559316084;
	bh=UwurqNm3hhK6rXS7QJFUPzni1t5EkTbom1vR3NAPrUg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vs5sq4L4qZ0hTCYG/JJOzhH8ohqBj72haWMw4pf5sapzLHNAFauONMRwfnOLLg7J3
	6PzLQu+9oNhXESd3Nw70yrP9gWfIMZTp0869d8oiWnwVl0zRLyXqQ3PkPOnqdpl5HD
	2nfYX2vYvBdYuoHZk2bIJcst+jfbIH84W51C6Jmg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VFLOMs120454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 10:21:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 10:21:24 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLJUs034955
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 11:20:59 -0400
Message-ID: <20190531152100.19757-4-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531152100.19757-1-e-ruei1@ti.com>
References: <20190531152100.19757-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/4] packagegroup-arago-tisdk-matrix: add MACHINE FEATURES condition sgx for certain demos
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
X-List-Received-Date: Fri, 31 May 2019 15:22:01 -0000
Content-Type: text/plain

- Both thermostat and touch demos run with QPA eglfs which depends on sgx

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 2b7ee6de..612f66cf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r78"
+PR = "r79"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -36,11 +36,11 @@ MATRIX_QT_APPS = " \
     matrix-qt5-demo-webkit-browser \
     matrix-qt5-demo-calculator \
     matrix-qt5-demo-deform \
-    matrix-gui-thermostat-demo \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-thermostat-demo','',d)} \
 "
 
 MATRIX_TOUCH_APPS = " \
-    matrix-gui-touch-demos \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-touch-demos','',d)} \
 "
 
 MATRIX_QT_APPS_keystone = ""
-- 
2.17.1



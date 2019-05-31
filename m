Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D844952985
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 17:48:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmBaR072105
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559324891;
	bh=XkvBbbU/2hoQthJ0ECzOapXQ0sN7kfL+lGPKPRhX7VM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VNcM+UywfLOATrNWmbBRylNer0OTMMmOgf2BK3agoolb61purH75Lm1oyyyYP6eYJ
	Rxz7c/JCL9XU/sOwuQSzRTjYQO1J6nXRf5SN9szYA5P0fZtELwKVb3Y4cOxK3SFP9u
	CchLhHCWLnLDcsvCbKgl6DQ+tktnXLc0Mzt3BblI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VHmBce045868
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 12:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 12:48:11 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmANN118948
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 13:47:53 -0400
Message-ID: <20190531174754.42586-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531174754.42586-1-e-ruei1@ti.com>
References: <20190531174754.42586-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/3] packagegroup-arago-qte: remove qtquick1 components
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
X-List-Received-Date: Fri, 31 May 2019 17:48:49 -0000
Content-Type: text/plain

qtquick1 is obsolete.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-qte.bbappend    | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bbappend       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
index ac545ec..0acf47d 100644
--- a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
@@ -1,9 +1,9 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 QT5_ESSENTIALS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-qmlplugins', d)} \
 "
 
 QT5_ESSENTIALS_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-qmlplugins qtquick1-plugins qtquick1-qmlplugins', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebkit-qmlplugins', d)} \
 "
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
index 6fa1035..85954fc 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
@@ -1,9 +1,9 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 QT5_DEMOS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
 "
 
 QT5_DEMOS_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtquick1-examples qtwebkit-examples-examples', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebkit-examples-examples', d)} \
 "
-- 
2.17.1



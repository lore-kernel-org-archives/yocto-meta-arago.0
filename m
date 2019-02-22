Return-Path: <qsu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 60F9152978
	for <meta-arago@arago-project.org>;
	Fri, 22 Feb 2019 19:02:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1MJ2q1g037113
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 13:02:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550862172;
	bh=puF+q+WzlntzTFjrjcOVJM1GDOjGHy1pUHtVvHdayVE=;
	h=From:To:Subject:Date;
	b=mOWJuX2MuXf4NZdZusY9LVvG/ZPgO0Im/JCYratoiIovs4Hkpe8PEpVTfWkZICdsg
	HeSTJoC/dMlc7QV/eKn4F0luD7GG/qdMZqZzQF/ek10HO+R0pGDibhhH/IVDqgkYw7
	lSGVhmtOjgf5eXMSruaF+r+Lcll06eE2fne7OUCc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1MJ2qJp026390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 13:02:52 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 22 Feb 2019 13:02:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 22 Feb 2019 13:02:51 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1MJ2pfn029732
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 13:02:51 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Feb 2019 14:02:02 -0500
Message-ID: <1550862122-8951-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arm-compute-library: bump SRCREV
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
X-List-Received-Date: Fri, 22 Feb 2019 19:02:59 -0000
Content-Type: text/plain

Upgraded to Linaro version 19.02.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../arm-compute-library/arm-compute-library_git.bb                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index 865f7f8..a93ff6c 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
 COMPATIBLE_MACHINE = "armv7a|aarch64"
 
 SRC_URI = " \
-    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
+    git://review.mlplatform.org/ml/ComputeLibrary;protocol=https;branch=${BRANCH} \
     file://0001-add-ti-benchmark-test-group.patch \
     file://0002-add-ti-benchmark-test-group.patch \
     file://0003-add-ti-benchmark-test-group.patch \
@@ -19,12 +19,12 @@ SRC_URI = " \
     file://0010-add-ti-benchmark-test-group.patch \
     file://0011-add-ti-benchmark-test-group.patch \
 "
-
-PV  = "18.08"
+PR = "r0"
+PV  = "19.02"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
 BRANCH = "master"
-SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
+SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



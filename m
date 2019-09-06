Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 33B0E520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 09:09:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8698nV6078552
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567760929;
	bh=1imnL7BweavEHDBJq7FSVNzC73AcGQkDNTjUl3HNYx8=;
	h=From:To:CC:Subject:Date;
	b=ZoAZgEVzV0nYXhKmAq8JggZuNa3gRkBhpMhnqXJBpMIPLH/5CxPV6XG9eM2ZNsZJV
	MjRmmBxUgvf7WM8XeVwjQ9yX4qIiVv0DcLUb6XEhnNE5AR6dQFRHXAVT6b76r7WIi/
	REdjR20TYHDh8MuSSFgRMSEbekmwm8PSFCFIr65E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8698nZi064259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:08:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 04:08:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 04:08:49 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8698lm4002594; 
	Fri, 6 Sep 2019 04:08:48 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Fri, 6 Sep 2019 14:38:46 +0530
Message-ID: <1567760926-52760-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ [thud/master] PATCH v1] recipes-devtools: glsdk-util-scripts: update for j7-evm
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
X-List-Received-Date: Fri, 06 Sep 2019 09:09:54 -0000
Content-Type: text/plain

update SRCREV and compatible machine for j7-evm
Install scripts with execute permissions
Add bash as RDEPENDS

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-devtools/util-scripts/glsdk-util-scripts.bb      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
index a0ca56a..abe9ad9 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
@@ -3,12 +3,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
 PR = "r1"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "omap-a15|j7-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+RDEPENDS_${PN} += "bash"
 
 SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
 
-SRCREV = "ecbb9cd13e1728686a82e87e5c1b325c0e806202"
+SRCREV = "df50ca1592cae97ad0c7285686d602926b4f7305"
 
 S = "${WORKDIR}/git"
 
@@ -20,8 +21,11 @@ do_install() {
     install -d ${D}${datadir}/ti/util-scripts
     install -d ${D}${datadir}/ti/util-scripts/debug
     install -d ${D}${datadir}/ti/util-scripts/perf
-    install -m 0644 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
-    install -m 0644 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
+    install -d ${D}${datadir}/ti/util-scripts/demo
+    install -m 755 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
+    install -m 755 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
+    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
+
 }
 
 FILES_${PN} += "${datadir}/ti/util-scripts/*"
-- 
1.9.1



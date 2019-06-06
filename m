Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0E458529D8
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2019 16:17:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56GHEtW060448
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 11:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559837834;
	bh=862BewdShtIDmNMDhgWEnE8HVtaMlmB2XvmweA9yDpg=;
	h=From:To:CC:Subject:Date;
	b=lfss0UDyZcnp2WmWvYemlQCcvLqZlt9iLOKWwLT9tRDFRPw5bsz/SNOruscdKHTln
	8oIKIHQ46pNKlcxyAlcgwqW3mc3Kl50Rtn9aibdoHBvBgDayN/PINazPth3itD/VoP
	z8whSiO1XgL9NnA8toMzfaYH6V6KeDkVHWiViOgc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56GHExD121169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 11:17:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 11:17:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 11:17:13 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56GHDHU033233;
	Thu, 6 Jun 2019 11:17:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Jun 2019 12:01:09 -0400
Message-ID: <1559836869-12921-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] tidl-import: disable static linking
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
X-List-Received-Date: Thu, 06 Jun 2019 16:17:52 -0000
Content-Type: text/plain

* Disable static linking to fix run-time against protobuf 3.6.1

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../tidl-utils/tidl-import/disable_static.patch          | 16 ++++++++++++++++
 .../recipes-ti/tidl-utils/tidl-import_git.bb             |  5 ++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
new file mode 100644
index 0000000..23377af
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
@@ -0,0 +1,16 @@
+diff --git a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
+index 374f862..521f0dc 100644
+--- a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
++++ b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
+@@ -103,9 +103,9 @@ ifeq ($(PLATFORM_BUILD), x86)
+ ifeq ($(LINUX_IMPORT_TOOL), 64BIT)
+ CFLAGS+= -DPLATFORM_64BIT 
+ endif
+-LDFLAGS+= -lstdc++ -static
++LDFLAGS+= -lstdc++
+ else
+-LDFLAGS+= -lstdc++ -lz -static
++LDFLAGS+= -lstdc++ -lz
+ endif
+ endif
+ 
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index bef2d1a..72dd169 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -8,7 +8,10 @@ LICENSE = "BSD-3"
 LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
 
 PV = "01.01.00.00"
-PR = "r0"
+PR = "r1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}:"
+SRC_URI_append = " file://disable_static.patch;pnum=3"
 
 S = "${WORKDIR}/git/src/importTool/"
 
-- 
2.7.4



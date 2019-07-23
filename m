Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 56504529DE
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2019 21:27:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NLR04H104952
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563917220;
	bh=mWUftT+PWV3tH4+ty7kMSK+53b8AtkPMOnm6wAk786Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=V1KTaZhCuJdHU5mzVy/tLU+Ztn2NQ05BoC9xW3XUiDNt8qbFS2PMXNpANOqo2fcPd
	9rmhGtQLMyB9Q/YrvcdnQT8YqemNNvTx+3eiZ6aM7yYYUbmZhSkLiwWlUTs1gIinIH
	B+YzrTIS00u4/j3iH89H1/mmpQob5/aXzMhf6c9Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NLR0aZ076192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:27:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Jul 2019 16:26:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Jul 2019 16:26:59 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NLQxB9085986;
	Tue, 23 Jul 2019 16:26:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Jul 2019 21:13:38 +0000
Message-ID: <20190723211338.6729-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723211338.6729-1-denys@ti.com>
References: <20190723211338.6729-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] optee-os: update to 3.6.0, depend on pyelftools
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
X-List-Received-Date: Tue, 23 Jul 2019 21:27:53 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend       | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index ba190355..2cd7a673 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,9 +2,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PR_append = ".arago2"
+inherit python3native
 
-PV = "3.5.0+git${SRCPV}"
+DEPENDS += "python3-pyelftools-native"
+
+PR_append = ".arago0"
+
+PV = "3.6.0+git${SRCPV}"
 
 is_armv7 = "1"
 is_armv7_aarch64 = "0"
@@ -13,7 +17,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
-SRCREV = "3a513ceae7706834f9538219503848f40302ff6d"
+SRCREV = "e5a8779a6ffa2aa7ad01aed43608bcb9321817c6"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
-- 
2.17.1



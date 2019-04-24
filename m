Return-Path: <dmurphy@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E18CB52985
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2019 00:13:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3O0DQSo064124
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556064806;
	bh=PC29hffSe8G5IJrGi6B4MYgaHyj6XqVgOEuRFCy1Z0k=;
	h=From:To:CC:Subject:Date;
	b=HC2oJX5Q+qT/vvwrUY0nKhjodSLJ0AnkrfmsRSRkzjPfabhCgkdY+8ftRJOs+Y0ys
	RQtFksurLTqW8hVoO7yjAXAOj5z6kknDVjiTj13/64RuMYFmhT1HsAnC6vXDAkHCmo
	6dGfZe/k5RkyCuOJdqOGO8SNpR9CrH3dc7WoulKo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3O0DQpv112797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 19:13:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 19:13:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 19:13:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3O0DQmc038681;
	Tue, 23 Apr 2019 19:13:26 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 23 Apr 2019 19:13:24 -0500
Message-ID: <20190424001324.16879-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Wed, 24 Apr 2019 00:13:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index cdf3ef6b..a468a12f 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago1"
 
-PV = "3.4.0+git${SRCPV}"
+PV = "3.5.0+git${SRCPV}"
 
 is_armv7 = "1"
 is_armv7_aarch64 = "0"
@@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "b01970c6081fcbbc79ef1d3c417ddd5b05df7656"
+SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
-- 
2.21.0.5.gaeb582a983



Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B010D52A08
	for <meta-arago@arago-project.org>;
	Wed, 18 Oct 2017 16:42:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9IGgTPU025254
	for <meta-arago@arago-project.org>; Wed, 18 Oct 2017 11:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508344949;
	bh=d9I+AcXJL2JuZO7JxnEIXVMAroHcp/AqxZP8G5Aigps=;
	h=From:To:CC:Subject:Date;
	b=kaItTpMK8T4WuDT9dvGWkHj0Dg5w+SrTSBvOef7iV9kziJAemnOrGWmT/ZOTkkp4I
	bmoZmvZ9PbMlCHbug/Q24Ue2jAq9gqPme3sRByC/ffJhEfFhOsdELAqI4cE0bN5E0c
	GLd51rO18EmQRcjeoe3xrX0X31sRuCdQ0hh2YtsQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9IGgTWi029796
	for <meta-arago@arago-project.org>; Wed, 18 Oct 2017 11:42:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 18 Oct 2017 11:42:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 18 Oct 2017 11:42:29 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9IGgTuA022681;
	Wed, 18 Oct 2017 11:42:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Oct 2017 12:34:54 -0400
Message-ID: <1508344494-8454-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-cgt6x: update to version 8.2.2
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
X-List-Received-Date: Wed, 18 Oct 2017 16:42:30 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/{ti-cgt6x_8.1.3.bb => ti-cgt6x_8.2.2.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.1.3.bb => ti-cgt6x_8.2.2.bb} (86%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.3.bb b/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
similarity index 86%
rename from recipes-ti/devtools/ti-cgt6x_8.1.3.bb
rename to recipes-ti/devtools/ti-cgt6x_8.2.2.bb
index 87d03cb..7a9c2dc 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.3.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
 
 PE = "1"
 
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "dca41cd1868709760589bed9d03a2053"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "df3a07350e8bcf942edf579a5ec778fca85a8071957b403db4ba52691d805029"
+SRC_URI[cgt6x_x86_installer.md5sum] = "548c841b231c2fbd954218d4e370c995"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "f269e51eb29de2efd32b3ea93beebd7b00a1a156c923be1a33ba7d785c4c6a24"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "2e872aabb214a228020febc102d64cef"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "577b9dc43b9b1fb893a1d5cc6b6da149e89bd40e4c7df3dd5f4b6453b4203940"
+SRC_URI[cgt6x_arm_installer.md5sum] = "56f5e5464ab87af517a6cdd5fed06f3f"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "4b2e605a4afc3d4d0ac74013ee32496541abf093aedd70bc7ef040597933b1ea"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4



Return-Path: <a0389345@dta0389345ub>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3A4C7529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 23:51:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UNmuMd109312
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 18:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593560936;
	bh=CuUwC1IeUhbbVLedt6iPBoALObahzyU9CRWQ2kJ2WvA=;
	h=From:To:CC:Subject:Date;
	b=XrMTWLewwZrjhyE3VuFKPRKumFpFXi+aEJAArze1HosLcHsMCeeEXXZJocCflVlHT
	q4d6gU+APRJSJZsLpKPO4uccDeBhGL/AoetSs51lwpfwgD3ODfER0c+aWisGHPqBSE
	y/fefKwFb/gBAsMlpcUXgsG+LCO/nRnCcbleZ6rA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UNmu0n127945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 18:48:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 18:48:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 18:48:55 -0500
Received: from dta0389345ub (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UNmtXc101370;
	Tue, 30 Jun 2020 18:48:55 -0500
Received: from a0389345 by dta0389345ub with local (Exim 4.90_1)
	(envelope-from <a0389345@dta0389345ub>)
	id 1jqPzj-0007Mw-T9; Tue, 30 Jun 2020 18:48:55 -0500
From: <prao@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 30 Jun 2020 18:48:52 -0500
Message-ID: <20200630234852.28283-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Praveen Rao <prao@ti.com>
Subject: .master/dunfell] ti-tisdk-makefile: update Rules.mk armv7 toolchain for R5 use
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
X-List-Received-Date: Tue, 30 Jun 2020 23:51:34 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

Update the Rules.make addition for the R5 use of the armv7  toolchain.

Signed-off-by: Praveen Rao <prao@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a698dd34..a441d4b1 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -368,7 +368,7 @@ do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
 
 # Add CROSS_COMPILE and UBOOT_MACHINE for the R5
-export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-linux-gnueabihf-
+export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-none-linux-gnueabihf-
 UBOOT_MACHINE_R5=${K3_UBOOT_MACHINE_R5}
 __EOF__
 }
-- 
2.17.1



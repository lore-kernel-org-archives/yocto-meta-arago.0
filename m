Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 055DD5298F
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 16:05:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w17G50aV026864
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 10:05:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518019500;
	bh=/+a7UNBAojNbl5V80rHp16gtIT0JR4uI3K7nh/H0TpE=;
	h=From:To:CC:Subject:Date;
	b=lJTjf8TKdexC9q+D2olO0/PRiPFJHaSR6jvIY3pOvZ1ceUfhkVtIJPpIxeEMnncc1
	GZa06nLXgIzNgJkJotXWaJ+AxJp00h7kt3p4D/kSrp/USH4D2vxWmxLFPaGPoUDIfA
	zbHnJ6YsLJFdsqEhyLbnV1c2u/1zHgD0e/ZLzNa0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w17G50Jx009873
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 10:05:00 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Feb 2018 10:05:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 7 Feb 2018 10:05:00 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w17G4x5D010994;
	Wed, 7 Feb 2018 10:05:00 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 7 Feb 2018 10:56:21 -0500
Message-ID: <1518018981-12950-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rnambiath@ti.com
Subject: [meta-processor-sdk][PATCH] tisdk-paths: add PROC_SDK_INSTALL_DIR
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
X-List-Received-Date: Wed, 07 Feb 2018 16:05:10 -0000
Content-Type: text/plain

* PROC_SDK_INSTALL_DIR is needed by jailhouse-examples-rtos

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---

* Resolves PRSDK-3527

 recipes-ti/includes/tisdk-paths.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/includes/tisdk-paths.inc b/recipes-ti/includes/tisdk-paths.inc
index 300f352..77dac07 100644
--- a/recipes-ti/includes/tisdk-paths.inc
+++ b/recipes-ti/includes/tisdk-paths.inc
@@ -1,4 +1,7 @@
 require recipes-ti/includes/arago-paths.inc
 
 export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
+export PROC_SDK_INSTALL_DIR_RECIPE   = "${installdir}/ti-proc-sdk-rtos-tree"
+
 export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
+export PROC_SDK_INSTALL_DIR   = "${STAGING_DIR_TARGET}${PROC_SDK_INSTALL_DIR_RECIPE}"
-- 
2.7.4



Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 939A052A48
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2019 19:08:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RJ7pnR051248
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 14:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561662471;
	bh=3vrYGInGLmw+6Befle0pdRR1ZBU5yhtSnYS+sSgoSQ8=;
	h=From:To:CC:Subject:Date;
	b=Nptjlg+x6RtZ9NbNdqKd6bFWS7vWs0RqnTVFoGLDtWSQ9p2V6LP2nL3KUaVyP/L1x
	AiuxTmz71Iyv9ZO6H9paCLvoppRhtYt13YouhdZStd2i7JpdvT/R1b2U4+qbjRyCSf
	3MV5zGCRmF+FRDln4N6kInZIPhYHV1bFThnNoutE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RJ7pAs078978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 14:07:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 27 Jun 2019 14:07:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 27 Jun 2019 14:07:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RJ7pUB013525;
	Thu, 27 Jun 2019 14:07:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jun 2019 14:51:04 -0400
Message-ID: <1561661464-8885-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ti2019.01][PATCH] HACK: ti-tisdk-makefile: omapconf: disable static linking
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
X-List-Received-Date: Thu, 27 Jun 2019 19:08:35 -0000
Content-Type: text/plain

* The necesary static libraries are missing from the devkit, so
  disable static linking for now.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---

This is a workaround for a problem with the devkit, so can we only
take this on the ti2019.01 branch so that we do not forget to revert
it in the future?

Thanks,
Jake

 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
index 9a8e69a..77bc3d3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
@@ -3,7 +3,7 @@ omapconf:
 	@echo =======================
 	@echo    Building OmapConf
 	@echo =======================
-	@cd example-applications; cd `find . -name "*omapconf*"`; make CROSS_COMPILE=${CROSS_COMPILE} omapconf
+	@cd example-applications; cd `find . -name "*omapconf*"`; make CROSS_COMPILE=${CROSS_COMPILE} STATIC_BUILD="" omapconf
 
 omapconf_clean:
 	@echo =======================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e0d409a..971350a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,7 +54,7 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r95"
+PR = "r96"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4



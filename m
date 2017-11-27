Return-Path: <yan-liu@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3F7EA52961
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 23:07:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARN7DkT028257
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:07:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511824033;
	bh=/YZZcu9U9dF1hfXBDQ+bV8AoIOJitxjsJck/jxkDrns=;
	h=From:To:CC:Subject:Date;
	b=GBcZx8dzYEhll5nNDXkMXF9hsPORYJi+vU+RKnw70ogdOT6IIC2DkGd9YDXG/1oDy
	AFq3Cvu+SUupMpK7rxGKmq5owW+kdrHPW3imzLu11DFboFcX6EbuD8ceccx4cSmE+X
	K0Ng/iL94VQAeW94pAvulKOASCYvj79N7BntqnkU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARN7DZn015739
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:07:13 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 17:07:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 17:07:12 -0600
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARN7CT9000653;
	Mon, 27 Nov 2017 17:07:12 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Nov 2017 18:02:06 -0500
Message-ID: <1511823726-2643-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Mon, 27 Nov 2017 23:07:13 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index ca30617..0e83556 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r2"
+PR = "r3"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -37,7 +37,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "53fa422841f1ed753728af61ca729baaa0519907"
+SRCREV = "c70b8372122f95c44b5d86b2ae0cea5e471dd15f"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5



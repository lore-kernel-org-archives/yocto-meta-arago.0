Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A17A5529A4
	for <meta-arago@arago-project.org>;
	Fri, 22 Mar 2019 19:09:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2MJ8uR1083790
	for <meta-arago@arago-project.org>; Fri, 22 Mar 2019 14:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553281736;
	bh=dw3rIlGyUd5kq6xTiyp3TcJg/QcO/PVHvHnm4agihh8=;
	h=From:To:CC:Subject:Date;
	b=U2/5WRfuxnVvY+76yseCGXAkhy++8/qV9NwruDB40FfB/twga4DPoD2qZk7Z2pgdj
	2eCuo2pLYDyKoo/zSCm2MyL500vyKFMYIfrXPxndGzCEq52ozasMkV4JXpEsNnixml
	cQO03TRMiWt20FEClNU5W5iEOU/ZOWDvpQ5waSy4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2MJ8umZ028205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Mar 2019 14:08:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 22 Mar 2019 14:08:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Fri, 22 Mar 2019 14:08:55 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2MJ8t1h017725;
	Fri, 22 Mar 2019 14:08:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Mar 2019 14:56:43 -0400
Message-ID: <1553281003-23779-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] fftlib: bump SRCREV to latest
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
X-List-Received-Date: Fri, 22 Mar 2019 19:09:10 -0000
Content-Type: text/plain

* As the fftlib sources are shared amongst multiple recipes, abstract
  SRC_URI to simplfy overrides.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/fftlib/fftlib.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/fftlib/fftlib.inc b/recipes-ti/fftlib/fftlib.inc
index 7addb90..ea5215e 100644
--- a/recipes-ti/fftlib/fftlib.inc
+++ b/recipes-ti/fftlib/fftlib.inc
@@ -1,10 +1,17 @@
 PV = "3_1_0_0"
-INC_PR = "r1"
+INC_PR = "r3"
 
 require recipes-ti/includes/tisdk-paths.inc
 
-DESTSUFFIX = "${WORKDIR}/git"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
-SRCREV = "3d5ebada3cd94096fb798548d68059dc4c34a1ea"
+FFTLIB_GIT_URI = "git://git.ti.com/fftlib/fftlib"
+FFTLIB_GIT_PROTOCOL = "git"
+FFTLIB_GIT_BRANCH = "master"
+FFTLIB_GIT_DESTSUFFIX = "${WORKDIR}/git"
+
+FFTLIB_SRCREV = "54fb858e97235c0a3cd948d24d22329653a7837f"
+
+BRANCH = "${FFTLIB_GIT_BRANCH}"
+SRC_URI = "${FFTLIB_GIT_URI};destsuffix=${FFTLIB_GIT_DESTSUFFIX};protocol=${FFTLIB_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FFTLIB_SRCREV}"
-- 
2.7.4



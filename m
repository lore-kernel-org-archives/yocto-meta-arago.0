Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 88EC652092
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 21:00:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKxsA2075206
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081994;
	bh=DSGkPDvegJgz0gK4c6s/cbcwky4zNOu3Lm9+BHGC0fs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=B04+rRdsZe1GceXzi8yy0NPwFGy8bou51ahcYxNxk5V2b5zWC3q+D/4cu1ayWM64J
	LiGgDKdDktbF/uhYjaG2J4oGHNsfTpaY9Ag90qBmViYFDqReflxutRaEAmr8RuikYE
	kU/af7WhipfISgncruziw6oZQIIsMaIQdbkXWPOc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKxsYs022810
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:59:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:59:54 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKxrMa022588
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:53 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 16:59:50 -0400
Message-ID: <1538081991-52963-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081991-52963-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081991-52963-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master/ti2018.03][PATCH v2 1/2] posix-smp-demo: Update to versin 01.01.00.02B
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
X-List-Received-Date: Thu, 27 Sep 2018 21:00:03 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
index b89ebd4..77b61ac 100644
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
@@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
 POSIX_SMP_GIT_PROTOCOL = "git"
 POSIX_SMP_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.01"
-POSIX_SMP_SRCREV = "99834751f63f8f418e659b251f10e8e13b900881"
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.02B"
+POSIX_SMP_SRCREV = "339039e281586a79c5b04fac6c2ae84eb30c0576"
 
 BRANCH = "${POSIX_SMP_GIT_BRANCH}"
 SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${POSIX_SMP_SRCREV}"
-PV = "01.01.00.01"
+PV = "01.01.00.02B"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
1.9.1



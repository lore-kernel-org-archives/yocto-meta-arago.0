Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 23FC752A15
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 15:36:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFaDam112574
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538062573;
	bh=DSGkPDvegJgz0gK4c6s/cbcwky4zNOu3Lm9+BHGC0fs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SBcXD7GZO/4rGleJI2b68uGLGFKGNH5otEvoDu1sjYjqeQi73gXGIR7b1leTie8VB
	OtN9c6UZvy9HYQeldS5xg0X1j0+7slS71cwA3KFEgZW32WpDGuUYHgaQez99uQRJip
	eQG5O1UKLtm0NIKNujpvJUFiTA931LpjTE5PR89I=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaDW6010318
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:36:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:36:13 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaCvo031719
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 11:36:09 -0400
Message-ID: <1538062570-55253-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 1/2] posix-smp-demo: Update to versin 01.01.00.02B
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
X-List-Received-Date: Thu, 27 Sep 2018 15:36:23 -0000
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



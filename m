Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id ABA43529AE
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:29:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHSroO023048
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021333;
	bh=1MfOM4kC9TNOWuwP1GBUbrIOoEMJ93qSS7sThn/EE1o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=msilt9rXqZEC+d00ccbPQ4FQvJ/DwgBMYERA8uv0dXnCePWc34ib+JsDJBXiysoej
	JcBf/JWQxQ2ggnCZDhl+TwoxTm4UGX+HvhmdXPP4qhtXxx998pUzseR6h6grvwX9Qy
	xgCMD75wQplebEhFBFp2gso4Ayqz1FyM/oYlIvhQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSrpx021882
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:53 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:28:52 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSpg9028108
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2018 13:28:49 -0400
Message-ID: <1532021329-48972-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 4/4] jailhouse-examples-rtos: SRCREV bump
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
X-List-Received-Date: Thu, 19 Jul 2018 17:29:01 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-support/jailhouse/jailhouse-examples-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
index 3bcd331..c2d50de 100644
--- a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
+++ b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/baremetal/soc/am572x/rules.mk;endline=
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/processor-sdk/jailhouse-inmate.git;branch=${BRANCH}"
-SRCREV = "8ccdfdf8761d2df8b0e8ae822dfc69128e988d09"
+SRCREV = "4b17bc03df92aa8bf55a161d311cc2fccd0bc7ac"
 
 PV = "1.0"
-PR = "r5"
+PR = "r6"
 
 require recipes-ti/includes/tisdk-paths.inc
 
-- 
1.9.1



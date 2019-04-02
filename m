Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 93D0A52992
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2019 19:34:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x32JY7L6040309
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2019 14:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554233647;
	bh=UfCRoIsZiBwC15ZsSWI2mfGQ+UMfQiL1ejd5CtwSNIA=;
	h=From:To:Subject:Date;
	b=Kda9su69n1DSRYMVO6+ozF7n8xxVau7HON6KNEM0RcTaweHrHaRSoR12syBEDor61
	te10oR/7V4fZJtbdPjDOrKPzXXcaYnvvuNlUKkANKTDwnwCmOstVSZgCmRpc0DAKCE
	Tmrru7wLZ9CD3egleolpYSXhJCO6f7tYy+LM90Yc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x32JY7gf042450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2019 14:34:07 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Apr 2019 14:34:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Apr 2019 14:34:07 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x32JY6Jf110899
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2019 14:34:07 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Apr 2019 15:34:04 -0400
Message-ID: <1554233644-51858-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] jailhouse-examples-rtos: SRCREV bump
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
X-List-Received-Date: Tue, 02 Apr 2019 19:34:27 -0000
Content-Type: text/plain

---
 recipes-support/jailhouse/jailhouse-examples-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
index c2d50de..98d0673 100644
--- a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
+++ b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/baremetal/soc/am572x/rules.mk;endline=
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/processor-sdk/jailhouse-inmate.git;branch=${BRANCH}"
-SRCREV = "4b17bc03df92aa8bf55a161d311cc2fccd0bc7ac"
+SRCREV = "ba15a1518104b648cf04a42ac8c40583d441f1c2"
 
 PV = "1.0"
-PR = "r6"
+PR = "r7"
 
 require recipes-ti/includes/tisdk-paths.inc
 
-- 
1.9.1



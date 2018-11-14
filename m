Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A84EB529B2
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2018 13:51:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEDp6IS100816
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542203466;
	bh=CWVyKER9ObhbxGvXnBQY1MM84e96ZwoLTVSsiW+4j64=;
	h=From:To:Subject:Date;
	b=Huy0ppT4A3KNDfybN4G1MsGLNZH0N1zUKZYlgwCr0AZ4U8yM0oXSCQGXzPjFUN9zD
	7fjW6uubw40LoLxHP6c2lAeLyuDrCzKOQc6Ps/vbP8SXYIB6BfSHAkm88mGPDFHjdB
	quhVbn2WbrzOmi4kH2vX2ZEipnjY32uTuQwGIgHo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEDp6MI072624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 14 Nov 2018 07:51:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 07:51:06 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEDp5pT012952
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Nov 2018 08:50:40 -0500
Message-ID: <1542203441-24961-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/2] Revert "evse-hmi : SRCREV update"
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
X-List-Received-Date: Wed, 14 Nov 2018 13:51:17 -0000
Content-Type: text/plain

This reverts commit 5802cc5018145b26fd2e8ad3f44e3d79821b6792.
To be deleted from meta-processor-sdk, the same has been upstreamed
already.
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
index 114ba29..1bb66f5 100755
--- a/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -10,7 +10,7 @@ PR = "r0"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "ce093e76faddce78dbaa3e22af6d252f57d5f700"
+SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



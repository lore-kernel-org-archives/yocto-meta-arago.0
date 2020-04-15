Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CCA7A52A3C
	for <meta-arago@arago-project.org>;
	Wed, 15 Apr 2020 17:33:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FHVefO039715
	for <meta-arago@arago-project.org>; Wed, 15 Apr 2020 12:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586971900;
	bh=+ZkQvBCXPFUBP9ymnoEe0Gt4brr7UIuRflLCrvhxcOs=;
	h=From:To:CC:Subject:Date;
	b=MbhciKN3rX2sYduJj4PVZZRG0Ltc7dn1f85Iszq/EdxyRzzVJ3uq8mXNZIUB1CpYi
	VIldq3b8Q4ls8RVKXY+KjgKYTw4R39MKkwX+LyE8B/1A5S8h/aoAIIQwZGUPneFGZ/
	YM6+PF/GPajKi28PaQlJMJN3cAsBKd2b4ThXTeb0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FHVeHc067833
	for <meta-arago@arago-project.org>; Wed, 15 Apr 2020 12:31:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 15 Apr 2020 12:31:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 15 Apr 2020 12:31:39 -0500
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FHVdt8116566;
	Wed, 15 Apr 2020 12:31:39 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Apr 2020 13:31:36 -0400
Message-ID: <20200415173136.25767-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr-demo: bump up SRCREV
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
X-List-Received-Date: Wed, 15 Apr 2020 17:33:57 -0000
Content-Type: text/plain

---
 recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
index 4cccf0e..581cfd2 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${
            file://Makefile.build;subdir=demosrc \
           "
 
-SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
+SRCREV_neo-ai-dlr = "aefda8ab117ea437ba01b1cc7e54d9e866cabeea"
 
 S = "${WORKDIR}/demosrc"
 
-- 
2.17.1



Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ED375529E5
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:37:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03NNYqY9071663
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2020 18:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587684892;
	bh=HBZXn22ks/Lf4aQRxysG4ZE+M/+w1bRRdLyrgBSoR2M=;
	h=From:To:CC:Subject:Date;
	b=RbBARBy9YbXprs5bft4n+AcF7U0mzg0sEzrWae/tcS/fJTlCo2GgtCpjt8lWslKT+
	730LO1sipRv0WD4KmCcNaoAV3polpGzPriUReqpzyQPZT4ruvsktrnwBjjfo88yKu4
	OTNAOdk3r2UyN7zqKVRy/tswaLXLmOhYRQQRVIZ8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03NNYqFO048771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2020 18:34:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 23 Apr 2020 18:34:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 23 Apr 2020 18:34:52 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NNYq8R075844;
	Thu, 23 Apr 2020 18:34:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Apr 2020 23:34:51 +0000
Message-ID: <20200423233451.2477-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-build-scripts][PATCH] machine-specific-functions: add support for j7-hs-evm
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
X-List-Received-Date: Thu, 23 Apr 2020 23:37:12 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/machine-specific-functions | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index 845659f..e40a088 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -25,7 +25,7 @@ parse_machines() {
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
-            am65xx-evm | am65xx-hs-evm | j7-evm )
+            am65xx-evm | am65xx-hs-evm | j7-evm | j7-hs-evm )
                 AARCH64_MACHINES="$AARCH64_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""AARCH64"
                 ;;
-- 
2.17.1



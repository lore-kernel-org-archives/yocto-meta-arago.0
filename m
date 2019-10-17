Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7CBBD52986
	for <meta-arago@arago-project.org>;
	Thu, 17 Oct 2019 18:33:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HIVlsL059933
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 13:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571337107;
	bh=ZoC3Avneid+G1Or/lNhv1A4ZtBX+HKiz0WfFymzPC0o=;
	h=From:To:CC:Subject:Date;
	b=Z1dWrWC5ntmxMyXV29lisJLtWhaEVXanCr/hYdnrlyYjaqnlsUntFS5I+lEc2jHBz
	6vhXJaGvWI5UEITddGpETqqqjSYD84zg2JG/DxcRHgbqNgt4aSYowDpx/YvM9RW1CO
	BwS7XVh/+zVcH3Yt6fvSziTLEpVAL13ZALk5+m3U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HIVldl099473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 13:31:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 17 Oct 2019 13:31:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 17 Oct 2019 13:31:38 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HIVkXV115325;
	Thu, 17 Oct 2019 13:31:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Oct 2019 18:15:24 +0000
Message-ID: <20191017181524.20463-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] kselftests: re-add ptp into main RDEPENDS
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
X-List-Received-Date: Thu, 17 Oct 2019 18:33:03 -0000
Content-Type: text/plain

Commit 371b7bb52225a3f7aadf57910aa9af3bf26c0e78 enabled ptp package, but
did not add it to RDEPENDS, fix it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index b28868f5..96263875 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -160,6 +160,7 @@ RDEPENDS_${PN} += "bash \
 	${PN}-net \
 	${PN}-nsfs \
 	${PN}-pstore \
+	${PN}-ptp \
 	${PN}-ptrace \
 	${PN}-seccomp \
 	${PN}-sigaltstack \
-- 
2.17.1



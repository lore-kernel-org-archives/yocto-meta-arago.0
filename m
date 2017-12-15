Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C2FE7529D1
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 16:57:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFGuuES019075
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 10:56:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513357016;
	bh=q/aDOESIOlgQ2pva0GVqW0BSkkt7eAggnhBJM34eosM=;
	h=From:To:CC:Subject:Date;
	b=X7D3ERnIzc/uh6V6pFtOtLWICZptDe2aMBYJD+PwvrVx/6jIrDEml5x5i9J0iU/Y8
	3ifMXfG6iRbP9zapVBD3kVrSY/+fu0TDG7vF+w8eF+6iqQ6CtGl1n1svoTvdteYLAN
	qKUrE/iV2l/UQm2RJn4visG8THyoTxzMNGAeCg7k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFGuprh026454
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 10:56:51 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 10:56:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 10:56:51 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFGuoaM031408;
	Fri, 15 Dec 2017 10:56:50 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 11:56:43 -0500
Message-ID: <1513357003-1578-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] packagegroup-arago-tisdk-addons: add ccief-basic for omapl138
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
X-List-Received-Date: Fri, 15 Dec 2017 16:57:07 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 7993498..ab126ad 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk41"
+PR_append = "-tisdk42"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -8,6 +8,8 @@ EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
 EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"
 
+EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
+
 EXTRA_PACKAGES_append = " zbar hidapi"
 
 UTILS_append = " net-snmp net-snmp-server-snmpd"
-- 
1.9.1



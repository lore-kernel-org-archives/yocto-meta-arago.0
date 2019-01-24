Return-Path: <sam.nelson@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F34D35297E
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2019 11:23:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0OBNPLG025386
	for <meta-arago@arago-project.org>; Thu, 24 Jan 2019 05:23:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1548329005;
	bh=H5FuRl+oXrd9DRconFbsIcwRrxKgAv+B6KfJd2hwaTw=;
	h=From:To:CC:Subject:Date;
	b=r+T3vcK/AOcxK+VKtgZAs0eyY4hZxdUtv+jrdN2sOQ5UKRGAjsjx7INfdhU75c5uK
	0Mu3bqZAmJHsQbkkrwrqt+z84WR65MOtrJHLdtww+6FPvg9tZAw6sTlRXoeW0Bp0US
	NdeVabxVMZnHbUC6KBFx95sV+bbcI2kVQTbb2uhY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0OBNObJ040948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 24 Jan 2019 05:23:25 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 24 Jan 2019 05:23:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 24 Jan 2019 05:23:24 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0OBNOn4019274;
	Thu, 24 Jan 2019 05:23:24 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>, <m-radhakrishnan2@ti.com>
Date: Thu, 24 Jan 2019 06:23:19 -0500
Message-ID: <1548328999-29980-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][master] PATCH] static-analysis: Fix error in handling static analysis enable
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
X-List-Received-Date: Thu, 24 Jan 2019 11:23:44 -0000
Content-Type: text/plain

Note that the recipe specific STATIC_ANALYSIS_ENABLE variable is set to
'1' or '0' depending on enable/disable and hence the check should be
done accordingly.
Without this fix, recipes in STATIC_ANALYSIS_DISABLE_RECIPE gets enabled
for static analysis

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 classes/static-analysis.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/static-analysis.bbclass b/classes/static-analysis.bbclass
index 3903639..5e532c1 100644
--- a/classes/static-analysis.bbclass
+++ b/classes/static-analysis.bbclass
@@ -99,7 +99,7 @@ static_analysis_postbuild[dirs] += "${STATIC_ANALYSIS_POSTBUILD_DIRS}"
 #  calling this script with the static analysis command.
 #
 def static_analysis_compile_wrapper(d):
-    if (d.getVar('STATIC_ANALYSIS_ENABLE', True)):
+    if ((d.getVar('STATIC_ANALYSIS_ENABLE', True)) == '1'):
         cwd = None
 
         # Make a copy of do_compile
-- 
1.9.1



Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BE1F35298B
	for <meta-arago@arago-project.org>;
	Wed, 17 Apr 2019 22:11:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3HMAr9X105078
	for <meta-arago@arago-project.org>; Wed, 17 Apr 2019 17:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555539053;
	bh=aPjm9UB7p3TjEYkuc7CEwuOSaIt358YENB7u1oXoKwY=;
	h=From:To:CC:Subject:Date;
	b=x+8dPB+nhNsafXVnzFf6E4Q4bpNqAIS7PtgF+RpOJLrXEEjCuxZrRodBNrz3tj4Wk
	/X7zHiVk7f4h9fVRj5Ori80w5Z4HlqmfuSJl0fM9qokVrkSBbnf181hIlg+5RWaxhJ
	XnRuiB/KBAbClTjbxoNJH3LnKkFq/g2FlGDSx2sM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3HMArh3059693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 17 Apr 2019 17:10:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Apr 2019 17:10:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Apr 2019 17:10:53 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3HMAqgw047438;
	Wed, 17 Apr 2019 17:10:52 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Apr 2019 18:10:41 -0400
Message-ID: <1555539041-6536-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] pru-adc: bump SRCREV to get the change for resizing the terminal
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
X-List-Received-Date: Wed, 17 Apr 2019 22:11:16 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-apps/pru-adc/pru-adc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-apps/pru-adc/pru-adc_git.bb b/recipes-apps/pru-adc/pru-adc_git.bb
index 86148da..807e685 100644
--- a/recipes-apps/pru-adc/pru-adc_git.bb
+++ b/recipes-apps/pru-adc/pru-adc_git.bb
@@ -9,12 +9,12 @@ inherit update-alternatives
 COMPATIBLE_MACHINE = "am335x-evm"
 
 PV = "1.0"
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/apps/tida01555.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "7cbdf20ed44eb6486137e3866e43eec39eb7a468"
+SRCREV = "0a0f7700d11ec8a6b7ed02e4c70d4bf196ca35e5"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5F47F52CA8
	for <meta-arago@arago-project.org>;
	Tue, 13 Apr 2021 04:46:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lCZx035344;
	Mon, 12 Apr 2021 23:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289232;
	bh=3rx8Edalf97VBitIq7n9DMOi7W2zdEozQhpi6l2/lhM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DdmceSODP0HpZyok3wB1tI81Hx67bsFDputGiRA8+nCoM9m6Cu8TA/fW2ObUwuCO/
	/TeUub0NGtGRdn1wsULQTjURhk3IlfVRQiZppalZEhaxmtGT70m0+RCV8p1uxovSkO
	AU75a/fah+OEGOSKnKMYqbd0zopsL9YTRk+bapmE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4lCQr005867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:47:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 12 Apr 2021 23:47:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 12 Apr 2021 23:47:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lCnH111747;
	Mon, 12 Apr 2021 23:47:12 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Mon, 12 Apr 2021 23:47:10 -0500
Message-ID: <20210413044711.12576-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413044711.12576-1-praneeth@ti.com>
References: <20210413044711.12576-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH 2/3] Revert "branding: core-next: AUTOREV kernel and uboot"
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
X-List-Received-Date: Tue, 13 Apr 2021 04:46:49 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit 3d81e5add1f7173e34a4fbc189bf56872969fc98.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../conf/distro/include/branding-core-next.inc              | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
index a2667a70..3828a8d7 100644
--- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
@@ -6,9 +6,3 @@ PREFERRED_VERSION_linux-ti-staging = ""
 PREFERRED_VERSION_linux-ti-staging-rt = ""
 PREFERRED_VERSION_linux-ti-staging-systest = ""
 PREFERRED_VERSION_u-boot-ti-staging = ""
-
-# Auto rev important packages to pick up latest
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
-SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-- 
2.17.1



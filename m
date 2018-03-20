Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 193C5529B1
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 19:00:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KIxIQa016129
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521572358;
	bh=GJ8ZNfW0WG5UzB6xC1fiuN1Cl0fNR/78ggQFwZEd0t4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UCWnYYJJv7Uytk1/rMN3FbqfHrAaBHAy5/N5mQJwg57ZQ908mwYSW+Ulgk3C8EHIx
	yUR8T3e2+527ufaOOtBrjiS28w9zBOepFC4L9Gy8jC47aGio5fIOvwQM6Ufr4kI853
	tMNT/8smncDpHB0FrCxRIjtSL7dc16Q8XJ3zMa2g=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIxIel009109
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:18 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 13:59:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 13:59:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIxHvx022092
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Mar 2018 14:59:14 -0400
Message-ID: <1521572354-30785-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521572354-30785-1-git-send-email-e-ruei1@ti.com>
References: <1521572354-30785-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 2/2] Revert "packagegroup-arago-tisdk-matrix: add video-graphics test"
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
X-List-Received-Date: Tue, 20 Mar 2018 19:00:18 -0000
Content-Type: text/plain

This reverts commit ef52bfe3669a6130b699df284d6ae4b25b0b6487.

Remove video-graphics test from matrix gui because there is no exit
mechanism provided.
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index cf86727..67241fa 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -11,7 +11,6 @@ MATRIX_COMMON_APPS_remove = " \
 MATRIX_APPS_append_omap-a15 = " \
     matrix-gui-apps-dual-camera \
     matrix-gui-apps-image-gallery \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'matrix-multimedia-demo-video-graphics', '', d)} \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
-- 
1.9.1



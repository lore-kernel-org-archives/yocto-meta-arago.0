Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 221B452990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:37:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFbkFD008053
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505921866;
	bh=0qrzBPP9HGM6QQJpgOFdUhsjb5up9OZeqSMBmtqGSZE=;
	h=From:To:CC:Subject:Date;
	b=bigkZdgh7r7UBgFIxb3wvfS2ajeDjjO1p+peOlORg0jUBMDIkpgKC2a2tXv0yODd6
	fy/0G1YEuCV+WLFsu8Cqz1/iRP8uypVexSMk8PNC5kaYCzoO99zt94MZs3CGWMS6GG
	t+2sgvbLPCabmSVoBBbmHRxrqGnkARfn1xKiClNM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFbkCv001816
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:37:46 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:37:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:37:46 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFbkUI013820;
	Wed, 20 Sep 2017 10:37:46 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 11:37:42 -0400
Message-ID: <1505921862-28770-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] packagegroup-arago-tisdk-addons: add uio-test-pruss for k2g
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
X-List-Received-Date: Wed, 20 Sep 2017 15:37:47 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 81d9b2f..191f185 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk38"
+PR_append = "-tisdk39"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -29,6 +29,8 @@ UTILS_append_ti33x = " uio-module-drv-test \
                        uio-test-pruss \
 "
 
+UTILS_append_k2g = " uio-test-pruss"
+
 EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
                                    big-data-ipc-demo-linux-firmware \
 "
-- 
1.9.1



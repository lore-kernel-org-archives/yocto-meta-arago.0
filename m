Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A89AB529E2
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa6oJ000374
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484566;
	bh=BNRh7O9e+0maBJexv3LGDMifMYJwWSbe7U3HdwPT+RE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mvnL5+3J3+nYBOS71e7cTDl3K5PUEI23GDTc1QAgwaJL6vKCcYFbaiXPK4BHXkRt8
	bxWsIO7rzMf6i4eTfrM1iLl9JSPYAa3sSFjM9iF+JZj3TK8W7O05BxEq3rgyFuv579
	/zAn+Hw64BpzqZeF2orQFm6g9fe5pygsh4WgR624=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa6SB010030
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:05 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4SA009580;
	Mon, 19 Mar 2018 13:36:05 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:38 -0400
Message-ID: <1521484541-8104-4-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 3/6] [PATCH] packagegroup-arago-tisdk-addons-sdk-host: add tiovx-app-host-src
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index b8d7bca..8b18684 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk8"
+PR_append = ".tisdk9"
 
 EXTRA_LIBS_append_am57xx-evm = " \
     jailhouse-src \
@@ -11,3 +11,7 @@ EXTRA_LIBS_append_keystone = " \
 UTILS_append_k2g = " \
     pru-icss-src \
 "
+
+EXTRA_LIBS_append_dra7xx = " \
+    tiovx-app-host-src \
+"
-- 
1.9.1



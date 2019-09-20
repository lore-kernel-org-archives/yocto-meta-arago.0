Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 77E6552974
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 14:58:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KEvbxA112860
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 09:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568991457;
	bh=5lZ5dOnLI7o1JGBQDvNwPhijBL6hLgJUmPe9bi2G7hc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NNZg18FIGXkN2NwNAS3BjLzDlt1QHJ+D2X9umizPtoxw44Q9JlVD7S2D85bvfTIpb
	Dt+PW9zg+DEgb7NHI46D0lb8rKbXV6lBWqT0t13madB/lfkbO3fZVF9begQNQvpEoh
	vEt+Ns0mK9ZfgGsDKTkDN0GGLsEQe7pEzeKcsVpQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KEvbrH028497
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 09:57:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 09:57:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 09:57:32 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KEvaIS071947;
	Fri, 20 Sep 2019 09:57:36 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Sep 2019 10:56:21 -0400
Message-ID: <20190920145621.1764-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920145621.1764-1-a0271529@ti.com>
References: <20190920145621.1764-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/2] packagegroup-arago-tisdk-addons*: remove tensorflow-lite which is now upstreamed.
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
X-List-Received-Date: Fri, 20 Sep 2019 14:58:46 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend  | 7 +------
 .../packagegroup-arago-tisdk-addons.bbappend             | 9 ++++-----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 72f58b1..6cd7f4d 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk32"
+PR_append = "-tisdk33"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -76,8 +76,3 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-lib-host-staticdev \
     tiovx-sys-iface \
 "
-
-EXTRA_PACKAGES_append_ti33x = " tensorflow-lite-dev tensorflow-lite-staticdev"
-EXTRA_PACKAGES_append_ti43x = " tensorflow-lite-dev tensorflow-lite-staticdev"
-EXTRA_PACKAGES_append_omap-a15 = " tensorflow-lite-dev tensorflow-lite-staticdev"
-EXTRA_PACKAGES_append_am65xx = " tensorflow-lite-dev tensorflow-lite-staticdev"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 90440d8..35c6e7e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,9 +1,8 @@
-PR_append = "-tisdk57"
+PR_append = "-tisdk58"
 
-EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite-examples"
-EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite-examples"
-EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite-examples"
-EXTRA_PACKAGES_append_am65xx = " tensorflow-lite-examples"
+EXTRA_PACKAGES_append_ti33x = " opencv"
+EXTRA_PACKAGES_append_ti43x = " opencv"
+EXTRA_PACKAGES_append_omap-a15 = " opencv"
 EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
-- 
2.17.1



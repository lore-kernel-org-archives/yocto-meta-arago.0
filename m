Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B9FDA52A0C
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 17:09:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KH9GW8023254
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505927356;
	bh=mpi4eCz23uu+hG55PHF3GtiOuL0IZmrcXBJTMZAJ8+Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o41BuVpKuzoNhWlYowgOzHUJ1fnfQZZB0cv3XSypb6yPt5fLdRT+5Dcprq7G5LZP5
	Ui+FS98QNmAOaJ2w3JMafPb00YKf+Y9HNPov7wgLuWTcpi9QK7A+35mgWrtsLH6JuT
	FUIS6+9eJxdSOEFjxFhXGlh18BFrUEamCQND/R/8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KH9GCv029204
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 12:09:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 12:09:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 12:09:16 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KH9CE5029363;
	Wed, 20 Sep 2017 12:09:16 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 13:09:07 -0400
Message-ID: <1505927347-1586-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1505927347-1586-1-git-send-email-a0271529@ti.com>
References: <1505927347-1586-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 2/2] packagegroup-arago-tisdk-addons: add ccief-basic
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
X-List-Received-Date: Wed, 20 Sep 2017 17:09:17 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
Please apply this patch after applying "[PATCH] packagegroup-arago-tisdk-addons: add uio-test-pruss for k2g"

 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 191f185..91e92ff 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk39"
+PR_append = "-tisdk40"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -8,7 +8,7 @@ EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
 EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"
 
-EXTRA_PACKAGES_append = " zbar hidapi"
+EXTRA_PACKAGES_append = " zbar hidapi ccief-basic"
 
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
-- 
1.9.1



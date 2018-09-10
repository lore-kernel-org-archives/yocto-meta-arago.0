Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AD8AC52A69
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 19:08:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AJ8prW016972
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 14:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536606531;
	bh=neJe1c1NypHtfPbNoAq7cd+8PqkDzxpZFyy0gL6pCEM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f8y2Ksdq10VpgHz5BnXORWbUPvD7D5GJek9OQP0SZWepvxkyDFeEHvfer3lFm6JKe
	7BCGdWGWAue/MjALiyRrAgcxKI/hHJJgJWvrbdURHNg9fZz8g97s8RjzPMOVY1+U5/
	YfWaZdlpVmzGvgZKBmHrl99pNewhiVS9BcQoXcp4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AJ8pxs018909
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 14:08:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 14:08:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 14:08:51 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AJ8lQf031584;
	Mon, 10 Sep 2018 14:08:51 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 15:08:45 -0400
Message-ID: <1536606525-450-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536606525-450-1-git-send-email-a0271529@ti.com>
References: <1536606525-450-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/2] [PATCH] packagegroup-arago-tisdk-addons-sdk-target: add pru-icss for am335x-evm
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
X-List-Received-Date: Mon, 10 Sep 2018 19:09:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 682c53d..8351352 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk30"
+PR_append = "-tisdk31"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -58,6 +58,8 @@ EXTRA_LIBS_append_am335x-evm = " \
     pruss-lld-staticdev \
     icss-emac-lld-dev \
     icss-emac-lld-staticdev \
+    pru-icss-dev \
+    pru-icss-staticdev \
 "
 
 EXTRA_LIBS_append_am437x-evm = " \
-- 
1.9.1



Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 58C4452986
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2019 18:20:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIJORU014024
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2019 13:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570731564;
	bh=0WQm1d1hx2vEBr4T9OJHChoilMtjOud+ZXlM7XX8UVk=;
	h=From:To:CC:Subject:Date;
	b=uZkTFGRRvU1jas/3mdSe/PYg7tYO36H56G68+6S21gRQGN86BXY1K7DXNAFhpV7UQ
	r5GA5ZRbXby2I0a2YLz5mVxj2tZT4Fp2dq3pjcwLpEoeOha4zKDaSDudtxKyShUn+D
	K4aZHtn4mp7XEEl8gP4kKIlTPkJUCj0lNGiLowss=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AIJOH6073430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2019 13:19:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 10 Oct 2019 13:19:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 10 Oct 2019 13:19:19 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIJMWw021882;
	Thu, 10 Oct 2019 13:19:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2019 14:00:29 -0400
Message-ID: <1570730429-13500-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] python3-decorator: extend to nativesdk
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
X-List-Received-Date: Thu, 10 Oct 2019 18:20:38 -0000
Content-Type: text/plain

* Extend to nativesdk for nativesdk-tvm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* Needed for http://arago-project.org/pipermail/meta-arago/2019-October/011996.html

 recipes-devtools/python/python3-decorator_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-devtools/python/python3-decorator_%.bbappend

diff --git a/recipes-devtools/python/python3-decorator_%.bbappend b/recipes-devtools/python/python3-decorator_%.bbappend
new file mode 100644
index 0000000..0d0c76f
--- /dev/null
+++ b/recipes-devtools/python/python3-decorator_%.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "nativesdk"
-- 
2.7.4



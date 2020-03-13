Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A5904529D8
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2020 20:59:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DKvK7J053426
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2020 15:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584133040;
	bh=Z2YuFPvFNMZbsq48seq5pz4lcDVFz6u3kPyqrTQ6tKM=;
	h=From:To:CC:Subject:Date;
	b=zExbAnAoOraZhgFBwcZ0T0d0sJWhfX3fIMpzIN2vMnbeqdPLdgsUw2l/mWuDOpLDc
	vVTE7EepUZjcWUTIwmcIs/4y9BsH1DC5WRrWl4ew+xIuCPbNteC5h6mkbgKAeWbXtM
	oeTGbcTwPsgyryTLZ7NE9zxvZjTZqDxH9qwueo1k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DKvKAQ029754
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2020 15:57:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 13 Mar 2020 15:57:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 13 Mar 2020 15:57:19 -0500
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DKvJth076998;
	Fri, 13 Mar 2020 15:57:19 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2020 16:53:22 -0400
Message-ID: <20200313205322.21648-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] neo-ai-tvm: remove from nativesdk
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
X-List-Received-Date: Fri, 13 Mar 2020 20:59:27 -0000
Content-Type: text/plain

* plsdk-3143: neo-ai-tvm code generation in nativesdk is not working and it is not required by any functional requirement.

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../nativesdk-packagegroup-arago-tisdk-host.bbappend             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
index a3c1a8b..d858b37 100644
--- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
@@ -1,3 +1,2 @@
 PR_append = ".tisdk1"
 
-EXTRA_TI_TOOLS_append = " nativesdk-neo-ai-tvm"
-- 
2.17.1



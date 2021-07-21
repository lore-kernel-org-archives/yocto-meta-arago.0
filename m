Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id F34A752A0F
	for <meta-arago@arago-project.org>;
	Wed, 21 Jul 2021 14:41:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16LEfioG058010;
	Wed, 21 Jul 2021 09:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626878504;
	bh=ggQy6KKLbuY1Zm4wEFRH8ZNE70z9Ddf9DdmzuXLVXfU=;
	h=From:To:CC:Subject:Date;
	b=UmTDHztuUG8LQ/pguORjSWwsGslSn6sb+r51Fuu3BbYHNW3ecpAIfKtCMEShL5a/J
	ALbe7DfL4kqZXZ1olvIiB4pY610UpbWNTQ/UnrilbnuwL/4lqb1/ZXeKkd1F8MCbGF
	O4BWAaGpHRGq3jQX/1GWj6FP7ZZ9Z8yyRdbrd488=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16LEfiZ2107047
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jul 2021 09:41:44 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 21 Jul 2021 09:41:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 21 Jul 2021 09:41:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16LEfiJ9002323;
	Wed, 21 Jul 2021 09:41:44 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Wed, 21 Jul 2021 09:41:43 -0500
Message-ID: <20210721144143.4582-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH] config-build-env: Fix missing space
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
X-List-Received-Date: Wed, 21 Jul 2021 14:41:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix the missing space in the "if" statement else giturl is never
updated.

This generates:
./lib/oesdk/config-build-env: line 53: [: missing `]'

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 2514acbe6b38..7f914bab9984 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -50,7 +50,7 @@ checkout_layer_scripts() {
 	# In case we have changed the location of our build scripts
 	# we should change our git url towards it.
         mygit='git remote get-url  origin'
-        if [ "$mygit" != "$TI_SDK_OELAYER_SETUP"]; then
+        if [ "$mygit" != "$TI_SDK_OELAYER_SETUP" ]; then
             echo "$TI_SDK_OELAYER_SETUP Mismatch in git URL: $mygit vs $TI_SDK_OELAYER_SETUP. Force resetting the origin!"
             git remote set-url origin $TI_SDK_OELAYER_SETUP
         fi
-- 
2.32.0



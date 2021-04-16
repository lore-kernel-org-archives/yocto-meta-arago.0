Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id B2FCD52BA1
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 19:30:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GJUsfp045894;
	Fri, 16 Apr 2021 14:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618601454;
	bh=Vp1s6t00dMYmqfubnEr0eXH+8j4G2AvVIEKBwEIVAMs=;
	h=From:To:CC:Subject:Date;
	b=SJG3Q/CiRSe860thIbze3zidjgQXP6RaN+afGYrf2+mL2D5s8TwJA3OjkXa3PThLj
	LmWBsBW8OAO3zijGlcYOq3hwwdtWZZ40+WBOWHXbY1Fj++LErw2VrJjsn7FCxj4OIl
	WXQEXO8xt7RY1Oybw3yr4PLJgjtaiHisrNRaTMoo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GJUs7m094344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 14:30:54 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Apr 2021 14:30:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 16 Apr 2021 14:30:54 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GJUslf094960;
	Fri, 16 Apr 2021 14:30:54 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13GJUsv2096409;
	Fri, 16 Apr 2021 14:30:54 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Fri, 16 Apr 2021 14:30:53 -0500
Message-ID: <20210416193053.31664-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] ti-test: fix string expansion
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
X-List-Received-Date: Fri, 16 Apr 2021 19:30:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

bb conditional util expansion was done in '' causing the below error

```
bb.data_smart.ExpansionError: Failure expanding variable ARAGO_TI_TEST, expression was ... ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} cmem-test     ', d)}
which triggered exception SyntaxError: invalid syntax (Var <ARAGO_TI_TEST>, line 1)
```

fixed the expansion to within "".

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 5b04d85c..cbc246d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -68,11 +68,11 @@ ARAGO_TI_TEST_append_ti43x = " \
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
         ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
         cmem-test \
-    ', d)} \
+    ", d)} \
 "
 
 ARAGO_TI_TEST_append_k3 = " \
-- 
2.31.1



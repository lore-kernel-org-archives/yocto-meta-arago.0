Return-Path: <aparnab@aparnab-office>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id BC0AA529C8
	for <meta-arago@arago-project.org>;
	Fri, 26 Mar 2021 18:04:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12QI4OeP018756
	for <meta-arago@arago-project.org>; Fri, 26 Mar 2021 13:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616781864;
	bh=Ng563JWD1bM75ckyMzSOnwK751htfOIuMNpkYPF/L2U=;
	h=From:To:CC:Subject:Date;
	b=Ivj9iOc0v0nVhSb3bHQqik4CHpu7PiGJ6fGbmVZUAiBWkNWzdcwpfGh8mUiGpG80L
	ktKDrbsEWQ1xOOnjcGeQgq5XzkIOP+dcwnFDqCgJf3YJ0R8FEG0HGqivy4CxLkxbZh
	BxOxSZawFq8xWelql+ATtxxu1edk/iWwnFfRRuHU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12QI4OdZ068209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 26 Mar 2021 13:04:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 26 Mar 2021 13:04:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 26 Mar 2021 13:04:24 -0500
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12QI4OOD042925;
	Fri, 26 Mar 2021 13:04:24 -0500
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1lPqoq-00009N-33; Fri, 26 Mar 2021 13:04:24 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Fri, 26 Mar 2021 13:04:17 -0500
Message-ID: <20210326180417.534-1-aparnab@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aparna Balasubramanian <aparnab@ti.com>
Subject: [master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 26 Mar 2021 18:04:06 -0000
Content-Type: text/plain

Update includes addition of rgx test for 8k texture support and gpio
pin numbers fix for am64 platforms.

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index be8bea98..7c9d50fd 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r12"
+PR = "r13"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "3543cba63326976b5fb184c88b56158e91b7626a"
+SRCREV = "31f9cfa61ae4102da6fa87f624130096c09d63a2"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1



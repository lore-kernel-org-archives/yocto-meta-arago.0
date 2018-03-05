Return-Path: <jjhiblot@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 633AB52976
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 11:16:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25BFcoZ019370
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 05:15:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520248538;
	bh=BnKI7Jli2w4kg/bd4PyDutrzr8yVaqPfHUyYowtHRGs=;
	h=From:To:CC:Subject:Date;
	b=TVSFOxDn4HDW29J+eTLNe6b/OuaJM2Q45nY+wq4rI0gY8Bdi2FCaVN8FBuidAUBk6
	iG3uFuKYToQWzXUUSi9Bb02//eo/C6vwIoifKaIWMyMInxrxZdzuTK6uXoFyEk/a+3
	SsZnfqyxkedXG2N/vEHWeBSk03lPV1mNAyglNM/8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25BFcgJ021097
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 05:15:38 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 05:15:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 05:15:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25BFa4Y022089;
	Mon, 5 Mar 2018 05:15:37 -0600
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Mon, 5 Mar 2018 12:15:35 +0100
Message-ID: <1520248535-1258-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ltp-ddt: Add missing run-time dependency to memtester
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
X-List-Received-Date: Mon, 05 Mar 2018 11:16:18 -0000
Content-Type: text/plain

The MEMORY lpt-ddt tests use memtester to run stress tests on the memory.
Make sure it is available in the file system.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index 3626175..29a2223 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -34,6 +34,7 @@ RDEPENDS_${PN} = "\
     util-linux \
     which \
     libgcc\
+    memtester\
 "
 
 inherit autotools-brokensep
-- 
1.9.1



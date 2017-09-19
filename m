Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 65DE952990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 16:02:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JLfjED020173
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505857305;
	bh=BpsXCs9JQAI3YX8+RFlY0nP9kM5r6hirnQsxgI6S6Kw=;
	h=From:To:CC:Subject:Date;
	b=lfQbq5WtGiNgdPPJ5MaSk+S2FsjxfpRHtmrfkW1dzX/p3PeFuTWxZrR7TkPr59bVy
	vYcVU272neCHvv9Ag/V/ahxv9cqBZ8tFh5HcBQCPCsx9DcPvhCOPfOU9JlnrgzWjX4
	50LYIaMxHUgWAZ9krPLDLM+UqVZCzNtdJv9rH59Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLfeYN016489
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:41:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 16:41:39 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 16:41:39 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLfdL1032450;
	Tue, 19 Sep 2017 16:41:39 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1duQGx-0004ui-Aw; Tue, 19 Sep 2017 16:41:39 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Sep 2017 16:41:36 -0500
Message-ID: <20170919214136.18852-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1] protection-relays-hmi : SRCREV update for truncated text fix
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
X-List-Received-Date: Wed, 20 Sep 2017 16:02:11 -0000
Content-Type: text/plain

protection-relays-hmi demo has two fixes-
1. Adjust font size to fit the text in AM335x Starter Kit EVM
2. Force the display  screen order to start with index 0

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
index 7ef73e6..67d42fa 100755
--- a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
+++ b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -10,7 +10,7 @@ PR = "r0"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
+SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.0



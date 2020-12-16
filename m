Return-Path: <aparnab@aparnab-office>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id A7F50529C5
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2020 17:19:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BGHJTUP088248
	for <meta-arago@arago-project.org>; Wed, 16 Dec 2020 11:19:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608139169;
	bh=LAtg0YKl6+FueyFpTGstj8GHfVugdgaNBQLtDEaHGrg=;
	h=From:To:CC:Subject:Date;
	b=GC0vlDSY51mAo78yryT9Ec0FF0uBbmQ7UOqnDxXcknsNqgLKrqfbatvM8BDSqU/id
	3LxMJFSXJCxkNcBddsDT+Dy5pLQpJzxUIaCvM/afut05NQ0uvpFhOUlHVDQjB3brmS
	b18xQhi9UlwjEpaaue1BoEyWp1JnhE3t+HbG/Ssw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BGHJTEM069144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 16 Dec 2020 11:19:29 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 16 Dec 2020 11:19:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 16 Dec 2020 11:19:29 -0600
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BGHJSIk077095;
	Wed, 16 Dec 2020 11:19:28 -0600
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1kpaSW-0001Vq-NT; Wed, 16 Dec 2020 11:19:28 -0600
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <dmurphy@ti.com>
Date: Wed, 16 Dec 2020 11:19:12 -0600
Message-ID: <20201216171912.5771-1-aparnab@ti.com>
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
X-List-Received-Date: Wed, 16 Dec 2020 17:19:36 -0000
Content-Type: text/plain

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 56eb4250..fbb671cc 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r8"
+PR = "r9"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "d82d554074a480fa59a458c9690171fc46312e0d"
+SRCREV = "ff608b6191a03ff7c0a9a350a017466a5f2bbf01"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1



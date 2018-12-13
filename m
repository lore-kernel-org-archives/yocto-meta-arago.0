Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9002852A18
	for <meta-arago@arago-project.org>;
	Thu, 13 Dec 2018 20:57:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBDKuvSF094524
	for <meta-arago@arago-project.org>; Thu, 13 Dec 2018 14:56:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544734617;
	bh=5e3xINRJvaXVXrclt9F7ZzLOIaBXzQPPEMY4QGYdDC8=;
	h=From:To:CC:Subject:Date;
	b=kLklh9MCx9PnOg8SS39xVbuZz5YTb3GBZtYVqsSmY9SCR0R7z4OyAJdq/nDGIlabU
	8ubZOUpejMcTx7yR565e5wECQSibHdNwJaqjyPransGa2Qk0QW4/GcBpS9+6i611fj
	0edWXeR+S9+V/xPuD65jPJDommZ7Xe92WSOpFtAM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBDKuvUo009934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 13 Dec 2018 14:56:57 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 13 Dec 2018 14:56:56 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 13 Dec 2018 14:56:56 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBDKuuZY028388;
	Thu, 13 Dec 2018 14:56:56 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXY2S-0002YM-Kc; Thu, 13 Dec 2018 14:56:56 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Dec 2018 14:56:54 -0600
Message-ID: <20181213205654.9778-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v1] mmwavegesture-hmi : bump SRCREV for bug fix
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
X-List-Received-Date: Thu, 13 Dec 2018 20:57:09 -0000
Content-Type: text/plain

Bug fix for double free memory corruption and QSocket error seen on
AM57x devcie.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
index bece51f5..e4ccba48 100644
--- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
@@ -10,7 +10,7 @@ PR = "r0"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "e8ca95ca63d891442d55aba95a01342f0b7bdd63"
+SRCREV = "c6052e1cd1079b09bef78cdcd8e5151133c3b4e1"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.0



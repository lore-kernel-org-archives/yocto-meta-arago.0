Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2062952991
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 22:29:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEMTlWA098000
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:29:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544826587;
	bh=mbAPDhBdUktURkrcaxYJbttrZSVv7ZxCm08i03cJATA=;
	h=From:To:CC:Subject:Date;
	b=Tpzn6ce/fdiYcLbmTx83/x3OdRkUiDiH2c5MuyyNCwkfJFcJB1vwjC29JXCpLAMna
	2qILVmHpn6ruhcjZ+80N+FEpWzX9m5dfsEbhDV06GrsfW58w1uj/syTDC3pf2YqUq2
	nVhpZes/ODJ3IUEWOaXyjckkkb8/nIVmSUIx4mcw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEMTlGC076365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:29:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 16:29:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 16:29:46 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEMTkOT000508;
	Fri, 14 Dec 2018 16:29:46 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXvxq-0004rw-P0; Fri, 14 Dec 2018 16:29:46 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 16:29:42 -0600
Message-ID: <20181214222944.18680-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next-rel][PATCH v1 1/3] mmwavegesture-hmi : bump SRCREV to add Makefile.build
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
X-List-Received-Date: Fri, 14 Dec 2018 22:30:00 -0000
Content-Type: text/plain

Add Makefile.build to enable the demo build through Processor SDK Linux

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
index e4ccba48..cd2ae864 100644
--- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
@@ -10,7 +10,7 @@ PR = "r0"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "c6052e1cd1079b09bef78cdcd8e5151133c3b4e1"
+SRCREV = "0881fc8bc5b3c3411af7b69c3837a8b3a1fbedc5"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.0



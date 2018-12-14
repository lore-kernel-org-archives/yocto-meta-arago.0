Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 39CA552A76
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 22:45:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEMip9h108251
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544827491;
	bh=mbAPDhBdUktURkrcaxYJbttrZSVv7ZxCm08i03cJATA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uWnbY52++P4LVflqD97CPNy5g9sSECLoICiRHy0XKGgNCkx0ulL7Io7WFF+9yxCBC
	KDelh9QXOM2Ttuo37+ldK6ugmwj9Lc982uJ6po4Ynvp8AbQ3HHehxIeNP4SLp9iwLl
	jbo80lFYR22w6UcWy2iolfbj2Y7jBq6D2ctySUcE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEMip47020224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 16:44:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEMipOb001316;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXwCR-0004xK-0G; Fri, 14 Dec 2018 16:44:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 16:44:47 -0600
Message-ID: <20181214224449.19010-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181214224449.19010-1-manisha.agrawal@ti.com>
References: <20181214224449.19010-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko-next-rel][PATCH v2 2/4] mmwavegesture-hmi : bump SRCREV to add Makefile.build
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
X-List-Received-Date: Fri, 14 Dec 2018 22:45:04 -0000
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



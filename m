Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0E635529AE
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 20:57:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6OKvC2E048803
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 15:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532465832;
	bh=8J5Lr07syoIpGs2mP+TDBQ5rrcFvpKyOgC0UhOaaWkM=;
	h=From:To:CC:Subject:Date;
	b=zA4kDNaz6SHbGPFsaeafq+GkeLfEDfYrJfu7j3H6iySJ94UQigDqoO94H3lHiILHY
	oIpF7fIFkcDqwK4yqZWTxG0sEN6OpDL0IPVKR7B/1+1P6YAFXQyA+jb7OxxBYRCZ41
	6kiQh0YpKKV/7GRv2rq2Fz4H9g0y84hQXOqJZK5A=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OKvCFU022966
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 15:57:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 15:57:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 24 Jul 2018 15:57:11 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OKvBF7027183;
	Tue, 24 Jul 2018 15:57:11 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 24 Jul 2018 16:57:08 -0400
Message-ID: <1532465828-3221-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCHv2] tidl-api: Update test video clip (subject line fixed)
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
X-List-Received-Date: Tue, 24 Jul 2018 20:57:19 -0000
Content-Type: text/plain

* Use real-life video clip and list of classes

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index d2b570d..f1a34eb 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
+SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
-- 
1.9.1



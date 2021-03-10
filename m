Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 150AA52A70
	for <meta-arago@arago-project.org>;
	Wed, 10 Mar 2021 20:05:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AK5j5A089638
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 14:05:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615406745;
	bh=oVdeUgIxNbnqimNUixrGq1+SATIKaMlvS3HePMqIy6I=;
	h=From:To:CC:Subject:Date;
	b=R/bdUE3pD1MJ0B2NzL9/auBFSNzsjzghRNRB2Q4ehLYkaR7vMZSARBlZ1gnRmP9so
	3JvlZUqZ8CIIOHDOdG2HB37d17HIygYxgt9pvFSj+R4WU5GLLbi3gnPggvZft7wQlw
	wZrQno5HstrrQSbaz/n8NFV5e+rNti8vkQv8WFMk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AK5iMW089910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 14:05:44 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 10 Mar 2021 14:05:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 10 Mar 2021 14:05:44 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AK5gaY063764;
	Wed, 10 Mar 2021 14:05:43 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Thu, 11 Mar 2021 01:35:26 +0530
Message-ID: <20210310200526.6075-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell][PATCH] websocketd: update SRCREV to latest tag
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
X-List-Received-Date: Wed, 10 Mar 2021 20:05:30 -0000
Content-Type: text/plain

Update commit ID for websocketd to latest tag v0.4.1

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../websocketd/{websocketd_0.3.1.bb => websocketd_0.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-extras/recipes-devtools/websocketd/{websocketd_0.3.1.bb => websocketd_0.4.1.bb} (91%)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
similarity index 91%
rename from meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
rename to meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index d2f33873..f17f9d6e 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -8,7 +8,7 @@ inherit go-mod
 GO_IMPORT = "github.com/joewalnes/websocketd"
 
 SRC_URI = "git://${GO_IMPORT}"
-SRCREV = "0440211d7862dc76b5f2499d7dfcd4ef6a9c2fa2"
+SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 
 # bitbake only exports proxy variables during fetching, but go handles
 # module fetching on its own during compile and needs proxy settings
-- 
2.17.1



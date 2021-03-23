Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 4B4245299C
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 16:02:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NG2ea2123310;
	Tue, 23 Mar 2021 11:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616515360;
	bh=31G/8WJDj6eVLgyNZ9dITaxzx+2zKs2BoYNsgNI8d2k=;
	h=From:To:CC:Subject:Date;
	b=j6ugqs2DbbyhVr7PG1c5SOq32/Pwd7yOURty9ULpaaV+KdtxIHcz+spo40++p7K6a
	0TzKjRCU/JSdEzOZCVEA9RSA25MjswNvR1Kww5jWpP9xYyveKhg5qSNHivjo+Re+cK
	z8oS7btLCdJfVvsGKDJOpByBzlYfrrEEJjr5jczs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NG2edT071167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 11:02:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 23 Mar 2021 11:02:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 23 Mar 2021 11:02:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NG2dSW083513;
	Tue, 23 Mar 2021 11:02:39 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Tue, 23 Mar 2021 11:02:39 -0500
Message-ID: <20210323160239.22613-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: [dunfell PATCH] layer.conf: remove releases before dunfell as compatible
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
X-List-Received-Date: Tue, 23 Mar 2021 16:02:22 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This follows commit 00eb3341 ("layer.conf: remove releases
before dunfell as compatible") from meta-ti.

removing older than dunfell releases.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 2931bf9d..9abd5eee 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-distro = "dunfell"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 7e3081b2..3c33bc37 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-extras = "dunfell"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
-- 
2.17.1



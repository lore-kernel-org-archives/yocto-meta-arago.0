Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AE91E52970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 18:49:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HIkoJY084472
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600368410;
	bh=5+/JXJoyZiTYWD1n22bCITyujeId51bvBoDUnjmTZbE=;
	h=From:To:CC:Subject:Date;
	b=rZG5X0cnJ0/Addsv81JiYNs2HDEXsh3wCq+qd18atYwion2RDENcLpPJXETcqirwQ
	3hS3XAe+WXBRUuyZRTjoY+1+ykVdZaEKHc4C0Xz4ynvC1urSVec3Z4wFcQZXBKrWFE
	o7XNzbK28jzmrQlFRTnl1Q5rQ5LFoRUX1aFvZVpo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HIkodC113125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:46:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 13:46:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 13:46:50 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HIkoFR008891;
	Thu, 17 Sep 2020 13:46:50 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 08HIko4m016836;
	Thu, 17 Sep 2020 13:46:50 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 17 Sep 2020 13:46:46 -0500
Message-ID: <20200917184647.3292-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: k-bhargav@ti.com
Subject: [dunfell][PATCH 1/2] layer conf: Add meta-python2
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
X-List-Received-Date: Thu, 17 Sep 2020 18:49:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

meta-python2 is needed for qtwebengine, so add this to layer conf.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/conf/layer.conf | 1 +
 meta-arago-extras/conf/layer.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 9281ceb5..0c69d433 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -16,6 +16,7 @@ LAYERDEPENDS_meta-arago-distro = " \
     openembedded-layer \
     networking-layer \
     meta-python \
+    meta-python2 \
     qt5-layer \
     meta-arago-extras \
 "
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 7e3081b2..9d06a9f2 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -21,6 +21,7 @@ LAYERDEPENDS_meta-arago-extras = " \
     openembedded-layer \
     networking-layer \
     meta-python \
+    meta-python2 \
     arm-toolchain \
     qt5-layer \
 "
-- 
2.28.0



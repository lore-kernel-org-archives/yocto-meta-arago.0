Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE53CD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:25:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.18594.1710861939163140818
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q19bhOQm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42JFPcYd105821;
	Tue, 19 Mar 2024 10:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710861938;
	bh=oI4Uvu7SmKxG9gFepssGZFB+UT3SkUSVhPKqQhFzRnY=;
	h=From:To:Subject:Date;
	b=Q19bhOQmf4n6c1K5hyMbKSjvP3KC1ILq9huqFmkUPuQ0N5LcHKmtz7BYfi7YpTE7z
	 I6yn+U7n2kg6IEFvqN1ZGKl2ibRY8e5OJPzh4C4O2aBOOf2/xIa5ymhgTtT1sj51Tk
	 PamLbdOIPa9Iso0UHuLlmhaWDuk6/qFrCCJGKrXA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42JFPcxE052232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 10:25:38 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 10:25:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 10:25:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42JFPb36034308;
	Tue, 19 Mar 2024 10:25:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rmbLN-0002Qy-Ip; Tue, 19 Mar 2024 10:25:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] layer.conf: Update LAYERSERIES
Date: Tue, 19 Mar 2024 10:25:37 -0500
Message-ID: <20240319152537.9316-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15242

Update the compatibility to just scarthgap.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer.conf
index bcfbf0de..610c3688 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos = "10"
 
-LAYERSERIES_COMPAT_meta-arago-demos = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-demos = "scarthgap"
 
 LAYERDEPENDS_meta-arago-demos = " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 11218d4c..04e553b4 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-distro = "scarthgap"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 1a415e89..c1c11db9 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-extras = "scarthgap"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index 3d23e5de..ad939dce 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test = "10"
 
-LAYERSERIES_COMPAT_meta-arago-test = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-test = "scarthgap"
 
 # Set a variable to get to the top of the metadata location
 TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
-- 
2.17.1



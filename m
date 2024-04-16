Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B5DC41513
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 19:42:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.30591.1713296549286528956
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 12:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qoqoPmMA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43GJgSxC091852;
	Tue, 16 Apr 2024 14:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713296548;
	bh=IFgDVz4KwvhXCQJNqA7G1d7gAsedWVlTrV15Cpes1oo=;
	h=From:To:Subject:Date;
	b=qoqoPmMAbsDdhyVg6Hs5bYmAqdvZnfoT7jnxCBFxtGxUe2EQtNDlND4bK2w3/wKvN
	 yAAT/2Ov0X15urb6nvO1zthWjsdmd36Wa8YWTfg+aQj70gfHcug4nMRA/8iQSMFgFL
	 Y8wuwI8887z+Xk4nxD5oZg/GW5f/M29HYOrNefiE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43GJgSQX128204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 14:42:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 14:42:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 14:42:28 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43GJgRpU045944;
	Tue, 16 Apr 2024 14:42:27 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rwohH-0004D7-QO; Tue, 16 Apr 2024 14:42:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] conf/layer.conf: Update LAYERSERIES_COMPAT
Date: Tue, 16 Apr 2024 14:42:27 -0500
Message-ID: <20240416194227.16146-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 19:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15294

Update LAYERSERIES_COMPAT to scarthgap and styhead.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer.conf
index bcfbf0de..9c7f92db 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos = "10"
 
-LAYERSERIES_COMPAT_meta-arago-demos = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-demos = "scarthgap styhead"
 
 LAYERDEPENDS_meta-arago-demos = " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 11218d4c..3368b8c0 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-distro = "scarthgap styhead"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 1a415e89..5ab1591f 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-extras = "scarthgap styhead"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index 3d23e5de..20d72c24 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test = "10"
 
-LAYERSERIES_COMPAT_meta-arago-test = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arago-test = "scarthgap styhead"
 
 # Set a variable to get to the top of the metadata location
 TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
-- 
2.17.1



Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8111EE7716E
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 15:10:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.16923.1733325024807603371
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 07:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oY5PlVlw;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4FAJSL1807006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 09:10:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733325019;
	bh=jb4W+eDqgtDXj+Rqt1p90+bFqFU3PUlHhJ18ZrGTjxs=;
	h=From:To:CC:Subject:Date;
	b=oY5PlVlwteg9fxodHBCxSw3sQWx1XdeXOQnM4iXOAGYIYS1SsjwTwAZZTomnOgrbp
	 FMZTVUSp91sD48jjyIyX7evdFinZ/ebKGgHLYBYBNYk/AHVTlrhT3U1C94c/HUJdA3
	 +K+dcoANZr1KusFs/7lJIAXEaA6KSLIb52TI7V5o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4FAJqf041570
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 09:10:19 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 09:10:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 09:10:19 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4FAIPf068726;
	Wed, 4 Dec 2024 09:10:19 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][master][PATCH] conf: layer.conf: Drop scarthgap from LAYERSERIES_COMPAT
Date: Wed, 4 Dec 2024 20:40:09 +0530
Message-ID: <20241204151009.3427132-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Dec 2024 15:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15640

After scarthgap release, oe-core switched to use UNPACKDIR instead
of WORKDIR [1]. Post this change, meta-arago updated all references of
WORKDIR to UNPACKDIR in master branch.

Since, UNPACKDIR changes aren't backported to oe-core:scarthgap, we need to
drop it from LAYERSERIES_COMPAT in meta-arago.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer.conf
index 782c5914..df774b74 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos = "10"
 
-LAYERSERIES_COMPAT_meta-arago-demos = "scarthgap styhead walnascar"
+LAYERSERIES_COMPAT_meta-arago-demos = "styhead walnascar"
 
 LAYERDEPENDS_meta-arago-demos = " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index e6e3817f..d097afa0 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "scarthgap styhead walnascar"
+LAYERSERIES_COMPAT_meta-arago-distro = "styhead walnascar"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index b7390e44..7f976657 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "scarthgap styhead walnascar"
+LAYERSERIES_COMPAT_meta-arago-extras = "styhead walnascar"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index da73fb05..1e94c30d 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test = "10"
 
-LAYERSERIES_COMPAT_meta-arago-test = "scarthgap styhead walnascar"
+LAYERSERIES_COMPAT_meta-arago-test = "styhead walnascar"
 
 # Set a variable to get to the top of the metadata location
 TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
-- 
2.34.1



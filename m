Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8916BC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 20:15:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1982.1665605749105251999
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 13:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EgbPAjrc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CKFiCh027172;
	Wed, 12 Oct 2022 15:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665605744;
	bh=pJBfL6LVe/yEeYBmUDyNDJfmAEqdZyRgpGlfMA67/EI=;
	h=From:To:Subject:Date;
	b=EgbPAjrcdWxoH6UeRd8qBaQopfeCvGfjZ/y6TYLCFG3qM7Q1Girmf/q93FRM9ylPw
	 MH9bJdm72+O4RrxOKhwKBXAX6c/Xh/kx4eoqqF0FdT4PZGPHbIqWsQtYpRJw+0RN24
	 zfaE33COSgtLuHLLppxx5Sqy+hUhlg6iazeJEw1Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CKFi5i049026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Oct 2022 15:15:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 15:15:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 15:15:43 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CKFhUo038503;
	Wed, 12 Oct 2022 15:15:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oii8l-0001G3-E5; Wed, 12 Oct 2022 15:15:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] layers: Add langdale to LAYERSERIES_COMPAT
Date: Wed, 12 Oct 2022 15:15:43 -0500
Message-ID: <20221012201543.4794-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Oct 2022 20:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14081

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4e21a517..5de46fc9 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone"
+LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 2132ca18..e2c8119f 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone"
+LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
-- 
2.17.1



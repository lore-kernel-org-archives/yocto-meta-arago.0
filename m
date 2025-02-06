Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED62C0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:07:17 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.50448.1738868829886003396
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fFQYb6wg;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516J78Vl3607328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:07:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738868829;
	bh=IKdL6+EFtbykB2fCcPxfEuGNjzYS4YRjsczVmoFlgKE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fFQYb6wgsLdQ3hE+yIF4VdEdjwhp7s1DjOF0cw8r+KbOu2OXZ6VPUlcvGHexnEI6i
	 RoI7OguIGnfsNVH4RQF6+XZzTlIc+ChTE46AS5LeQkugc3hd3NWlVAya7nFRzqNO+s
	 nqSgTN1iOiN2Nw/3I1PUjTV0ST8uF+SpeHWXxe4s=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516J78Oq020625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:07:08 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:07:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:07:02 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516J70u9111637;
	Thu, 6 Feb 2025 13:07:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 4/5] meta-arago-extras: gstreamer1.0-plugins-ducati: Remove default FILESEXTRAPATHS
Date: Thu, 6 Feb 2025 13:06:59 -0600
Message-ID: <20250206190700.1190499-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206190700.1190499-1-afd@ti.com>
References: <20250206190700.1190499-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 19:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15834

This is being set to the default value, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 1ff2dfb0..de8338f3 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -17,5 +17,3 @@ SRC_URI = " \
     git://git.ti.com/git/glsdk/gst-plugin-ducati.git;protocol=https;branch=${BRANCH} \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
 "
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-- 
2.39.2



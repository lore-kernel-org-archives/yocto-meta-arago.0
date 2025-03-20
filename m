Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FE5C3600B
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:20:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2149.1742494844095277034
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZEKs3AO5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgXX705170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494842;
	bh=7iReCwsYUzEBaGGrRLLE6dLvedIaMiLB72+E4jsVIWc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZEKs3AO5XDRXuzHAPfXRxOyI5zjYCfAYhyQcvLuYv9zAdwG3y8yB7KFWTOzjbRHmM
	 EJPW8qeC37YgCbbdFiiEatmT2TQE/zSMFbn8DIdAGSIhnYfvxEdvb/fZL5dq4JairZ
	 RYSXIG8Ta9sChIJlfYcIUTjZ3+xEEyF1QH1cacdI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgQt029573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:20:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:20:42 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIKgmT095697;
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKVW-0000dS-9P; Thu, 20 Mar 2025 13:20:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 6/8] packagegroup-arago-gst-sdk-target: Wrap various packages in a compliant manner
Date: Thu, 20 Mar 2025 13:20:39 -0500
Message-ID: <20250320182041.2349-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320182041.2349-1-reatmon@ti.com>
References: <20250320182041.2349-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:20:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16138

yocto-check-layer does not load the conf/distro/arago.conf file during
its execution.  This means that the LICENSE_FLAGS_ACCEPTED variable is not
set according to what we are willing to accept.

If a packagegroup is trying to include a recipe that is marked as being
"commercial" and the LICENSE_FLAGS_ACCEPTED is not set, then yocto-check-layer
fails.

The solution is to wrap the inclusion of these recipes in the packagegroup
in a complaint manner.  Only if the DISTRO_OVERRIDE says that this is an
"arago" build, should the package be included and this under the direction
of the LICENSE_FLAGS_ACCEPTED variable.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-gst-sdk-target.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index fd749711..ad25f4dd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -11,9 +11,10 @@ GSTREAMER_DEPS = " \
     gstreamer1.0-plugins-base-dev \
     gstreamer1.0-plugins-good-dev \
     gstreamer1.0-plugins-bad-dev \
-    gstreamer1.0-libav-dev \
 "
 
+GSTREAMER_DEPS:arago += "gstreamer1.0-libav-dev"
+
 #    gstreamer1.0-plugins-hevc-dev 
 GSTREAMER_DEPS:append:dra7xx = " \
 "
-- 
2.17.1



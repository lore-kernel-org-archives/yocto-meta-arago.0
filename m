Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8ADC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:37:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.68959.1742917036302876675
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 08:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QlQSey5b;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbE741284798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 10:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742917035;
	bh=rBIZRqNsQ3cp2Mww4uy0yw7FOTjDXT+6WPMdOCBaWvg=;
	h=From:To:Subject:Date;
	b=QlQSey5b3HA4/aMlUE4eGQ+CoIhSo/r96xmPq5Pi5rfktmLc20Hj6+pby8laPvK5j
	 6bndNry8wBBQJ4HIb9O486gugaKXq3coqC4MVG/qx+VuuNblx4LASYKkyeXic9JFZw
	 +hxjC8UvoCy2zPu6j5dEfjarcfZPeV8Doa7vSEDo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbEcd005056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Mar 2025 10:37:14 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:37:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:37:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFbE9t034471;
	Tue, 25 Mar 2025 10:37:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tx6L4-000685-DS; Tue, 25 Mar 2025 10:37:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2 1/3]  packagegroup-arago-gst-sdk-target: Wrap various packages in a compliant manner
Date: Tue, 25 Mar 2025 10:37:12 -0500
Message-ID: <20250325153714.23520-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Mar 2025 15:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16154

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
v2: Swtich from += to append assignment,

 .../packagegroups/packagegroup-arago-gst-sdk-target.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index fd749711..ce2ac46a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -11,9 +11,10 @@ GSTREAMER_DEPS = " \
     gstreamer1.0-plugins-base-dev \
     gstreamer1.0-plugins-good-dev \
     gstreamer1.0-plugins-bad-dev \
-    gstreamer1.0-libav-dev \
 "
 
+GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav-dev"
+
 #    gstreamer1.0-plugins-hevc-dev 
 GSTREAMER_DEPS:append:dra7xx = " \
 "
-- 
2.17.1



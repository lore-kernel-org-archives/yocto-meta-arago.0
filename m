Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF1AC36005
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:20:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2122.1742494842989471508
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oeZ+TmLi;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgmM686030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494842;
	bh=5d3d6JHqnlBHjWdofEK1j7i6v3YDVhTYVkoACKGCA1A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oeZ+TmLi9jYOH+jCPOurWOMsDGJk/0QSm8DKc5rGGQsPZsFfGj8iwLyiBGIYXo5XW
	 GiKfFP5x6nueS3rnNHNuKp74pvxgHp0alA2dXVU6f1lQlCCRvYwQMaoqNJNWm4BfVM
	 yugrwDojL9vvqntmMncRWN5x5Ss90HqhkWT9LsmU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgED025634
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:20:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:20:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIKfq3095686;
	Thu, 20 Mar 2025 13:20:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKVV-0000cn-Mn; Thu, 20 Mar 2025 13:20:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/8] packagegroup-arago-base: Wrap various packages in a compliant manner
Date: Thu, 20 Mar 2025 13:20:34 -0500
Message-ID: <20250320182041.2349-2-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16131

Previous clean ups wrapped some recipe .bbappend files in a compliant
manner and effectively hid the changes behind having "arago" in the
DISTRO_OVERRIDE.  This same kind wrapping is needed when including the
package in the package group.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 121fa432..fc2eafec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -36,7 +36,6 @@ ARAGO_EXTRA = "\
     kms++-python \
     can-utils \
     docker \
-    dbus-broker \
     expat \
     glib-2.0 \
     libxml2 \
@@ -52,6 +51,10 @@ ARAGO_EXTRA = "\
     lldpd \
 "
 
+ARAGO_EXTRA:append:arago = "\
+    dbus-broker \
+"
+
 OPTEE_PKGS = " \
     optee-os \
     optee-client \
-- 
2.17.1



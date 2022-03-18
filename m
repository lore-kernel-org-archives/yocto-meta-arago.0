Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0981C4167E
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10524.1647614261504074422
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E2dcC4W+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbc0v037438;
	Fri, 18 Mar 2022 09:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614258;
	bh=OghXpSbVkb4yFjcehjEcu374D3oMFhVIHnAMhIVLPjA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E2dcC4W+Fj9RCWRJWRSDjFGtzg+StP4Y9Hx4tb5VRmdS0m3QYBxbqr7uphiDtxYbx
	 BwlnOK9DmeXslbTWJsfSgv8sfSSosR12740wmmZVVrECzr40ugRy8CV1QxwSkTdefy
	 IaEHc9lXmdDl7x3TW9dEk9X2Gj6+1HetsQ/U1p0w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbcm7040282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:38 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbgR065674;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 11/12] tisdk-core-bundle: Add documentation
 to clarify usage
Date: Fri, 18 Mar 2022 09:37:34 -0500
Message-ID: <20220318143735.17642-12-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13643

Add documentation to the core-bundle to explain the usage and intent
of the build configuration.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* New patch

V1: did'nt exist.
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 253bfbb68657..f7736b800547 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -1,3 +1,9 @@
+# Installer package for TISDK - NOT for direct use on target
+#
+# This creates an installer including all the default images
+# recommended including source, binaries, filesystems, etc.
+# for TI SDK. This is meant to be used on the host system.
+
 require tisdk-core-bundle.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
-- 
2.31.1



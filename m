Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0082ACCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:23:49 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.7747.1760034225549722515
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 11:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h+SicsTj;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599INikI517625;
	Thu, 9 Oct 2025 13:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760034224;
	bh=80q/izhwxlYmjpJ7/48oPBFnBBbUpnd+0ozrE8h0EcE=;
	h=From:To:Subject:Date;
	b=h+SicsTjbO1PiIuSBeqzYFpL34Pns90Ql0CK/RGoDeRYsDhSr59748ZXtOKtTOK18
	 EXaSxbjJgML7/fSlpmbyWIPUfd2R4uUBungp180RDPprYeph/xjcyTjIsIiBMwfAjm
	 qG+5vGgKHfopW4NaNkUQ6VmWvbZCQ7FWM2RPKjL0=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599INiD0208642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 13:23:44 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 13:23:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 13:23:43 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599INhhj657338;
	Thu, 9 Oct 2025 13:23:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v6vIl-0005Ok-Iu; Thu, 09 Oct 2025 13:23:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes
Date: Thu, 9 Oct 2025 13:23:43 -0500
Message-ID: <20251009182343.20605-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Oct 2025 18:23:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16677

There are a number of recipe tweaks in oe-core to the clang recipes that
our older meta-clang choices were running afoul of.  Time to remove the
meta-clang dependency.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 --------
 meta-arago-distro/conf/layer.conf                     | 1 -
 2 files changed, 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index f05fc43c..4d1a6006 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -11,13 +11,5 @@ VIRTUAL-RUNTIME_dbus = "dbus-broker"
 PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
 
-# Select meta-clang providers
-PREFERRED_PROVIDER_llvm = "clang"
-PREFERRED_PROVIDER_llvm-native = "clang-native"
-PREFERRED_PROVIDER_nativesdk-llvm = "nativesdk-clang"
-PROVIDES:pn-clang = "llvm"
-PROVIDES:pn-clang-native = "llvm-native"
-PROVIDES:pn-nativesdk-clang = "nativesdk-llvm"
-
 # Bump mesa-demos to include some patches not in a tagged release
 PREFERRED_VERSION_mesa-demos = "9.0.0+git"
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4bacf386..e16eedd6 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -18,7 +18,6 @@ LAYERDEPENDS_meta-arago-distro = " \
     networking-layer \
     multimedia-layer \
     meta-python \
-    clang-layer \
     virtualization-layer \
     meta-arago-extras \
     meta-arago-test \
-- 
2.17.1



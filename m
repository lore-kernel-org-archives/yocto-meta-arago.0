Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F29C54E90
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.415.1747674058704335465
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ccfj+jw3;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0vso176997
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674057;
	bh=ydYdEZsXChW0ZEnZ3mqik2x8BVv8Qs6Th06AZe5ddSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ccfj+jw3gmx0MD80HWFo4Cl87GNNf7XR5pIKPiYQQJE9Sg6M1SB+ia1nhnIFJhyMD
	 0PXdR+mVUyKglMGCBx5pYmQvwwVoQ55vwvk9i3qBJU2QCwNdY+N0zJwyrbXEYe6RCe
	 CaDlozaoTyYinbQPaVRWnTH8aJBWNxUnsGeyjLcI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0vO8085226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:00:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0urR100483;
	Mon, 19 May 2025 12:00:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rE-0005pz-MN; Mon, 19 May 2025 12:00:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 5/9]  nativesdk-buildtools-perl-dummy: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:00:51 -0500
Message-ID: <20250519170055.22364-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170055.22364-1-reatmon@ti.com>
References: <20250519170055.22364-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16213

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...pend => nativesdk-buildtools-perl-dummy-arago.inc} |  0
 .../meta/nativesdk-buildtools-perl-dummy.bbappend     | 11 ++++-------
 2 files changed, 4 insertions(+), 7 deletions(-)
 copy meta-arago-extras/recipes-core/meta/{nativesdk-buildtools-perl-dummy.bbappend => nativesdk-buildtools-perl-dummy-arago.inc} (100%)

diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
similarity index 100%
copy from meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
copy to meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
index b9d40d6e..f88196f5 100644
--- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
+++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
@@ -1,7 +1,4 @@
-DUMMYPROVIDES += "\
-    nativesdk-perl-dev \
-    nativesdk-perl-module-feature \
-    nativesdk-perl-module-file-spec-unix \
-    nativesdk-perl-module-integer \
-    nativesdk-perl-module-symbol \
-"
+NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO = ""
+NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO:arago = "nativesdk-buildtools-perl-dummy-arago.inc"
+
+require ${NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO}
-- 
2.17.1



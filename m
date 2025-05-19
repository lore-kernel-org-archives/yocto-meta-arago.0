Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091D8C5479B
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:15 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.383.1747674072959855724
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BEB0d6iC;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1BPt177059;
	Mon, 19 May 2025 12:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674071;
	bh=ydYdEZsXChW0ZEnZ3mqik2x8BVv8Qs6Th06AZe5ddSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BEB0d6iCEEZQy4Wb3n1uxbTHhavC7gK+xTfmGplWMXzzfspmBsogeN53aepI/eijD
	 Rdocz4f6Xw37kxKK/nR1GIksqA8WjpeFNMhSCbhJMIfIWGnfKkWrLr4NGKvKVqV11Q
	 FIqQfbwpWJEcmdFTi5sJIrAk499IfF5AxH0XR648=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1BnB1577567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:10 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1AP2111294;
	Mon, 19 May 2025 12:01:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rS-0005sA-Pe; Mon, 19 May 2025 12:01:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 4/8] nativesdk-buildtools-perl-dummy: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:01:06 -0500
Message-ID: <20250519170110.22506-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16225

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



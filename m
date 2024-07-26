Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652D5C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4486.1722026720704240740
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pYkDVLV6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJBk001828;
	Fri, 26 Jul 2024 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026719;
	bh=FEp73HmPtthc2cBOIiQh9kBvwxIa5Tn9d+K2uFmB/YI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pYkDVLV6y95byX1kTTrEaCwfZfZTVv+D3ugXmlbA7tX+aRObay7tTEjbRHZHurkmJ
	 EfbHgn9WzRKvGSGIBZW+cp+Wk1SfiQ1UDxgYnBqVQaAjPDzwVuqgAZj+SgGbd8Bk2R
	 WqL9AvfE8aESskyrIwuSzBkRSa0bHMXHyC1c05nw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjJAL068181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJk0095413;
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRoV-0002Kt-9V; Fri, 26 Jul 2024 15:45:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] gcc-cross-canadian: Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:18 -0500
Message-ID: <20240726204518.8929-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726204518.8929-1-reatmon@ti.com>
References: <20240726204518.8929-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15470

At this time, then gcc-cross-canadian compiler from oe-core is not
passing the buildpaths check.  The issue is actively being worked on,
but in the meantime we need to get master builds back up and working for
maintaining our releases.  As soon as they have a fix we will remove
this patch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/gcc/gcc-cross-canadian_%.bbappend        | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend

diff --git a/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend b/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend
new file mode 100644
index 00000000..16df0c26
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend
@@ -0,0 +1,4 @@
+# Disable the "buildpaths" check while upstream oe-core figures out
+# how they are going to address it.  This will hopefully be a short
+# lived patch.
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.17.1



Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17132D7877B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:00:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.300.1732201241065441735
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 07:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y0W5peEI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALF0e1I098513;
	Thu, 21 Nov 2024 09:00:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732201240;
	bh=5JvjbXwLrEp1ywvmqAFkZXxfWJ/BUDR0RdJ3npXG4ac=;
	h=From:To:Subject:Date;
	b=Y0W5peEIstd6EII2dWN2XUPJREevvtHCeKagEU+n/2Gh5LDYNQ9SQ05tAWna0WkPZ
	 tkQv57OkKGKfOlg/RqCwexakVQRrppNdTIdPjw+dqPowhxb3t3GPMDue19M4mzD5w/
	 fPdw9XrLyw9ctVGOlEcEmYSix1eXO0ymJeECyvlg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALF0eih016301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Nov 2024 09:00:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 09:00:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 09:00:39 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALF0dcs074671;
	Thu, 21 Nov 2024 09:00:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tE8ff-0001bT-Hn; Thu, 21 Nov 2024 09:00:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] README: yocto-check-layer clean up
Date: Thu, 21 Nov 2024 09:00:39 -0600
Message-ID: <20241121150039.6119-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 15:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15624

Cleaning up the wording to pass the yocto-check-layer checks.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/README  | 6 +++++-
 meta-arago-distro/README | 6 +++++-
 meta-arago-extras/README | 6 +++++-
 meta-arago-test/README   | 6 +++++-
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index bb586c14..d10b0c1e 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
 
-Send pull requests to meta-arago@lists.yoctoproject.org
+Send pull requests, patches, comments or questions to:
+meta-arago@lists.yoctoproject.org
+
+Please note - meta-arago mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-arago
 
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 49e9d9e1..50fa7ede 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -32,7 +32,11 @@ branch: master
 revision: HEAD
 layers: meta-arago-extras
 
-Send pull requests to meta-arago@lists.yoctoproject.org
+Send pull requests, patches, comments or questions to:
+meta-arago@lists.yoctoproject.org
+
+Please note - meta-arago mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-arago
 
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 5b6e8a15..c703a813 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
 branch: master
 revision: HEAD
 
-Send pull requests to meta-arago@lists.yoctoproject.org
+Send pull requests, patches, comments or questions to:
+meta-arago@lists.yoctoproject.org
+
+Please note - meta-arago mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-arago
 
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-arago-test/README b/meta-arago-test/README
index 8f1f9993..16a36d62 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -23,7 +23,11 @@ branch: master
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
-Send pull requests to meta-arago@lists.yoctoproject.org
+Send pull requests, patches, comments or questions to:
+meta-arago@lists.yoctoproject.org
+
+Please note - meta-arago mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-arago
 
 Layer maintainers:
 Ryan Eatmon <reatmon@ti.com>
-- 
2.17.1



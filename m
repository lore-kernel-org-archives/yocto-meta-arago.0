Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9199EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 15:12:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10095.1687187564090723827
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 08:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E/KgwuYP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCgAf018786;
	Mon, 19 Jun 2023 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687187562;
	bh=BZ7qyes3h8wZUDSPWvZ1EoZaZi72sbI7I9NW3rWD+8I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=E/KgwuYP0utn4uvWwS0oP0B8MEgv4lXnE0hmu4oxBx4sGXWhwnpgKI6U4fA//F+4k
	 U4KY1K/2fj7ph4PnHFMNGQvTApJQLZLLG0MoNhR/xdUCnMeGFd6QUvgXKdRJVRN+dB
	 xyQGC20RySrrqSDW6eMEVYPkQzJDm6nHd7yypkaE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35JFCgSw022488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 10:12:42 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 10:12:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 10:12:42 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCgKa041331;
	Mon, 19 Jun 2023 10:12:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qBGYc-0004dQ-0W; Mon, 19 Jun 2023 10:12:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone/master][PATCH v2 3/3] packagegroup-arago-base: Turn kms++-python back on
Date: Mon, 19 Jun 2023 10:12:41 -0500
Message-ID: <20230619151241.17763-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230619151241.17763-1-reatmon@ti.com>
References: <20230619151241.17763-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jun 2023 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14653

Now that kms++ with python pybind11 builds we can add it back into the
package list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 31d9ad5b..ff32112a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -26,8 +26,6 @@ ARAGO_BASE = "\
     libgpiod-tools \
 "
 
-# these require meta-openembedded/meta-oe layer
-#    kms++-python is not provided yet
 ARAGO_EXTRA = "\
     devmem2 \
     tcpdump \
@@ -35,6 +33,7 @@ ARAGO_EXTRA = "\
     dropbear \
     openssh-sftp-server \
     kms++ \
+    kms++-python \
     can-utils \
     docker \
 "
-- 
2.17.1



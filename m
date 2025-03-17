Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE62C36003
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.60686.1742236647051018070
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ybch+k8F;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQLv2847522
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236646;
	bh=eCU0tRIxaVk618NSHZThCm5ZQv3sjCUdgwKxVFUp85s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ybch+k8FKxG/ZFVVeiGcLhjD9YnbkdyHmfPY52bFsqMoKAYGT8LGlN/RZwuDV44tF
	 87HC6OknRLevkA26xRfgsmK5q11Thk+Kh8pWgaXidTcbxVAFgwttAI3CNibDn5p0Md
	 W2N9Mi18+fgA/knNoaZTNMAHUXKLFuNP3dnTaOmw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQUG020806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbPA6000481;
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL3-0008Ew-KS; Mon, 17 Mar 2025 13:37:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 09/14] libyang: move bbappend
Date: Mon, 17 Mar 2025 13:37:19 -0500
Message-ID: <20250317183724.31563-11-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317183724.31563-1-reatmon@ti.com>
References: <20250317183724.31563-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16064

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../libyang => recipes-extended/sysrepo}/libyang_%.bbappend       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libyang => recipes-extended/sysrepo}/libyang_%.bbappend (100%)

diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
rename to meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
-- 
2.17.1



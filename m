Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE73C36006
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.60911.1742236646455004915
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M7LjS+7A;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPB92373294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236645;
	bh=GQGVPhVebuo2hr5r+jZVjnPB4w83IK7pe5CjHjEYwlA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M7LjS+7ALJmj08xT1h2zxETuSH/07EtRGHbxdMUz+r0WnUWkGK4cBNMCAHZwhvpA0
	 6afDWEqOMsPq1xZmilu8khWAXUYUPNQwIyL4ZXE56Gz6xtLyNWVTobxA3HEbdC2hxk
	 atrbmF8Be0IFqFoTxum14XJobkcOw4VEVQv8Sbdg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPKO076446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbPR7029144;
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL2-0008EM-UL; Mon, 17 Mar 2025 13:37:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 03/14] libyang: Add BBCLASSEXTEND for native
Date: Mon, 17 Mar 2025 13:37:13 -0500
Message-ID: <20250317183724.31563-5-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16059

We need to add BBCLASSEXTEND for native so that we can build
sysrepo-native for the netopeer2-server install.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend

diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
new file mode 100644
index 00000000..608377e3
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



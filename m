Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B7DD7360E
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 22:52:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.141852.1733007166158713123
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 30 Nov 2024 14:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zRcYI+Hj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AUMqiI3047590;
	Sat, 30 Nov 2024 16:52:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733007164;
	bh=HTle5En1QLViWC8BommvX/SfNdt+Car/wWUUtfIWi8w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zRcYI+HjCRIqz3lObulnbApMppVm8eALaNcY4bI+oIwXzZj1wwlaoWQ5FJIFiTR/3
	 0EWntV2EiNwS05xdVL+lm1c6rTRy4ovc7RJ+a8YhO8gnnc94gUDR6bXnY4k5Ck1K4Q
	 AZj+eT2Zzj99WzfXYCZbl7G3Fh7HDU/y7sXVtQJw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AUMqioW030861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 30
 Nov 2024 16:52:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 30 Nov 2024 16:52:44 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AUMqi2P119122;
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tHWKS-0003i7-5r; Sat, 30 Nov 2024 16:52:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/4] vulkan-cts: Update to newer vulkan version
Date: Sat, 30 Nov 2024 16:52:42 -0600
Message-ID: <20241130225244.12367-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241130225244.12367-1-reatmon@ti.com>
References: <20241130225244.12367-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 30 Nov 2024 22:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15631

Upstream moved to a later vulkan version and the bbappend no longer
applied.  Since the bbappend is just adding a compile flag, move the
file to match all versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{vulkan-cts_1.3.7.3.bbappend => vulkan-cts_%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/vk-gl-cts/{vulkan-cts_1.3.7.3.bbappend => vulkan-cts_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
rename to meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_%.bbappend
-- 
2.17.1



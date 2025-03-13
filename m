Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14306C35FF3
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23280.1741892719315497134
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 12:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NuNLZT2L;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5Ih81432111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 14:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741892718;
	bh=eCU0tRIxaVk618NSHZThCm5ZQv3sjCUdgwKxVFUp85s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NuNLZT2LErrkAvajrqwUjbAnhNy9QZzl4k3v+jmh0wRxusQZEzyaLaZ58ulCBWWER
	 lrM4DIQNqpdW0cJLwtN0+87zQZb/YNcGhh7JL3Ygh7Hd5ZfaNLkEwlNk4rPH9ClzYT
	 UciakRATyqWjX8TT7xaSHnrf57nCxqQ9TM4Kx7iU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5IPA087164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 14:05:18 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 14:05:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 14:05:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5HkU090120;
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsnrp-0005t0-Jq; Thu, 13 Mar 2025 14:05:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 09/14] libyang: move bbappend
Date: Thu, 13 Mar 2025 14:05:11 -0500
Message-ID: <20250313190516.22522-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313190516.22522-1-reatmon@ti.com>
References: <20250313190516.22522-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 19:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16042

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



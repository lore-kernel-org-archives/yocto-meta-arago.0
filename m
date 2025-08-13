Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C62CCA0FF5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10193.1755127549998237075
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SAtnLnLz;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPnLM1750907
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127549; i=@ti.com;
	bh=0FDs4A+H2LtkIt/X+6GImQgGQM6eMmuoEQvn2G1SmZc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SAtnLnLzDctXge4Rc9MO33kGGkiVq9vUibg5RhSOvzmQc0PzLiX+TUQBg+sgT5OYp
	 /SdjrG6L5MRCo4Q/9g5zA4W0d+awXQnq1ipCsSPwOMCifLA6RjOR3iULitR9jrOwsB
	 e4CP4pX1bMXwxmiCO45uGjyAVjWmO9R8bqS5PH0A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPnTw727164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:49 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:49 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:49 -0500
Received: from fllvdckhpci089.itg.ti.com (fllvdckhpci089.itg.ti.com [10.64.72.40])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPnPW3611069;
	Wed, 13 Aug 2025 18:25:49 -0500
Received: by fllvdckhpci089.itg.ti.com (Postfix, from userid 60899)
	id 3489A9B; Wed, 13 Aug 2025 18:25:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <devarsht@ti.com>, <s-adivi@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Copy
Date: Wed, 13 Aug 2025 18:25:49 -0500
Message-ID: <20250813232549.4181357-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220513124458.23582-1-a-m1@ti.com>
References: <20220513124458.23582-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16420

meta-arago / na / 20220513124458.23582-1-a-m1

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Copy wificfg file to boot partition for am62xx
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:42
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Copy





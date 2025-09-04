Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A031CA1016
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:45:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.38443.1756989915013017037
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 05:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uzh94TjA;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584CjEMJ3468927
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756989914; i=@ti.com;
	bh=uJ1ZMEm1Y1Q7+ivuVnWeD0d6znUVYX03oXEHQSRhoqI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Post;
	b=Uzh94TjAo9Ar2naAhYYcWcx00kdQn5K2dBnUhUrgn1S/GEDikj4tcFpkjkz4/u3VB
	 xvmUxjZeppr8/cTM4gkyaY/5yyHR/YNAiZkA0GiIPpZM626ZAZiZoHSn55GoGyT7zc
	 w1Z79LwOzPC0S1GhhIFkLK0YpLz/onX/Esp7LBaY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584CjEpd173729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:45:14 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 07:45:13 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 07:45:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584CjDTE2974488;
	Thu, 4 Sep 2025 07:45:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 55F7813F531; Thu,  4 Sep 2025 07:45:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-patch-review@list.ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>
Subject: Re: [meta-ti][PATCH 0/1 v2] Add recipes to build initramfs image
Date: Thu, 4 Sep 2025 07:45:13 -0500
Message-ID: <20250904124513.2380718-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250904124331.1075343-1-m-shah@ti.com>
References: <20250904124331.1075343-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Sep 2025 12:45:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16522

meta-arago / na / 20250904124331.1075343-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][PATCH 0/1 v2] Add recipes to build initramfs image
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:44
            Subject: [meta-ti][PATCH 0/1 v2] Add recipes to build initramfs image
    
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch





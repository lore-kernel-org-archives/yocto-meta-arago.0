Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97088CA1000
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10212.1755127556834778632
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WqnWUxw1;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPunD1803105;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=jKUbElz3Mm/Kgz511aYuerIR9UDrwMEhmCG35UJyRJ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WqnWUxw1/BKHNt51cRW8BSeRuTG5/Qx0BVotDs/E1qrxsmLodmrrEZeuNIuob968J
	 q52JIj0g4/6PwAgBkyWmBeBD9R96Sx3uQPqCMO0TQfL8RW+hVCYLUMzv8jbN7uLZdg
	 tFPIeIcI+o4hS1/JUaYJtKxaDgaJrU6L2HnqRM4U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPtqL1300458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:55 -0500
Received: from fllvdckhpci101.itg.ti.com (fllvdckhpci101.itg.ti.com [10.64.72.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPtc82710380;
	Wed, 13 Aug 2025 18:25:55 -0500
Received: by fllvdckhpci101.itg.ti.com (Postfix, from userid 60899)
	id 8D32F4DC43; Wed, 13 Aug 2025 18:25:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone/master][PATCH] libloki: fix C++ compile errors with gcc-11
Date: Wed, 13 Aug 2025 18:25:55 -0500
Message-ID: <20250813232555.2911223-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20230213192226.26228-1-afd@ti.com>
References: <20230213192226.26228-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16456

meta-arago / na / 20230213192226.26228-1-afd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][kirkstone/master][PATCH] libloki: fix C++ compile errors with gcc-11
    ERROR: Missing Upstream-Status in added patch file: hunk(1) meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch (UPSTREAM-STATUS-1)
        patch





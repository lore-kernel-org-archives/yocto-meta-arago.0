Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B20CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:25:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.7806.1760034314470952476
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 11:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SbBwL53L;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599IPDln592348;
	Thu, 9 Oct 2025 13:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760034313; i=@ti.com;
	bh=R+TtUc8uZObXSUjjP/kN/VfjAgrM1b/8F7gVxzsFl40=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SbBwL53LTGiAIon2fdtgTcbDlrpk529VsPkSHQ+lrHVle8f8JIWynL1AVdvWh4Hsk
	 hJoo0weENGxhoWt5C0sgIgklM8QPlpKGTZJgw+uhc9TpjuBLfDpaqb/QNNHBRCt5+c
	 8OWtGN+sGBzqOjGpPDdzoZPzblDmJT/qN2O1i6gE=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599IPDa7487021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 13:25:13 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 13:25:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 13:25:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599IPDwI658615;
	Thu, 9 Oct 2025 13:25:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 11F0413F52E; Thu,  9 Oct 2025 13:25:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes
Date: Thu, 9 Oct 2025 13:25:13 -0500
Message-ID: <20251009182513.2356354-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251009182343.20605-1-reatmon@ti.com>
References: <20251009182343.20605-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Oct 2025 18:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16678

meta-arago / na / 20251009182343.20605-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes
    ERROR: Commit message too long (> 80 chars): meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes. (COMMIT-MESSAGE-1)
        patch:47
            Subject: [meta-arago][master][PATCH] meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes
    
    WARN: Commit message does not include file/recipe name: meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-arago-distro: Remove meta-clang dependency now that oe-core has clang recipes.
              meta-arago-distro:
              distro: (COMMIT-MESSAGE-3)
        patch





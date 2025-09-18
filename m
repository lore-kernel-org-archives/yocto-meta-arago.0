Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B03CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:30:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3125.1758238219721084767
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 16:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C4cQYY+O;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58INUIFP586798;
	Thu, 18 Sep 2025 18:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758238218; i=@ti.com;
	bh=5V5IKAX3ahErlXNcwbZuOmf/Pdk/0WJJ7S8pdC5PNzE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C4cQYY+OjeuQKUvD6WFvZWpM1FXUnGLavIMYmlKiURhHj+ZFDTjqazPwc3QoIEZAn
	 GGp5du9k34RJTi3GEI1vCha0zFvk+du8qkwJX+ApWg63UqQBydqedLXLTtWZMvOKQS
	 STGNh1/zMoE77oQvMTRz3qjAtFsmFo06fRjqPjgw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58INUIL02707868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 18:30:18 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 18:30:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 18:30:18 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58INUI1g1627503;
	Thu, 18 Sep 2025 18:30:18 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5AF7E142E2C; Thu, 18 Sep 2025 18:30:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
Date: Thu, 18 Sep 2025 18:30:18 -0500
Message-ID: <20250918233018.2174792-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250918232748.1813453-1-lcpdbld@list.ti.com>
References: <20250918232748.1813453-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 23:30:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16597

meta-arago / na / 20250918232748.1813453-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509181257. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 18 Sep 2025 18:27:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a2e03b55808b10d666cb458935e935ba537a52de

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ktx-software: Add recipe v4.4.0
- Commit SHA: 0c17138e77fec05513267f28b94702fee863e5e9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





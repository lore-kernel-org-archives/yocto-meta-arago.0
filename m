Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457CDCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 20:15:21 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.198.1756412118927514306
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 13:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y1nF9xfH;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SKFIpH1645490
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 15:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756412118; i=@ti.com;
	bh=fCW5MDTJrfU42uwCvc/HDxzZmqcz5wdQhCj5RPHPyVM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y1nF9xfHSN/t9js4BkOkqQmJ3J0dEgMFwytULZusV8aI/Hz8+i6+oXz/uO0vs8g+E
	 koGD7IPP89wYLd0sEeyjpmSTmTC4XJiFUU22lAvc9uphhmaxBKnPwbtnfb/u0++3Vp
	 jvKSUCSFRv1je8O/Nj7GuY7SFQ5YRDb5gVs5w/QA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SKFIGb005624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 15:15:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 15:15:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 15:15:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SKFImF914304;
	Thu, 28 Aug 2025 15:15:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0495813F536; Thu, 28 Aug 2025 15:15:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v3] chromium: Replace /dev/video* with Chromium naming convention
Date: Thu, 28 Aug 2025 15:15:17 -0500
Message-ID: <20250828201517.4052432-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250828200933.1372572-1-t-lannynd@ti.com>
References: <20250828200933.1372572-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 20:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16501

meta-arago / na / 20250828200933.1372572-1-t-lannynd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v3] chromium: Replace /dev/video* with Chromium naming convention
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
-From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 28 Aug 2025 15:09:33 -0500
-Date: Thu, 7 Aug 2025 14:48:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 64b22eb214e385e893e5a767b1e9bff2f9ff5cf0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508211416
- Commit SHA: 57fcd4fd3332be889b6bcc8d3b6f4304e88fff9a

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





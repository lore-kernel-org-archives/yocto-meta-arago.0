Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36712CA0FF6
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 23:10:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1409.1756422625641584926
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 16:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BAU99oNj;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SNAOe51668812;
	Thu, 28 Aug 2025 18:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756422624; i=@ti.com;
	bh=YDM4YZS93Gy1WgZBVx1M/PAy+OtII+yisUqefGe93kI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BAU99oNj927qsYeCsaAXhFdjJam89I05hfc9wQhQNRwfsPz4mLB/BWLiAfHWaXTpm
	 As99aC0EdHR8fEj/29GMLbCjpTqd68kIe8mm92Iqi+3aw8Kp3N/edWzqGrVu5TPU+P
	 8Ju/9m2dVNugFCF1aU1n9JbaV8ywsOnZ9YApZ+Nc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SNAOct095514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 28 Aug 2025 18:10:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 18:10:24 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 18:10:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SNAOKl1113687;
	Thu, 28 Aug 2025 18:10:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4B72613F52D; Thu, 28 Aug 2025 18:10:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508281316
Date: Thu, 28 Aug 2025 18:10:24 -0500
Message-ID: <20250828231024.4082179-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250828230613.3423441-1-lcpdbld@list.ti.com>
References: <20250828230613.3423441-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 23:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16503

meta-arago / na / 20250828230613.3423441-1-lcpdbld

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
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508281316
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 28 Aug 2025 18:06:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 694064d886263fdf4ae9eec2321163d2c4e406e9

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





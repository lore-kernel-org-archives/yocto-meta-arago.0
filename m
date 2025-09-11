Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF67CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:45:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.30.1757623524645989408
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 13:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lJOhg2EO;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BKjNnh885891;
	Thu, 11 Sep 2025 15:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757623523; i=@ti.com;
	bh=Z2I1g3dQVm9eAvGq1+fSWmFqUHqCjmbOYN634THPUec=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lJOhg2EOzUJr18WqaodvEjejQZbSbEjTAEdjhR/Q/E9pKXpFtxWX+fYuPYdItWUn2
	 T6g2QLb6UdEhCyjnwO1q9qUMt7ciktlmXHx7UXGJaP60WaF9cybZ+RmHmC1h60ThcQ
	 MbPWtZvlej23lVFEAyqJYNyyAfXowcK8DHCfu06s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BKjNQW1466675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 15:45:23 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 15:45:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 15:45:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BKjNTg2526133;
	Thu, 11 Sep 2025 15:45:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4F1E313F52C; Thu, 11 Sep 2025 15:45:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
Date: Thu, 11 Sep 2025 15:45:23 -0500
Message-ID: <20250911204523.1062203-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250911204318.3955694-1-lcpdbld@list.ti.com>
References: <20250911204318.3955694-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 20:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16568

meta-arago / na / 20250911204318.3955694-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509111148. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 11 Sep 2025 15:43:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a5813ac7ed3f73c80432f9c304641ff3bbe52f81

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: opencl-clhpp: opencl-clhpp v2.0.16 -> v2024.05.08
- Commit SHA: 449e984b83aaa6fd464654e98dbf44f60aa960a4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





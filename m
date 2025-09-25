Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F77BCAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:20:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5703.1758828020712668359
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XruIQq5I;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJKJ9M1498105;
	Thu, 25 Sep 2025 14:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758828019; i=@ti.com;
	bh=D1pyjZPQUvOadO51HuXUlhx7jMZlNn8eAx0VD4TrXL0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XruIQq5IoN9HAE0PerFiItaPkDGjxikraN+66GFsA3z91U6svj4Aoj6KNS5y3ZWM5
	 UhCnirQlfxdEB9hHySup++ICS0H/jAIqWdxF/rftyMHuO2R8ZC9pcepW1bYrnY/Z/R
	 FVr9b041sdjMBG+ATXvfcRpgn0QohtXCdJpYM2KA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJKJ7V391374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 14:20:19 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 14:20:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:20:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJKIYG060951;
	Thu, 25 Sep 2025 14:20:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C91FB13F538; Thu, 25 Sep 2025 14:20:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [scarthgap/master][PATCH] linux-firmware-arago: correct removal of overlapping FW
Date: Thu, 25 Sep 2025 14:20:18 -0500
Message-ID: <20250925192018.1454789-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925191710.2937644-1-denis@denix.org>
References: <20250925191710.2937644-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16636

meta-arago / na / 20250925191710.2937644-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap/master][PATCH] linux-firmware-arago: correct removal of overlapping FW
    WARN: Commit message does not include file/recipe name: linux-firmware-arago: correct removal of overlapping FW. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap/master][PATCH] linux-firmware-arago: correct removal of overlapping FW
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 25 Sep 2025 15:17:10 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f95d95eb505ede6807da4e744831828b0724e17

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509250412
- Commit SHA: 61ab0b00a3683d71c0fc9ac62e1200d85edbcecd

Patches
----------------------------------------
FAIL - [scarthgap/master][PATCH] linux-firmware-arago: correct removal of overlapping FW
    error: patch failed: meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc:1
    error: meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc: patch does not apply
    Applying: linux-firmware-arago: correct removal of overlapping FW
    Patch failed at 0001 linux-firmware-arago: correct removal of overlapping FW

master
=====================
Summary:
- Patch Series: [scarthgap/master][PATCH] linux-firmware-arago: correct removal of overlapping FW
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 25 Sep 2025 15:17:10 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f95d95eb505ede6807da4e744831828b0724e17

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Commit SHA: d3532063218f5c47b5e912554a0b236eb25e61f4

Patches
----------------------------------------
All patches applied





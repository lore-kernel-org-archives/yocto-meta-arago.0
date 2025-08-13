Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEA1CA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10216.1755127558030256336
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iw4oBdOl;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPulu1750986;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=y3/ICRpwa+GgE8GgcGp7BNJ0NrUn8eH7szVw/Z90Qac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iw4oBdOl6MpeYaujH54mEoY+bM1IKj9LuBn2/5fa0WViaxtoZIeI+VyzLq7QhVxK2
	 BL3qJ5t5/YnYrm14+xPCyvl3PBUkYTPF8SIcIFFECO+Z9JMh69khzOQjM70F11MYqE
	 hw8lJ+s/tWa4AXeJm36VjOnOQV6wzl9QBIwaI424=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuOT403466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci081.itg.ti.com (fllvdckhpci081.itg.ti.com [10.64.72.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPuv13016641;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci081.itg.ti.com (Postfix, from userid 60899)
	id 508D91523D8; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.3728843-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20230206220437.936-1-reatmon@ti.com>
References: <20230206220437.936-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16462

meta-arago / na / 20230206220437.936-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 6 Feb 2023 16:04:37 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f0ac698e07f87f5ec94cf49a735d12283ec63741

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:45
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    error: meta-arago-distro/recipes-core/packagegroups/ti-test.bb: does not exist in index
    error: meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb: does not exist in index
    Applying: stream: Enable stream benchmark again
    Patch failed at 0001 stream: Enable stream benchmark again

kirkstone
=====================
Summary:
- Patch Series: [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 6 Feb 2023 16:04:37 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f0ac698e07f87f5ec94cf49a735d12283ec63741

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:45
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    error: meta-arago-distro/recipes-core/packagegroups/ti-test.bb: does not exist in index
    error: meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb: does not exist in index
    Applying: stream: Enable stream benchmark again
    Patch failed at 0001 stream: Enable stream benchmark again





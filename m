Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B0ACA0EEA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10219.1755127558109627190
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rozC8yVg;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPu4s1750980;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=g4zRdj6cLmaWkTBH4G7za1AIK4cDxNlsrYqvZ2gzPow=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rozC8yVg0XLAg4WZp6H+DeM/PabCzxwbFc2KpTizUM9U79HdcyVHbRbk6e/1ny+xJ
	 zrrLgWuYjBUzApaic9djI7T6kJvlZOscHxKGIRhCMpMjVgmJUwGp13TCNNXg4Eg8p6
	 Hj76KEIirE/1O5J6TphozkkyHDnKNMAb5pPINsns=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuoL403461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.64.72.37])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPuhU3611142;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 4B9E6D1641; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.123079-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20230317151354.24990-1-reatmon@ti.com>
References: <20230317151354.24990-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16466

meta-arago / na / 20230317151354.24990-1-reatmon

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
- Patch Series: [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 17 Mar 2023 10:13:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d2fcc28ef10037e493d27fa68c56250d8e69d57d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
    Applying: branding-ltsprep: LTS migration brand
    Patch failed at 0001 branding-ltsprep: LTS migration brand
    error: meta-arago-distro/conf/distro/include/branding-ltsprep.inc: already exists in index

kirkstone
=====================
Summary:
- Patch Series: [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 17 Mar 2023 10:13:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d2fcc28ef10037e493d27fa68c56250d8e69d57d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
    Applying: branding-ltsprep: LTS migration brand
    Patch failed at 0001 branding-ltsprep: LTS migration brand
    error: meta-arago-distro/conf/distro/include/branding-ltsprep.inc: already exists in index





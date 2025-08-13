Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D5CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10072.1755127558041881862
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LJNHKz3t;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPv711803115;
	Wed, 13 Aug 2025 18:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127557; i=@ti.com;
	bh=GCIwXsjntu+IhU2SuXgpfWMsbPA48LBGD16lzeOemo0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LJNHKz3tWFG/vJ1fNUIpl361r73Ng+L3YRG1V5UHbG1bNXPKS23rn4QCKRSr7u29t
	 te/RruSQatwf3unbtMZ3LAQPuH1HNzqRNbBUei5ZhmmBnM2if9Y+w1L9wNIAVKSTQp
	 2k9+Y47WCr0X7gYktlBKNhApuJmueRn789qAp9+o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPvBn403472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci097.itg.ti.com (fllvdckhpci097.itg.ti.com [10.64.72.60])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPur53611145;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci097.itg.ti.com (Postfix, from userid 60899)
	id BE541138981; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] conf: distro: arago.conf: Change FEEDURIPREFIX
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.665833-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20230601162137.25648-1-reatmon@ti.com>
References: <20230601162137.25648-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16463

meta-arago / na / 20230601162137.25648-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] conf: distro: arago.conf: Change FEEDURIPREFIX
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 1 Jun 2023 11:21:37 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bbc8cfe5cd66038330f0e38860c37b61fd1559cd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] conf: distro: arago.conf: Change FEEDURIPREFIX
    error: patch failed: meta-arago-distro/conf/distro/arago.conf:4
    error: meta-arago-distro/conf/distro/arago.conf: patch does not apply
    Applying: conf: distro: arago.conf: Change FEEDURIPREFIX
    Patch failed at 0001 conf: distro: arago.conf: Change FEEDURIPREFIX





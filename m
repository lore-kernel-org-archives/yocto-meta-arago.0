Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECE4CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 08:05:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.34216.1756109137659328180
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 01:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GG37/4y2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57P85aqu769732;
	Mon, 25 Aug 2025 03:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756109136; i=@ti.com;
	bh=WADwxMwxtSx9IYmLdd7uujM2b28Ia8zUVEjBv4FTnX0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GG37/4y2o2mNWxYT11L4tjaiIolFQfXtHwNS//Nd2tnrOiihH2n4zf2vQ5bslJTua
	 ZDFgrDWtbcl9tEDh6Jw6fxTI0+4WstiCFrav5D5Hw38Mh7PkrIr1gLMB9BmXkfslKW
	 3/GZMTfIGWCkVwjgjfBXflXTHubaNS3Asb688Mcw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57P85aWw1030358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 03:05:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 03:05:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 03:05:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57P85anw1787758;
	Mon, 25 Aug 2025 03:05:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 31D3A168FED; Mon, 25 Aug 2025 03:05:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202508250100
Date: Mon, 25 Aug 2025 03:05:36 -0500
Message-ID: <20250825080536.2159670-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250825075955.342690-1-lcpdbld@list.ti.com>
References: <20250825075955.342690-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 25 Aug 2025 08:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16494

meta-arago / na / 20250825075955.342690-1-lcpdbld

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
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202508250100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 25 Aug 2025 02:59:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d24a4ef99b9c6ea6c02d7ad540dbf040a52cb2a4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: packagegroup-arago-tisdk-addons: Add ti-rtos-messageq-test-fw package
- Commit SHA: d3c857fa4982cd3974926da85d0d6b3c933ca1d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





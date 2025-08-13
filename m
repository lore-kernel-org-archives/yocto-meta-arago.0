Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27E4CA1002
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10061.1755127555736901042
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t17yN6/i;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPsrF1803089;
	Wed, 13 Aug 2025 18:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127554; i=@ti.com;
	bh=fCuOEFOQCAgJebaDYl+eJs+q+muW22tBNgqNKACgk6k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t17yN6/iw8+8NKikT/EcHeA7bodFvVOWNIPLCFvV39VvxE9JUDkSCxdqvcsGEKVmx
	 oM9KbRAiC2MEnE04fhA5bnziDwmTPHNazzRLuVXUDhNHSZBDVP2Ir9029/5UB4flnX
	 w4VTh4XBPm7aY+1I1KhhiDNvABocNqNZur3EZrNs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPsfa1300451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:54 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:54 -0500
Received: from fllvdckhpci091.itg.ti.com (fllvdckhpci091.itg.ti.com [10.64.72.44])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPsdK3678280;
	Wed, 13 Aug 2025 18:25:54 -0500
Received: by fllvdckhpci091.itg.ti.com (Postfix, from userid 60899)
	id 8018D1893; Wed, 13 Aug 2025 18:25:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] all: Remove reference to
Date: Wed, 13 Aug 2025 18:25:54 -0500
Message-ID: <20250813232554.2796752-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220720203212.20717-1-reatmon@ti.com>
References: <20220720203212.20717-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16446

meta-arago / na / 20220720203212.20717-1-reatmon

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
dunfell
=====================
Summary:
- Patch Series: [meta-arago][dunfell][PATCH] all: Remove reference to arago-project.org
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 20 Jul 2022 15:32:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d035c8ce43b20b81d4da964ddabc97930eddc77e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] all: Remove reference to arago-project.org
    Applying: all: Remove reference to arago-project.org
    Patch failed at 0001 all: Remove reference to arago-project.org
    .git/rebase-apply/patch:1042: trailing whitespace.
    |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
    .git/rebase-apply/patch:1043: trailing whitespace.
                  |___|                    |___|            
    .git/rebase-apply/patch:1053: trailing whitespace.
    |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
    .git/rebase-apply/patch:1054: trailing whitespace.
                  |___|                    |___|            
    error: patch failed: meta-arago-distro/README:26
    error: meta-arago-distro/README: patch does not apply
    error: patch failed: meta-arago-distro/classes/tisdk-bundle.bbclass:641
    error: meta-arago-distro/classes/tisdk-bundle.bbclass: patch does not apply
    error: patch failed: meta-arago-distro/conf/distro/arago.conf:10
    error: meta-arago-distro/conf/distro/arago.conf: patch does not apply
    error: patch failed: meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb:9
    error: meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-core/base-files/base-files/issue:4
    error: meta-arago-distro/recipes-core/base-files/base-files/issue: patch does not apply
    error: patch failed: meta-arago-distro/recipes-core/base-files/base-files/issue.net:4
    error: meta-arago-distro/recipes-core/base-files/base-files/issue.net: patch does not apply
    error: patch failed: meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb:7
    error: meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb:8
    error: meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb: patch does not apply
    error: patch failed: meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb:1
    error: meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb: patch does not apply
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb:4
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: patch does not apply
    error: patch failed: meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc:1
    error: meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc: patch does not apply
    error: patch failed: meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb:12
    error: meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb: patch does not apply





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0220CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:40:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.71672.1756798819909774553
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 00:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fbxHkkkJ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827eJS92933461
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756798819; i=@ti.com;
	bh=dkNrbhab0hFdlttJQLBgFLJeonJ49lfq+1SngayAHwQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fbxHkkkJLWWUU5/y9FIQ9dBii65ajwauAstewkRpz8jyM13NuucE/4ml3swd/OS12
	 wMbi9haR0T5TT9TvyhfQ54HrbTHGf/v5XqDaQgJPVjC4ErKnyCJ57uCM+rIkMuQc80
	 Hu3UfB8RUq+z6lU7nyYAY89fvsodo+MOrcmOpero=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827eJ542569602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:40:19 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:40:19 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:40:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827eIDu1001651;
	Tue, 2 Sep 2025 02:40:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DEEBD13F529; Tue,  2 Sep 2025 02:40:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shreyash Sinha <s-sinha@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-linux: Add 11.0 release config
Date: Tue, 2 Sep 2025 02:40:18 -0500
Message-ID: <20250902074018.106749-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250902073630.878912-1-s-sinha@ti.com>
References: <20250902073630.878912-1-s-sinha@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Sep 2025 07:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16513

meta-arago / na / 20250902073630.878912-1-s-sinha

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-linux: Add 11.0 release config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:42
            Subject: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-linux: Add 11.0 release config
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch





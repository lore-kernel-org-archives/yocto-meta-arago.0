Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA19C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:31:14 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.31400.1754501465580128640
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iHFfdfz6;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576HV3i0131854;
	Wed, 6 Aug 2025 12:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754501463; i=@ti.com;
	bh=cI1CzvtI10dwi41FLWFouTi3C0YJxPnTe7X7c+t5TjE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iHFfdfz6CP0XemK5Mw6I4qf5JVJ929sp9H+uarstLnVjFrMt/jrk40nHw80VAABEt
	 I3iA0q5TJ0IxjIcSbQdU84WbZ5W1/hQTr50bH6TI6JCoVIkAxSp16/R4VVqzU2+al1
	 AQKFepHo2/9Of1y9TXHyJ9NqvV+5u3vC0pLox2fI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576HV3nM191538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:31:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:31:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:31:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576HV39t3896784;
	Wed, 6 Aug 2025 12:31:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D75B413F52F; Wed,  6 Aug 2025 12:31:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>,
        <u-kumar1@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH 0/2] Add more packages for omap-a15 platform
Date: Wed, 6 Aug 2025 12:31:02 -0500
Message-ID: <20250806173102.468582-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250806172435.296187-1-b-padhi@ti.com>
References: <20250806172435.296187-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16356

meta-arago / na / 20250806172435.296187-1-b-padhi

PRC Results: PASS

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-patches: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
All patches passed



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  apply-yocto-patch: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-




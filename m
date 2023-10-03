Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36504E8FDB6
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 20:47:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.105463.1696330187359691392
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 03:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I6alkmWr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393AnkOh045626
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Oct 2023 05:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696330186;
	bh=3WMEcg7RC/A6sfQuPD9zJKTbM6OvM3GeWikEGjBXd7Q=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=I6alkmWrvHtmSBx+r1xI2+UW8AuHTemDfoegi+MT7dM80hyqmEqjt+BWqzTCKHT5M
	 SJ/AYhK4Cso04e2ZoNBsNa2LzqqAkAgn50ROjwyGKBPxBXVWy6acZy3rVk7iNm8EH4
	 p6ksS+aqONcPYo0Ql4kclGz2dPTnH7kAFwzxrCM8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393Ankel089996
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Oct 2023 05:49:46 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 05:49:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 05:49:45 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 393Anj00023594;
	Tue, 3 Oct 2023 05:49:45 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <reatmon@ti.com>
CC: <u-kumar1@ti.com>, <j-choudhary@ti.com>
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-demos: matrix-gui-v2-apps: pick platform specific openssl tests
In-Reply-To: <20230929084731.15228-1-j-choudhary@ti.com>
References: <20230929084731.15228-1-j-choudhary@ti.com>
Date: Tue, 3 Oct 2023 16:19:44 +0530
Message-ID: <87ttr8f0af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Oct 2023 20:47:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14912

Jayesh Choudhary <j-choudhary@ti.com> writes:

> update matrix-gui-v2-apps recipe SRCREV to pick the openssl changes
> for platform specific test suites and include software performance test
> suites as well.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Kamlesh Gurudasani <kamlesh@ti.com>


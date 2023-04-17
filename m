Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB53AC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 22:32:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.11452.1681770741418434674
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 15:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AqF+i6Iv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HMWHXt110687;
	Mon, 17 Apr 2023 17:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681770737;
	bh=OcvVrrbFq84enGYDYRXJ5V6PRUCIKW3MLNjeAneWjC8=;
	h=Date:To:From:Subject:CC;
	b=AqF+i6Ives1oCoF1lvK0IkkW7SSUJUjPORPzVRhuANCw5fNzxuZFUB90v7mty2xDD
	 aPz1APcSN8TafhT6aJmuchCSzjQShsD0UFB6uX8beOtGydB37mdIWR4+M58kyxgpsz
	 usXq6XQ11u+1ML2w0TOcrKEe7qkhIAPMTVUSNqfc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HMWHLQ102575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Apr 2023 17:32:17 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 17:32:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 17:32:16 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HMWGsK129755;
	Mon, 17 Apr 2023 17:32:16 -0500
Message-ID: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
Date: Mon, 17 Apr 2023 17:32:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
From: Randolph Sapp <rs@ti.com>
Subject: [DISCUSSION] Weston-Init and non-root weston
CC: <meta-arago@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Apr 2023 22:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14315

Finally getting around to weston-init issue I highlighted a while back 
and there's only one real issue preventing us from reusing the base 
weston-init recipe -- our touchscreen auto-configuration script.

That script has to have root access to setup and reload udev rules and 
as we know setuid won't work for shell scripts.

I propose we rewrite it in something that can use setuid (perl or c or 
something of the sort). I'm currently looking at perl as there's already 
quite a few core recipes that rdepend on it.

Then we just need to inject it into the runWeston script and adjust the 
two init scripts to point at that.

Any concerns or objections?


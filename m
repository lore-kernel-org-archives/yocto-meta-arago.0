Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438B0CA1013
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 01:34:07 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4040.1757122443094000094
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 18:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZcamLi2K;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5861Y2GP3826991
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 20:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757122442;
	bh=L3Z+L2054E+jr/XKFocZb7ki811ZlspREAVHiv93/Po=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZcamLi2KJMNXg0zqUaECCEtHP3N74lQb/H8lGpwdSsXT54+so83GBO/LGEOP+Jghm
	 2G5CwWYgPTTo+RwzEWO+L+TPcBl0/fDD5I6wCyXlEsrak8HljAVy82c7YePpPF7fb0
	 Ob4KTh3wGzv21DIfuyWPNWVd4eEbm5HkSCZr8Ia4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5861Y2cH1295333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 20:34:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 20:34:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 20:34:01 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5861Y14l1288611;
	Fri, 5 Sep 2025 20:34:01 -0500
Message-ID: <e7e456cd-e8b6-4998-946b-36d01381211b@ti.com>
Date: Fri, 5 Sep 2025 20:34:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 0/3] opencl-clhpp v2.0.16 ->
 v2024.05.08
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250905233849.2506703-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 06 Sep 2025 01:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16541

On 9/5/25 6:38 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Dear all,
> 
> The C OpenCL Headers are on version 2024.05.08, however the C++ are lagging
> behind. With this patch series, I am bumping the C++ OpenCL headers also to
> version 2024.05.08.

I was going to suggest just updating these in meta-oe upstream, but looks
like the latest master branch has both the C and C++ headers at 2025.07.22
now, do you still need this at all on our master branch?

Andrew

> 
> The C++ headers, depend on cmake files from the C headers. The current
> package was not providing them. I made some changes to correct this.
> 
> This series is a v2 to the following:
> https://patchwork.yoctoproject.org/project/arago/list/?series=34239&state=*
> 
> Kind Regards,
> Antonios
> 
> 
> Antonios Christidis (3): meta-arago-test: recipes-extended: Cmake support
> for opencl-headers meta-arago-test: recipes-extended: Specify correct PV
> for ocl headers meta-arago-test: recipes-extended: opencl-clhpp v2.0.16 ->
> v2024.05.08
> 
>   .../opencl/opencl-clhpp_%.bbappend               |  4 ++++
> .../recipes-extended/opencl/opencl_clhpp-ti.inc  |  7 +++++++
> .../opencl/opencl_headers-ti.inc                 | 16 ++++++++++++++++ 3
> files changed, 27 insertions(+) create mode 100644
> meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend create mode
> 100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
> 
> -- 2.34.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16537): https://lists.yoctoproject.org/g/meta-arago/message/16537
> Mute This Topic: https://lists.yoctoproject.org/mt/115092087/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 



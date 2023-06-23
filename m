Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D41EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 04:24:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.35580.1687494278682881442
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 21:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YbGyYSPB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35N4OYum096373;
	Thu, 22 Jun 2023 23:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687494274;
	bh=dGc/MgSUr7+BB9F7rTUQ2KorTiLa+wt4PJg6ZpgfqUc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YbGyYSPB2g6uTqcLtXcHmHs5yHKDsqxInrCZNcewrrGNNHFsTBDW3Sblh0zesi2xd
	 nm77Nt98DbhPfmYsetKXyE6zw8qj3a1y8ouj/ZXkcBtaMwE0l3XOJ8pnF5Y7N9mlLB
	 tIn/3ISNoJg46rQHrDfshmI0YdZnMa7QmKSVnoS4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35N4OYsN114156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 23:24:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 23:24:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 23:24:34 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35N4OVbk031268;
	Thu, 22 Jun 2023 23:24:32 -0500
Message-ID: <9da200f4-3fd4-b40f-06ad-0af9974cb0a5@ti.com>
Date: Fri, 23 Jun 2023 09:54:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v2 3/3] tisdk-default-image: Add package
 group for netopeer/sysrepo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <praneeth@ti.com>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-4-r-gunasekaran@ti.com>
 <20230622155805.GO1518@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230622155805.GO1518@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jun 2023 04:24:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14685



On 6/22/23 9:28 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 22, 2023 at 04:04:45PM +0530, Ravi Gunasekaran wrote:
>> Add new package group for netopeer2, sysrepo, nw-configurator
>> and yang models.
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>  .../recipes-core/images/tisdk-default-image.bb  |  1 +
>>  .../packagegroup-arago-tisdk-sysrepo.bb         | 17 +++++++++++++++++
>>  2 files changed, 18 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index bb825e09..7769c97c 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -28,6 +28,7 @@ IMAGE_INSTALL += "\
>>      ti-analytics \
>>      ti-demos \
>>      ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>> +    packagegroup-arago-tisdk-sysrepo \
>>  "
>>  
>>  export IMAGE_BASENAME = "tisdk-default-image"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
>> new file mode 100644
>> index 00000000..14608dfe
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "Netopeer2 and Sysrepo packagegroup"
>> +LICENSE = "MIT"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> This packagegroup doesn't seem to be machine-specific, so no need for the 
> above line.

I will remove this in the next series.

> 
> 
>> +inherit packagegroup
>> +
>> +ARAGO_NETOPEER_SYSREPO = "\
>> +    sysrepo \
>> +    netopeer2-server \
>> +    nw-configurator \
>> +    tsn-yang-models \
>> +"
>> +
>> +RDEPENDS:${PN} = "\
>> +    ${ARAGO_NETOPEER_SYSREPO} \
>> +"
>> -- 
>> 2.17.1

-- 
Regards,
Ravi


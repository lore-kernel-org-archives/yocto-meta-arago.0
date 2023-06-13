Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64482C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 04:32:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6323.1686630750102310382
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 21:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oJ1dxc11;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35D4WQn7021018;
	Mon, 12 Jun 2023 23:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686630746;
	bh=aHrNipS/MoXyCQ0j2+zKAAv1365GBfo5C1d3ve9bkNg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oJ1dxc110IIDJOxI/AxpvnqcXy4WME7VShE+pBULx2xpyZHdnqhoSQI2j/BT4MxO0
	 8CbjFOypFs+E/AKBfb+Z9NLVofHL8Yq6VcetiSeTMhFQuO5zijm0BO7DhLZ6oEVF9H
	 3pepsuLZETMpJmGaH4XijKOQOn88gk/cVxbmYqQc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35D4WQLf127809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 23:32:26 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 23:32:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 23:32:26 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35D4WOBu126603;
	Mon, 12 Jun 2023 23:32:25 -0500
Message-ID: <991b2698-1d81-140c-fdb7-bf58a5f25c4c@ti.com>
Date: Tue, 13 Jun 2023 10:02:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-arago] [master/kirkstone 0/3] Introduce
 sysrepo based parser app
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <g-gupta@ti.com>
References: <20230609115557.1685-1-r-gunasekaran@ti.com>
 <20230612205917.GR9226@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230612205917.GR9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 04:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14603



On 6/13/23 2:29 AM, Denys Dmytriyenko wrote:
> So, what is "aragos"? :)

Sorry, my bad. I will correct it.

> 
> Also, meta-sysrepo doesn't seem to be listed as a proper OE layer:
> http://layers.openembedded.org/layerindex/

[1] is the sysrepo yocto project link. 
If meta-sysrepo is not listed as a OE layer, then does it mean, it cannot
be included in meta-arago?

[1] - https://github.com/sartura/meta-sysrepo

> 
> 
> On Fri, Jun 09, 2023 at 05:25:54PM +0530, Ravi Gunasekaran via lists.yoctoproject.org wrote:
>> NETCONF protocol defines a mechanism for device management,
>> retrieving configuration information and modifying device with
>> new configuration data.
>>
>> YANG is a data modelling language used to model configuration
>> and state data manipulated by the NETCONF.
>>
>> NETCONF/YANG is realized through netopeer and sysrepo. A yocto project
>> for the same exists [0].
>>
>> [0] is a fork of [1] with support added for Kirstone. I have sent a
>> pull request for it and it is yet to be acknowledged.
>>
>> NETCONF/YANG support was added in SDK 8.6 and the changeset were added
>> in meta-processor-sdk. But since it was concluded that it is generic
>> networking feature, moving this to meta-arago.
>>
>> I plan to send two more patches once this series is accepted
>> 1) A URL for the meta-sysrepo [0] in oe-layersetup/configs/arago-kirkstone-next-config.txt
>> 2) Add the required package name in tisdk-default-image.bb in meta-arago
>>
>> [0] - https://github.com/ravig07/meta-sysrepo/tree/kirkstone
>> [1] - https://github.com/sartura/meta-sysrepo
>>
>> Ravi Gunasekaran (3):
>>   meta-aragos-extras: sysrepo: Add TSN Yang models
>>   meta-aragos-extras: sysrepo: Add .bbappend for netopeer2
>>   meta-aragos-extras: sysrepo: Introduce nw-configurator app
>>
>>  .../0001-Add-EST-Yang-Models.patch            |  17 +
>>  .../netopeer2-server_git.bbappend             |   6 +
>>  .../nw-configurator/files/nw-configurator.c   | 409 ++++++++++++++++++
>>  .../nw-configurator/nw-configurator.bb        |  25 ++
>>  .../tsn-yang-models/tsn-yang-models_git.bb    |  25 ++
>>  5 files changed, 482 insertions(+)
>>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
>>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
>>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
>>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>>  create mode 100644 meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb

-- 
Regards,
Ravi


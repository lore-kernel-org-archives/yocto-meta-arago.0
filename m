Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41936C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 12:42:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7678.1684932126144435946
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 05:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XEOiMia0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OCg3l9071553;
	Wed, 24 May 2023 07:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684932123;
	bh=MeJzT7IEhZYPTzsGMO7KDaNiCLgzvzonhoxJlPSW6zQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XEOiMia0ey9dhx5zZjdixtrCUdWNDgu6SJFpmE/0ioy58yTV1zY6XOg8PYJC/gPL+
	 0CQkpFppcuWQxS+lM59BZQXKHIlo4c6+IL1lnAzkYrSBerbq4HQTLV2ycxoiNpuXLC
	 pmdD96Dpf7Gq2QlsxU9zZ4k4Lxzfx4R06Vb0ZFUA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OCg315044004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 07:42:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 07:42:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 07:42:03 -0500
Received: from [172.24.145.199] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OCfx5h060294;
	Wed, 24 May 2023 07:42:00 -0500
Message-ID: <4d1494a0-4cdb-400f-a821-a8e4ab520f2c@ti.com>
Date: Wed, 24 May 2023 18:11:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][RESEND PATCH 1/2] v4l-utils: Add recipe for
 v1.23.0
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, "Bajjuri,
 Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Bhatia, Aradhya" <a-bhatia1@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>
References: <20230523094422.1633390-1-j-luthra@ti.com>
 <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
 <2r6t4wth4jin5dizz4z3gt2shaobtj5eg74u5axirsztkdgzlv@5dw6m2omaixu>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <2r6t4wth4jin5dizz4z3gt2shaobtj5eg74u5axirsztkdgzlv@5dw6m2omaixu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 12:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14460

Hi Jai,

On 23/05/23 18:48, Jai Luthra wrote:
> Hi Devarsh,
> 
> Thanks for the review,
> 
> On May 23, 2023 at 17:18:39 +0530, Devarsh Thakkar wrote:
>> Hi Jai,
>>
>> Thanks for the patch.
>>
>> On 23/05/23 15:14, Jai Luthra wrote:
>>> An older recipe (v1.22.0) is present in the meta-openembedded/meta-oe
>>> layer for kirkstone.
>>>
>>> TI's 6.1 based kernel has backported multistream routing APIs [1] from
>>> upstream kernel, which requires a few patches to v4l-utils [2] that only
>>> apply cleanly on top of v1.23.0.
>>>
>>> Thus we override the recipe in this layer to the latest (v1.23.0) found
>>> from meta-oe master.
>>>
>>> Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ca55d70b41e [1]
>>> Link: https://lore.kernel.org/all/20230210115546.199809-1-tomi.valkeinen@ideasonboard.com/ [2]
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> ---
>>>  ...-Don-t-install-libmediactl-and-libv4.patch | 44 ++++++++++
>>>  ...02-original-patch-mediactl-pkgconfig.patch | 21 +++++
>>>  ...iginal-patch-export-mediactl-headers.patch | 24 +++++
>>>  .../v4l-utils/0004-Do-not-use-getsubopt.patch | 60 +++++++++++++
>>>  .../v4l-utils/v4l-utils_1.23.0.bb             | 87 +++++++++++++++++++
>>
>> As per my opinion, not a good idea to bump up package version than default
>> package version shipped by kirkstone i.e. 1.22.1
>> (meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb)
>>
>> As a general rule of thumb, there could be other layers (for e.g. added by
>> vendors) having bbappends assuming shipped package version same as in
>> kirkstone and also build time and runtime dependencies w.r.t other packages
>> are guaranted if all packages stay with same version as shipped by kirkstone
>> and with this new recipe I believe we are kind of deviating from that
>> protection and so my suggestion is to rebase on top of existing package
>> version i.e. 1.22.1
> 
> I agree that it makes sense to keep packages pinned to a version for a 
> particular release (dunfell/kirkstone) for stability and compatibility 
> with other dependencies.
> 
> The only issue here is multi-stream support requires a large chunk of 
> changes to v4l2 userspace APIs, affecting the most commonly used tools 
> for setting up the camera pipeline (media-ctl) and capturing frames 
> (v4l2-ctl).
> 
> While these changes are merged in linux upstream and backported to TI's 
> 6.1 branch, the corresponding v4l-utils changes are still under review 
> upstream.
> 
> There are two options I see here:
> 
> 
>     1. We bump up the v4l-utils recipe in our distribution to a 
>     relatively recent git commit (v1.23.0-9431e4b26b) which is in sync 
>     with TI baseline kernel, and apply only the patches for the extra 
>     features TI uses on top.
> 
>     We also ensure it works well with the dependencies (mainly libc) 
>     provided by rest of the kirkstone layers (so far no issues seen in 
>     my tests)
> 
> 
>     2. We backport these patches to v1.22.1, which was tagged almost 
>     **two years ago** in Oct 2021; while the kernel is on 6.1 (Jan 2023) 
>     and using multistream APIs from 6.3/6.4/still-under-review.
> 
>     We will also have to sync with the latest kernel headers and 
>     extensively test that we don't break some ioctl or are missing 
>     bugfixes to v4l-utils from the past two years, as the kernel 
>     developer(s) for the newer features would not have tested against 
>     the old release.
> 
> 
> That's why I chose option 1 in the current series as an exception to the 
> thumb rule. Let me know if it is a complete no-go to override a recipe 
> here.
> 

Thanks for sharing this details, as discussed in other thread
https://lore.kernel.org/all/1f00c11f-f413-c015-c2fd-24afb475295b@ti.com/
I think v4l-utils is behind since we bumped up kernel to 6.1 so agreed that we
should bump up v4l-utils too.

If possible, I would suggest to go with latest stable version of v4l-utils to
minimize local patch list to apply in new recipe.

Regards
Devarsh

>>
>> Regards
>> Devarsh
> 
> Thanks,
> Jai


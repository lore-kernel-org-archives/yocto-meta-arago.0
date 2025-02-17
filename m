Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37AEC021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:48:47 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.45080.1739771322283108244
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 16 Feb 2025 21:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=udExgecy;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: y-abhilashchandra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51H5mdpq594268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 16 Feb 2025 23:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739771319;
	bh=n2K3nhFDRVva54E0R4eYfStkkwK1OOsoPy8lzhWuGP4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=udExgecyEF2h22NVa7RnMW/0TVBZxM/nh6ZJVr3YKbJ87kZ6dga32AKehQ0alSRLr
	 xqc2j5pPTmqMWvFq6XNkhVRf7a1XEPsLT9qJVEW3GZuV/eVRSqhQA8OnsNyAZB2LSs
	 lkgV7lXejjQSfuVYH6itgePZSN92bSQjJ2LGEN64=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H5mdP2054126;
	Sun, 16 Feb 2025 23:48:39 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 16
 Feb 2025 23:48:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 16 Feb 2025 23:48:38 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H5mZgT071065;
	Sun, 16 Feb 2025 23:48:36 -0600
Message-ID: <fc8cc93c-32bc-4bf5-ab5e-92010d32f44a@ti.com>
Date: Mon, 17 Feb 2025 11:18:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <a-limaye@ti.com>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
 <20250211205111.GU21608@denix.org>
 <f5658e67-238d-4532-ac69-d99755808300@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <f5658e67-238d-4532-ac69-d99755808300@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 51H5mdpq594268
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Feb 2025 05:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15852

Hello everyone,

I have provided my response regarding the concerns raised.
Since I haven=E2=80=99t heard back, I wanted to check if you had
any further thoughts.

Please let me know how you'd like to proceed.

Thanks and Regards,
Yemike Abhilash Chandra.

On 12/02/25 13:46, Yemike Abhilash Chandra wrote:
>=20
>=20
> On 12/02/25 02:21, Denys Dmytriyenko wrote:
>> On Tue, Feb 11, 2025 at 01:28:13PM +0530, Yemike Abhilash Chandra via=20
>> lists.yoctoproject.org wrote:
>>> An older recipe of v4l-utils (v1.26.1) is present in the meta-oe laye=
r
>>> for scarthgap.
>>>
>>> TI's 6.12 based kernel has backported multistream routing APIs from
>>> upstream kernel, which requires v4l-utils to be the latest released
>>> version (v1.28.1).
>>>
>>> Thus we override the recipe in this layer to the latest release of
>>> v4l-utils.
>>
>> There are few issues with this...
>>
>> Do you really need to override the entire recipe? The old .bbappend wa=
s
>> applying a patch already - can you add a new patch to that and bump=20
>> SRCREV?
>>
>=20
> We are not only updating the SRCREV, but also moving to a newer branch
> (stable-1.28), which is why we considered overriding the entire recipe.
> This approach aligns with how we have handled previously, including
> 6.1 timeline, where we followed a similar process.[1]
>=20
> Given that the original recipe package still references an older versio=
n,
> do you suggest that we update the branch in the existing .bbappend,
> even though the base recipe remains on an older version?
>=20
> Please let me know if you want me to do that way.
>=20
> [1]: https://lore.kernel.org/all/20230525104036.2050245-1-j-luthra@ti.c=
om/
>=20
> Thanks,
> Yemike Abhilash Chandra
>=20
>> If you do need to override the entire recipe, then you first need to=20
>> clearly
>> articulate your reason in the commit log - wanting a newer commit=20
>> isn't such
>> a reason
>>
>> Then you need to do it in 2 steps/patches - first you copy over the=20
>> existing
>> recipe verbatim w/o any modifications, and in a separate step make you=
r
>> modifications
>>
>> Also, having own copy of an upstream recipe requires special attention=
=20
>> to not
>> violate the Yocto Project Compatible guidelines. I've explained this=20
>> recently
>> in another thread here on the list
>>


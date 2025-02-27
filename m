Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F864C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 04:55:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4164.1740632114205148588
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 20:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VwcV/s+2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R4tBnh1663879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 22:55:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740632111;
	bh=6TbLtNVzmhLaJ0/jbETNF5sZy9E9+p4LFj7VwYNv4HM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VwcV/s+25+YdwcJCnwEH72w9muI1B7yGDOc7lCmi8jXk0umd4SW4gb9Tc7lqmkD79
	 r+gz5ZrsBOyWfVbfSUYaQefHePEE8KOIEj18lbDmhsXKmkgARNWYAyTtPOVum8Jjb8
	 Dc4pi34AR+2RFso0nXTnjTDLW94TVfVvwkEaPQJM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R4tB4J001242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 22:55:11 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 22:55:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 22:55:10 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R4t7sE070735;
	Wed, 26 Feb 2025 22:55:08 -0600
Message-ID: <a4d08a6c-c8c4-466f-a68c-c417a71cbfe8@ti.com>
Date: Thu, 27 Feb 2025 10:25:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <a-limaye@ti.com>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
 <20250211205111.GU21608@denix.org>
 <f5658e67-238d-4532-ac69-d99755808300@ti.com>
 <fc8cc93c-32bc-4bf5-ab5e-92010d32f44a@ti.com>
 <b6008e79-5410-4e99-b83f-8d2e0ffb3c55@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <b6008e79-5410-4e99-b83f-8d2e0ffb3c55@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 51R4tBnh1663879
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Feb 2025 04:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15926

Hi Ryan,

On 26/02/25 21:04, Ryan Eatmon wrote:
>=20
>=20
> On 2/16/2025 11:48 PM, Yemike Abhilash Chandra wrote:
>> Hello everyone,
>>
>> I have provided my response regarding the concerns raised.
>> Since I haven=E2=80=99t heard back, I wanted to check if you had
>> any further thoughts.
>>
>> Please let me know how you'd like to proceed.
>=20
> One final question...=C2=A0 You said that this patch is for master as w=
ell,=20
> but I'm seeing a collision between this and the same recipe from=20
> meta-openembedded on master.=C2=A0 Should this patch be applied to mast=
er? Or=20
> is the meta-openembedded version good enough?
>=20

Yes, the master branch of meta-openembedded has the latest version.
Please skip this patch for the master branch. The meta-openembedded
version is good enough.

Thanks and Regards
Yemike Abhilash Chandra

>=20
>=20
>> Thanks and Regards,
>> Yemike Abhilash Chandra.
>>
>> On 12/02/25 13:46, Yemike Abhilash Chandra wrote:
>>>
>>>
>>> On 12/02/25 02:21, Denys Dmytriyenko wrote:
>>>> On Tue, Feb 11, 2025 at 01:28:13PM +0530, Yemike Abhilash Chandra=20
>>>> via lists.yoctoproject.org wrote:
>>>>> An older recipe of v4l-utils (v1.26.1) is present in the meta-oe la=
yer
>>>>> for scarthgap.
>>>>>
>>>>> TI's 6.12 based kernel has backported multistream routing APIs from
>>>>> upstream kernel, which requires v4l-utils to be the latest released
>>>>> version (v1.28.1).
>>>>>
>>>>> Thus we override the recipe in this layer to the latest release of
>>>>> v4l-utils.
>>>>
>>>> There are few issues with this...
>>>>
>>>> Do you really need to override the entire recipe? The old .bbappend =
was
>>>> applying a patch already - can you add a new patch to that and bump=20
>>>> SRCREV?
>>>>
>>>
>>> We are not only updating the SRCREV, but also moving to a newer branc=
h
>>> (stable-1.28), which is why we considered overriding the entire recip=
e.
>>> This approach aligns with how we have handled previously, including
>>> 6.1 timeline, where we followed a similar process.[1]
>>>
>>> Given that the original recipe package still references an older=20
>>> version,
>>> do you suggest that we update the branch in the existing .bbappend,
>>> even though the base recipe remains on an older version?
>>>
>>> Please let me know if you want me to do that way.
>>>
>>> [1]:=20
>>> https://lore.kernel.org/all/20230525104036.2050245-1-j-luthra@ti.com/
>>>
>>> Thanks,
>>> Yemike Abhilash Chandra
>>>
>>>> If you do need to override the entire recipe, then you first need to=
=20
>>>> clearly
>>>> articulate your reason in the commit log - wanting a newer commit=20
>>>> isn't such
>>>> a reason
>>>>
>>>> Then you need to do it in 2 steps/patches - first you copy over the=20
>>>> existing
>>>> recipe verbatim w/o any modifications, and in a separate step make y=
our
>>>> modifications
>>>>
>>>> Also, having own copy of an upstream recipe requires special=20
>>>> attention to not
>>>> violate the Yocto Project Compatible guidelines. I've explained this=
=20
>>>> recently
>>>> in another thread here on the list
>>>>
>=20


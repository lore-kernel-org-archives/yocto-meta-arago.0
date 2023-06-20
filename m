Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D8EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 04:06:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3101.1687233979257949095
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 21:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=etnUy1Gl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35K46FTE014240;
	Mon, 19 Jun 2023 23:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687233975;
	bh=VQkEi+6xg+smahJes7MUNVtxdt9uFu3+2PWzpDRBSeM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=etnUy1GlQ5ZqbPEarkSP6LpBogqCxtmHN8/7ouFUpZ6zYMx1J3usSUTEBTjBWtt9F
	 P8vKYLfYcLWdfPpsbNl0sfNEQbyiAJV3fYXtoA6KxO6+QpGdS+9K8UzOrEjDdD/grA
	 Cul60RcWDq1EceWVBWmZtKoWyxUJ69o9nfgD6waE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35K46FWo109176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 23:06:15 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 23:06:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 23:06:14 -0500
Received: from [10.249.130.150] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35K46C8w112960;
	Mon, 19 Jun 2023 23:06:13 -0500
Message-ID: <089e1c0a-2d7b-21a6-91f5-3d745bf4e388@ti.com>
Date: Tue, 20 Jun 2023 09:36:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe-layersetup PATCH] configs: Update Kirkstone config for
 sysrepo
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <g-gupta@ti.com>
References: <20230616084538.10530-1-r-gunasekaran@ti.com>
 <20230616194834.GG1518@denix.org>
 <2c6142f3-a4f5-99d7-9738-65560e10e18c@ti.com>
 <be4894a1-47c6-d2dc-a95c-8fd028a147a0@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <be4894a1-47c6-d2dc-a95c-8fd028a147a0@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 35K46FTE014240
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 04:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14657



On 6/20/2023 3:34 AM, Ryan Eatmon wrote:
>
>
> On 6/18/2023 11:34 PM, Ravi Gunasekaran wrote:
>> Denys,
>>
>> On 6/17/23 1:18 AM, Denys Dmytriyenko wrote:
>>> On Fri, Jun 16, 2023 at 02:15:38PM +0530, Ravi Gunasekaran wrote:
>>>> NETCONF/YANG is implemented through netopeer2/sysrepo.
>>>> A Yocto project for sysrepo is available in public domain[1].
>>>>
>>>> [1] is compatible only with Yocto Honister branch. So update
>>>> the config with [2] which is fork of [1] for Kirkstone.
>>>>
>>>> [1] - https://github.com/sartura/meta-sysrepo
>>>> [2] - https://github.com/ravig07/meta-sysrepo
>>>
>>> So, you are bumping many of the recipes in that layer, plus updating =
to the
>>> new override syntax and setting compatibility with kirkstone. The PR =
has been
>>> setting open since May 4 w/o any comments, so it's probably safe to a=
ssume the
>>> layer is abandoned. Why not move the recipes to an active layer? At l=
east to
>>> meta-arago, or even better work on upstreaming them to meta-openembed=
ded?
>>>
>>> Regardless, the changes for kirkstone appear to be safe to langdale a=
nd
>>> mickledore - that would allow including the change in master builds t=
oo.
>>
>> Yes, the PR has been open since quite some time.
>> I did think of adding the recipes to meta-arago, but since the recipes=
 already
>> exists in the public domain, I felt moving them to meta-arago might no=
t be the
>> right way.
>
> We should pull any needed recipes into meta-arago and not in a forked r=
epo of
> meta-sysrepo...
>
> Are you signing up to maintain your forked copy of meta-sysrepo for all=
 time?=C2=A0
> If not, then we should migrate your required changes into meta-arago-ex=
tras
> and just deal with the fact that we as TI need to maintain them.
>

Understood. I will add the recipes to meta-aragos-extras then.

>
>>>
>>>
>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>> ---
>>>> I have sent a Pull Request for [2]. Once it gets merged, then the UR=
I
>>>> in the config.txt can be replaced with it.
>>>>
>>>> =C2=A0 configs/arago-kirkstone-config.txt | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/configs/arago-kirkstone-config.txt
>>>> b/configs/arago-kirkstone-config.txt
>>>> index c2524a4..e80ab80 100644
>>>> --- a/configs/arago-kirkstone-config.txt
>>>> +++ b/configs/arago-kirkstone-config.txt
>>>> @@ -10,6 +10,7 @@
>>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kir=
kstone,HEAD,
>>>> =C2=A0
>>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3D=
meta-ti-extras:meta-ti-bsp
>>>> =C2=A0
>>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=
=3Dmeta-arm:meta-arm-toolchain
>>>> =C2=A0
>>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEA=
D,layers=3Dmeta
>>>> +meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HEAD=
,layers=3D
>>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>>> =C2=A0 BITBAKE_INCLUSIVE_VARS=3Dyes
>>>> --=C2=A0
>>>> 2.17.1
>>
>



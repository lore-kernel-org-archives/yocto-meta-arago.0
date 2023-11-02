Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F31C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 11:48:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.28692.1698925709054006421
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 04:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=yZS4c0dM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2BmO1t057071;
	Thu, 2 Nov 2023 06:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698925704;
	bh=btFwbiAxc1rJrPk2m8uMysO2VlvdwSdyGpyqGuGzxFc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yZS4c0dMaruYU2DqtLkQB2SAvjSes6mhRZJ2GDLrWiwN+P6hMs/5Yrie4AIZrOTHA
	 BTHCFyVnsvAOAkTQl5MJyblIV94h1LNyKannyMrIjTPHnvJZSPSPn59i7lM+rG8PKZ
	 VPamTQ1txjHMJATdC6GbnzJbRlrY4o7HcRCErQnc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2BmOkL017464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 06:48:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 06:48:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 06:48:24 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2BmL9K103210;
	Thu, 2 Nov 2023 06:48:22 -0500
Message-ID: <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
Date: Thu, 2 Nov 2023 17:18:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH 1/2]
 tisdk-sw-manifest: Add code to not fail on tar error
Content-Language: en-US
To: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, <b-liu@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3A2BmO1t057071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Nov 2023 11:48:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14988

Hi Ryan,

On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
>
>
> On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
>> On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> We want to add an image into the core bundle, but that image does not
>>> have any opkg .control files.=C2=A0 tar apparently errors out if you =
ask it
>>> to extract out files but the files are not in the archive, and the
>>> recipes are setup that if any of the commands in the shell error out,
>>> then the entire recipe fails.
>>>
>>> Simple fix, add an || (or) condition to the tar command to print a
>>> message that there were not any control files instead of erroring out.
>>
>> So, simply bypassing tar error due to missing *.control files still=20
>> won't
>> enable you to properly generate the SW manifest. As those *.control=20
>> files
>> from individual packages are parsed to extract the license information.
>> And they are missing because tiny image specifically disables "package
>> management" to save on space. Therefore tiny image was not included in
>> the bundle, since it doesn't generate the SW manifest.
>
> And this is why I sent the patch in rather than just taking it. This=20
> patch was a response to Chirag running in the above error when trying=20
> to add the tiny image into the core bundle in the processor sdk.
>
> So, why do we want to add tiny to the bundle?


We got a requirement from Bin Liu to add tiny-image in=20
/board-support/prebuilt-images/ of the SDK bundle.
I'm not sure about the "why do we want it to the bundle" part. Adding=20
Bin to provide more insights on the requirement part.

Regards,
Chirag

> =C2=A0 Since tiny should be a subset of the other images, is there anyt=
hing=20
> not covered in the software manifest that should prevent this patch?
>
>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass=20
>>> b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>> index 14d14f08..b9c63610 100644
>>> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>> @@ -405,10 +405,10 @@ sw_manifest_target() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Only extract=
 tar.gz or tar.bz2 types
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
ar xJf=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C=20
>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
ar xJf=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C=20
>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control=20
>>> files found in ${image}"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [ -e=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
ar xzf=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C=20
>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
ar xzf=20
>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C=20
>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control=20
>>> files found in ${image}"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> =C2=A0 --
>>> 2.17.1
>


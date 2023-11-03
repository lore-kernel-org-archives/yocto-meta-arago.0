Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAB0C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 16:18:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.57365.1699028318713261854
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 09:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=POertpQL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GIWbb107101;
	Fri, 3 Nov 2023 11:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699028312;
	bh=Ukzml4uwqPHnfSrPr8WHrCTfFpHYxCgR3C5c8gGnBwU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=POertpQLlRk+dbskaovE+EAgBxRtytTE72nfiHOmXk0qSLIYvWJ3BazFwsUAuu/Mz
	 Ca4L3o6v//bMnP8cR/1HcLaeNEZgEXJb30iUcP6/mfTV6xrPNAf+hQATRLHAIjh4Z7
	 OtreJBFJG97ypwEwc6JQwGK+BuNF+mLkRoPKcoks=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3GIWGJ055016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 11:18:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 11:18:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 11:18:32 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GIVdv087146;
	Fri, 3 Nov 2023 11:18:32 -0500
Message-ID: <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
Date: Fri, 3 Nov 2023 11:18:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH 1/2]
 tisdk-sw-manifest: Add code to not fail on tar error
Content-Language: en-US
To: Bin Liu <b-liu@ti.com>, Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231102203703.gy4myj7fqayadhgw@iaqt7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3A3GIWbb107101
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Nov 2023 16:18:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14994



On 11/2/2023 3:37 PM, Bin Liu wrote:
> Hi,
>=20
> On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote:
>> Hi Ryan,
>>
>> On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
>>>> On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
>>>> lists.yoctoproject.org wrote:
>>>>> We want to add an image into the core bundle, but that image does n=
ot
>>>>> have any opkg .control files.=C2=A0 tar apparently errors out if yo=
u ask it
>>>>> to extract out files but the files are not in the archive, and the
>>>>> recipes are setup that if any of the commands in the shell error ou=
t,
>>>>> then the entire recipe fails.
>>>>>
>>>>> Simple fix, add an || (or) condition to the tar command to print a
>>>>> message that there were not any control files instead of erroring o=
ut.
>>>>
>>>> So, simply bypassing tar error due to missing *.control files still
>>>> won't
>>>> enable you to properly generate the SW manifest. As those *.control
>>>> files
>>>> from individual packages are parsed to extract the license informati=
on.
>>>> And they are missing because tiny image specifically disables "packa=
ge
>>>> management" to save on space. Therefore tiny image was not included =
in
>>>> the bundle, since it doesn't generate the SW manifest.
>>>
>>> And this is why I sent the patch in rather than just taking it. This
>>> patch was a response to Chirag running in the above error when trying=
 to
>>> add the tiny image into the core bundle in the processor sdk.
>>>
>>> So, why do we want to add tiny to the bundle?
>>
>>
>> We got a requirement from Bin Liu to add tiny-image in
>> /board-support/prebuilt-images/ of the SDK bundle.
>> I'm not sure about the "why do we want it to the bundle" part. Adding =
Bin to
>> provide more insights on the requirement part.
>=20
> The tiny image is very small and uses SysVInit. It has been used in man=
y
> use cases, initramfs is the most important one as far as I am aware.


All of the images now use systemd.

The issue comes down to license compliance.  The core bundle has the=20
requirement to produce a software license manifest for all of the items=20
within the image.  That manifest is generated off of the opkg control=20
files.  But the tiny image does not have opkg installed as it is not=20
needed for the purpose of that image.  So we cannot gather the manifest=20
information from the tiny image.

So we have an impossible situation here.  We cannot include the tiny=20
image without violation the manifest requirement.  And given that the=20
tiny image is mainly meant for wakeup efforts, I don't see a need to=20
include it in the bundle.  If someone wants the tiny image, they can=20
always run bitbake and generate it.  It should not take that much time=20
given that it contains almost no packages within it.


> -Bin.
>=20
>>
>> Regards,
>> Chirag
>>
>>>  =C2=A0 Since tiny should be a subset of the other images, is there a=
nything
>>> not covered in the software manifest that should prevent this patch?
>>>
>>>>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> ---
>>>>>  =C2=A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++-=
-
>>>>>  =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>> b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>> index 14d14f08..b9c63610 100644
>>>>> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>> @@ -405,10 +405,10 @@ sw_manifest_target() {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Only extr=
act tar.gz or tar.bz2 types
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tar xJf
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tar xJf
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
>>>>> control files found in ${image}"
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [ -e
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tar xzf
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 tar xzf
>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
>>>>> control files found in ${image}"
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>>  =C2=A0 --
>>>>> 2.17.1
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


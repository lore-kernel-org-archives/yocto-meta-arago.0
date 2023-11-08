Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DE1C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:12:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14605.1699452755777051183
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 06:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=xTozFzpo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8ECSkF002504;
	Wed, 8 Nov 2023 08:12:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699452748;
	bh=/05mKDs+L3+b9HWGM0Rsd7i4wgwq07+/JcoRbZVBICI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xTozFzpolg41EonzWY5nYmSDdZyyl0eDR46pQZ5NlLBHvGUHdlr6SH9E28E9ZEV4h
	 Kb624tCWQAKT2N5hX+5Eyx7zoub75q6XsG7DSxw4/6YXi8NKqb4HkwiiAMtDF7YDG7
	 f4N67mNfB2YijUF773/E7h9jM75o2o4p5ovsM2Es=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8ECS4V024039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 08:12:28 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 08:12:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 08:12:28 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8ECRvN047171;
	Wed, 8 Nov 2023 08:12:28 -0600
Message-ID: <bcbfaff6-dafa-4aad-9ae1-a8bbcc3ef610@ti.com>
Date: Wed, 8 Nov 2023 08:12:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest: Add
 code to not fail on tar error
Content-Language: en-US
To: Bin Liu <b-liu@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Chirag Shilwant <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231031140433.14899-1-reatmon@ti.com>
 <20231031154434.GF2408@denix.org>
 <938c557e-e04b-43ed-9668-63620ce6851a@ti.com>
 <c957a70a-4a46-4afe-9361-697d8f1fab37@ti.com>
 <20231102203703.gy4myj7fqayadhgw@iaqt7>
 <2839e4d9-fcf0-4d24-880d-815f3929f59e@ti.com>
 <20231103211745.GO2408@denix.org> <20231107221944.dybbybpqvwj54kl4@iaqt7>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231107221944.dybbybpqvwj54kl4@iaqt7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3A8ECSkF002504
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 14:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15004



On 11/7/2023 4:19 PM, Bin Liu wrote:
> Hi,
>=20
> On Fri, Nov 03, 2023 at 05:17:45PM -0400, Denys Dmytriyenko wrote:
>> On Fri, Nov 03, 2023 at 11:18:31AM -0500, Ryan Eatmon via lists.yoctop=
roject.org wrote:
>>>
>>>
>>> On 11/2/2023 3:37 PM, Bin Liu wrote:
>>>> Hi,
>>>>
>>>> On Thu, Nov 02, 2023 at 05:18:21PM +0530, Chirag Shilwant wrote:
>>>>> Hi Ryan,
>>>>>
>>>>> On 31/10/23 21:29, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>>>
>>>>>>
>>>>>> On 10/31/2023 10:44 AM, Denys Dmytriyenko wrote:
>>>>>>> On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via
>>>>>>> lists.yoctoproject.org wrote:
>>>>>>>> We want to add an image into the core bundle, but that image doe=
s not
>>>>>>>> have any opkg .control files.=C2=A0 tar apparently errors out if=
 you ask it
>>>>>>>> to extract out files but the files are not in the archive, and t=
he
>>>>>>>> recipes are setup that if any of the commands in the shell error=
 out,
>>>>>>>> then the entire recipe fails.
>>>>>>>>
>>>>>>>> Simple fix, add an || (or) condition to the tar command to print=
 a
>>>>>>>> message that there were not any control files instead of errorin=
g out.
>>>>>>>
>>>>>>> So, simply bypassing tar error due to missing *.control files sti=
ll
>>>>>>> won't
>>>>>>> enable you to properly generate the SW manifest. As those *.contr=
ol
>>>>>>> files
>>>>>> >from individual packages are parsed to extract the license inform=
ation.
>>>>>>> And they are missing because tiny image specifically disables "pa=
ckage
>>>>>>> management" to save on space. Therefore tiny image was not includ=
ed in
>>>>>>> the bundle, since it doesn't generate the SW manifest.
>>>>>>
>>>>>> And this is why I sent the patch in rather than just taking it. Th=
is
>>>>>> patch was a response to Chirag running in the above error when try=
ing to
>>>>>> add the tiny image into the core bundle in the processor sdk.
>>>>>>
>>>>>> So, why do we want to add tiny to the bundle?
>>>>>
>>>>>
>>>>> We got a requirement from Bin Liu to add tiny-image in
>>>>> /board-support/prebuilt-images/ of the SDK bundle.
>>>>> I'm not sure about the "why do we want it to the bundle" part. Addi=
ng Bin to
>>>>> provide more insights on the requirement part.
>>>>
>>>> The tiny image is very small and uses SysVInit. It has been used in =
many
>>>> use cases, initramfs is the most important one as far as I am aware.
>>>
>>>
>>> All of the images now use systemd.
>>
>> Correction - all of the images in a single build use the same init man=
ager,
>> which by default is systemd.
>=20
> systermd or sysvinit is not a concern, as long as there is a "tiny"
> image for initramfs use cases.
>=20
>>
>> There used to be a hack that would force tiny image to use SysVinit, e=
ven
>> when other images use systemd. It was non-standard and problematic, so=
 was
>> removed recently.
>>
>> There is still a way to control init manager for all Arago images by s=
etting
>> ARAGO_SYSVINIT=3D"1" or more directly INIT_MANAGER=3D"sysvinit". But t=
hat would
>> affect all images, not just tiny.
>>
>> And if you really want tiny to use SysVinit and other images to use sy=
stemd,
>> you have to build them separately and you cannot have tiny in tisdk bu=
ndle.
>>
>> FS images in the bundle.
>>> The issue comes down to license compliance.  The core bundle has the
>>> requirement to produce a software license manifest for all of the
>>> items within the image.  That manifest is generated off of the opkg
>>> control files.  But the tiny image does not have opkg installed as
>>> it is not needed for the purpose of that image.  So we cannot gather
>>> the manifest information from the tiny image.
>>>
>>> So we have an impossible situation here.  We cannot include the tiny
>>> image without violation the manifest requirement.  And given that
>>> the tiny image is mainly meant for wakeup efforts, I don't see a
>>> need to include it in the bundle.  If someone wants the tiny image,
>=20
> I guess by "wakeup efforts" you meant TI internal consumption? No,
> customers often used it for custom board bringup. The importance has no
> difference from the "tiny" image to other
>=20
> -Bin.

The issue is not if customers find the image useful, the issue is=20
license reporting compliance we have for including the prebuilt image as=20
part of the core-bundle.  Since we cannot auto generate the license=20
manifest since our code uses the opkg framework to extract that info, we=20
cannot generate the license manifest for the tiny image.

A new system for correctly generating the license manifest would have to=20
be devised to support this request.  At this time, we cannot include the=20
tiny image in the core-bundle.  A must larger effort to revamp the=20
manifest code would have be done to correctly fulfill this corporate=20
requirement.

And there is nothing stopping a customer from setting up a yocto build=20
and running:

MACHINE=3D????? bitbake tisdk-tiny-image

We just cannot, currently, do it for them and include it in the prebuilt=20
bundle.



>>> they can always run bitbake and generate it.  It should not take
>>> that much time given that it contains almost no packages within it.
>>>
>>>
>>>> -Bin.
>>>>
>>>>>
>>>>> Regards,
>>>>> Chirag
>>>>>
>>>>>>  =C2=A0 Since tiny should be a subset of the other images, is ther=
e anything
>>>>>> not covered in the software manifest that should prevent this patc=
h?
>>>>>>
>>>>>>>
>>>>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>>>>> ---
>>>>>>>>  =C2=A0 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 =
++--
>>>>>>>>  =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>>>>> b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>>>>> index 14d14f08..b9c63610 100644
>>>>>>>> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>>>>> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
>>>>>>>> @@ -405,10 +405,10 @@ sw_manifest_target() {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Only e=
xtract tar.gz or tar.bz2 types
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tar xJf
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
>>>>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tar xJf
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C
>>>>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
>>>>>>>> control files found in ${image}"
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [ -=
e
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tar xzf
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
>>>>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tar xzf
>>>>>>>> ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C
>>>>>>>> ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No
>>>>>>>> control files found in ${image}"
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>>>>>  =C2=A0 --
>>>>>>>> 2.17.1
>>>>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


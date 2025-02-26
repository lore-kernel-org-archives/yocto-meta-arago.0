Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446B6C19776
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 21:20:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.16928.1740604852486725413
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 13:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TV9rKa3/;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QLKnZN1658051
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 15:20:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740604849;
	bh=gPVV0ps7Yt3Lc46ZHPyxBmOETp7m577ORNKiVOnekkg=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=TV9rKa3/uDCgl+e477Kv649BeNzMsUoPIwSuVT5el77qGcjO7fDzfnHKgju7eYaWw
	 XEvtHK1uFNbJhlG4r8vWhym9DBslPzUxyDyIHYmfQxYQtTDdkIGTagPu7ZyDepwHNg
	 yyDl5c5BQVzvptlPomajAgMqy2XLL8iBlZSTiPVU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QLKmxO065596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 15:20:48 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 15:20:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 15:20:48 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QLKm9N030051;
	Wed, 26 Feb 2025 15:20:48 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 26 Feb 2025 15:20:48 -0600
Message-ID: <D82OX8G8LTUU.307PE16JJWS5L@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
        <vijayp@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH] packagegroups: opencl and
 vulkan utilities
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250226201334.3807093-1-rs@ti.com>
 <20250226204304.GH1879@denix.org>
In-Reply-To: <20250226204304.GH1879@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Feb 2025 21:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15923

On Wed Feb 26, 2025 at 2:43 PM CST, Denys Dmytriyenko wrote:
> On Wed, Feb 26, 2025 at 02:13:34PM -0600, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add package groups for OpenCL and Vulkan related utilities.
>> Conditionally install them in tisdk-default-image if we enable the
>> required distro features.
>>=20
>> Currently these package groups consist of clinfo and vulkaninfo
>> respectively. These are useful tools for checking device extension
>> compatibility and ICD loader functionality.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  .../recipes-core/images/tisdk-default-image.bb      |  2 ++
>>  .../packagegroups/packagegroup-arago-opencl.bb      | 13 +++++++++++++
>>  .../packagegroups/packagegroup-arago-vulkan.bb      | 13 +++++++++++++
>>  3 files changed, 28 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/package=
group-arago-opencl.bb
>>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/package=
group-arago-vulkan.bb
>>=20
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.b=
b b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index aace490b..bc067857 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -17,6 +17,8 @@ IMAGE_INSTALL +=3D "\
>>      ti-test-extras \
>>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago=
-tisdk-graphics','',d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago=
-tisdk-gtk','',d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago=
-opencl','',d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago=
-vulkan','',d)} \
>>      packagegroup-arago-tisdk-connectivity \
>>      packagegroup-arago-tisdk-crypto \
>>      packagegroup-arago-tisdk-multimedia \
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-opencl.bb
>> new file mode 100644
>> index 00000000..49b6efc8
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-op=
encl.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION =3D "Group containing various useful 0penCL packages"
>
> SUMMARY is required these days.
>
>
>> +LICENSE =3D "MIT"

Verifying against oe-core I see that LICENSE is no longer being populated a=
s
well. Do you want me to drop that or not?

>> +PR =3D "r0"
>
> No explicit PR is needed these days.
>
>
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +inherit packagegroup features_check
>> +
>> +REQUIRED_DISTRO_FEATURES =3D "opencl"
>> +
>> +RDEPENDS:${PN} =3D "\
>> +    clinfo \
>> +"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-vulkan.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-vulkan.bb
>> new file mode 100644
>> index 00000000..36ee4b7b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vu=
lkan.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION =3D "Group containing various useful Vulkan packages"
>> +LICENSE =3D "MIT"
>> +PR =3D "r0"
>
> Same 2 comments as above.
>
>
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +inherit packagegroup features_check
>> +
>> +REQUIRED_DISTRO_FEATURES =3D "vulkan"
>> +
>> +RDEPENDS:${PN} =3D "\
>> +    vulkan-tools \
>> +"
>> --=20
>> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15922): https://lists.yoctoproject.org/g/meta-arago/m=
essage/15922
> Mute This Topic: https://lists.yoctoproject.org/mt/111403398/7094281
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [rs@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



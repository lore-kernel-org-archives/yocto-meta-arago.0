Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ACF44529EA
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 13:44:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GDipwu015272
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:44:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GDioZA000957
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:44:51 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 16 Jul 2013 08:44:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 08:44:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-arago] [PATCHv3] KMSCube: Add Demo 3D graphics application
Thread-Index: AQHOfrujvxMdzVa2t0GbxQgSVWI7cZlnV6NA
Date: Tue, 16 Jul 2013 13:44:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159657A20@DLEE11.ent.ti.com>
References: <1373367532-6282-1-git-send-email-mrinmayee@ti.com>
	<51DBF092.9080109@ti.com> <51DF8B90.9030009@ti.com>
In-Reply-To: <51DF8B90.9030009@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3] KMSCube: Add Demo 3D graphics application
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 13:44:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Thursday, July 11, 2013 11:53 PM
>To: Hingolikar, Mrinmayee
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCHv3] KMSCube: Add Demo 3D graphics
>application
>
>Any comments on this patch?

This patch seems OK, but has dependencies on other patches that have un-add=
ressed comments.

>
>On 7/9/2013 4:44 PM, Mrinmayee Hingolikar wrote:
>> Kindly ignore the v2 patch. I had missed a few comments.
>>
>> On 7/9/2013 4:28 PM, Mrinmayee Hingolikar wrote:
>>> * Showcases 3D graphics on SGX using kms and gbm
>>>
>>> v2:
>>>
>>> * Added DEPENDS for libdrm, libgbm and omap-sgx userspace
>>> * INSANE_SKIP to avoid package dependencies
>>>
>>> v3:
>>>
>>> * Remove inc file as we have a version only .bb file. This
>>>   fixes the review comment received with v1.
>>>
>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>> ---
>>>  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18
>++++++++++++++++++
>>>  1 files changed, 18 insertions(+), 0 deletions(-)
>>>  create mode 100644 meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>>>
>>> diff --git a/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>>> new file mode 100644
>>> index 0000000..e18e398
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>>> @@ -0,0 +1,18 @@
>>> +SUMMARY =3D "Demo application to showcase 3D graphics on SGX
>using kms and gbm"
>>> +HOMEPAGE =3D "http://git.ti.com"
>>> +LICENSE =3D "BSD"
>>> +LIC_FILES_CHKSUM =3D
>"file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff738
>1270dd631fb"
>>> +
>>> +DEPENDS =3D "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
>>> +
>>> +COMPATIBLE_MACHINE =3D "omap-a15"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +SRCREV =3D "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
>>> +
>>> +INSANE_SKIP_kmscube +=3D "dev-deps"
>>
>
>
>--
>Regards,
>Mrinmayee
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


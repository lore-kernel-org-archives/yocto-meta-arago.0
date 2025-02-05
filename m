Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BEFC02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 19:12:59 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21013.1738782775439435770
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 11:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eq0CadXU;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515JCsBD3409810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 13:12:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738782774;
	bh=xwL4vs4jZOWGdsnr1oCqLr1p3uE27yRBtjfB6wN2EXU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eq0CadXUAOVUQKcb4lUq5zKEK02eO/bkUyQCmWerlO5ri2WIJqHlVc7Mu2alvrMOL
	 lwSzIKN4Y8RqR2nxyqXNNNcm4diUFlYBga9+PHsryocfhkQj//SGrsfVgNsbcgG16l
	 XspKAYHqjR+s8x9OKB8NiXS+j3an/kxpxxBAQbUI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515JCsro011600
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 13:12:54 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 13:12:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 13:12:54 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515JCs74009063;
	Wed, 5 Feb 2025 13:12:54 -0600
Message-ID: <a7820604-2e5c-46d5-9682-4e308a216a43@ti.com>
Date: Wed, 5 Feb 2025 13:12:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master][PATCH v3] ti-test: Add mcrc64
 test application
To: "Kumar, Udit" <u-kumar1@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>
References: <20250204071637.4141957-1-a-limaye@ti.com>
 <2cee080e-5776-40c0-bd2d-b05f28a10d4b@ti.com>
 <713ed18e-7ae7-4882-a673-ccb5be39e367@ti.com>
 <2111944c-65a9-4e9e-8da0-43ba0e6478eb@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <2111944c-65a9-4e9e-8da0-43ba0e6478eb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 515JCsBD3409810
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 19:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15809

On 2/5/25 12:13 PM, Kumar, Udit wrote:
>=20
> On 2/5/2025 10:19 PM, Chirag Shilwant wrote:
>>
>> On 05/02/25 20:19, Andrew Davis via lists.yoctoproject.org wrote:
>>> On 2/4/25 1:=E2=80=8A16 AM, Aniket Limaye via lists.=E2=80=8Ayoctopro=
ject.=E2=80=8Aorg wrote: > From: Udit Kumar <u-kumar1@=E2=80=8Ati.=E2=80=8A=
com> > > Add mcrc64 test application recipe. > This application is docume=
nted at[0]. Why? Also the source shouldn't be here
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the sourc=
e of this email and know the content is safe.
>>> Report=C2=A0Suspicious
>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqV30l1mwbIKX=
EnDNjH0oo99olCbsPqm549YsQxoVJEzrvd9guIUd37GXbtnlWpwdZCGrcEUvq4uINTkJrifT6=
tlU$>
>>> ZjQcmQRYFpfptBannerEnd
>>> On 2/4/25 1:16 AM, Aniket Limaye via lists.yoctoproject.org wrote:
>>> > From: Udit Kumar <u-kumar1@ti.com>
>>> > > Add mcrc64 test application recipe.
>>> > This application is documented at[0].
>>>
>>> Why?
>>>
>>> Also the source shouldn't be here in the yocto recipe, how do you
>>> expect the other distros we offer to make use of this?
>>
>>
>> +1 on Andrew's point
>>
>> We already had a discussion on the above point with hwspinlocktest in =
past [1]
>> which was reworked to go via GitHub way [2]
>>
> Thanks for examples
>=20
>=20
>> Let's not use meta-arago to be a placeholder for example applications
>>
> If this is policy decision, not to hold source code then fine
>=20
>=20
> But with example given, I had mixed views
>=20
> 1) git is someone's public repo git://github.com/sumananna/omap-hwspinl=
ock-test=C2=A0 ,
>=20
> is this allowed ?
>=20

It is perfectly fine to use someones personal repo as the source
for a package. This is the nature of open source, most of the
projects we use are just someones personal project in the end.
We would have very little software if we only allowed official
corporate-backed projects.

In this case, since Suman works for TI, we could probably go
and at least clone that repo over to github.com/texasinstruments

>=20
> 2) hwspinlocktests/files has c code and Makefile patches.
>=20
> If policy is not to hold source code then IMO, above patches should be =
checked into above git
>=20

Make a new project under github.com/texasinstruments for this application.

Andrew

>=20
>=20
>> [1]: https://lists.yoctoproject.org/g/meta-arago/message/15577
>>
>> [2]: https://lists.yoctoproject.org/g/meta-arago/message/15630
>>
>>
>> --=20
>> Chirag
>>
>>
>>
>>>
>>> Put it on github, or if it specifically testing some kernel interface
>>> then maybe in the kernel source under tools/testing/crypto/ with the
>>> other crypto userspace tests.
>>>
>>> Andrew
>>>
>>> > > [0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-=
j722s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kerne=
l_Drivers/MCRC64.html
>>> > > Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>>> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>> > ---
>>> > v3:
>>> > * Ryan:
>>> > - Maintain aplhabetical ordering of ti-test packages
>>> > > v2:
>>> > * Denys:
>>> > - Add required SUMMARY variable as per https://urldefense.com/v3/__=
https://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.h=
tml*required-variables__;Iw!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkGRs=
c-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMDFqsJ3A$
>>> > ---
>>> >=C2=A0=C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> >=C2=A0=C2=A0 .../recipes-kernel/mcrc64/files/mcrc64.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 114 ++++++++++++++++++
>>> >=C2=A0=C2=A0 .../recipes-kernel/mcrc64/mcrc64.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +++
>>> >=C2=A0=C2=A0 3 files changed, 133 insertions(+)
>>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/mcrc6=
4/files/mcrc64.c
>>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/mcrc6=
4/mcrc64.bb
>>> > > diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.b=
b b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> > index 814e3ea6..857e06fb 100644
>>> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> > @@ -31,6 +31,7 @@ TI_TEST_BASE =3D "\
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linuxptp \
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lmbench \
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lsof \
>>> > +=C2=A0=C2=A0=C2=A0 mcrc64 \
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media-ctl \
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memtester \
>>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mstpd \
>>> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c b=
/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>>> > new file mode 100644
>>> > index 00000000..fc7a75d6
>>> > --- /dev/null
>>> > +++ b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>>> > @@ -0,0 +1,114 @@
>>> > +/*
>>> > + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.=
ti.com/
>>> > + *
>>> > + *
>>> > + *=C2=A0 Redistribution and use in source and binary forms, with o=
r without
>>> > + *=C2=A0 modification, are permitted provided that the following c=
onditions
>>> > + *=C2=A0 are met:
>>> > + *
>>> > + *=C2=A0=C2=A0=C2=A0 Redistributions of source code must retain th=
e above copyright
>>> > + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follo=
wing disclaimer.
>>> > + *
>>> > + *=C2=A0=C2=A0=C2=A0 Redistributions in binary form must reproduce=
 the above copyright
>>> > + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follo=
wing disclaimer in the
>>> > + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided=
 with the
>>> > + *=C2=A0=C2=A0=C2=A0 distribution.
>>> > + *
>>> > + *=C2=A0=C2=A0=C2=A0 Neither the name of Texas Instruments Incorpo=
rated nor the names of
>>> > + *=C2=A0=C2=A0=C2=A0 its contributors may be used to endorse or pr=
omote products derived
>>> > + *=C2=A0=C2=A0=C2=A0 from this software without specific prior wri=
tten permission.
>>> > + *
>>> > + *=C2=A0 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CO=
NTRIBUTORS
>>> > + *=C2=A0 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,=
 BUT NOT
>>> > + *=C2=A0 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND=
 FITNESS FOR
>>> > + *=C2=A0 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TH=
E COPYRIGHT
>>> > + *=C2=A0 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,=
 INCIDENTAL,
>>> > + *=C2=A0 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, =
BUT NOT
>>> > + *=C2=A0 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; =
LOSS OF USE,
>>> > + *=C2=A0 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSE=
D AND ON ANY
>>> > + *=C2=A0 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILIT=
Y, OR TORT
>>> > + *=C2=A0 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OU=
T OF THE USE
>>> > + *=C2=A0 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF S=
UCH DAMAGE.
>>> > + *
>>> > +*/
>>> > +
>>> > +#include <unistd.h>
>>> > +#include <stdio.h>
>>> > +#include <stdlib.h>
>>> > +#include <sys/socket.h>
>>> > +#include <linux/if_alg.h>
>>> > +#include <string.h>
>>> > +
>>> > +#define BUFFER_SIZE 4096
>>> > +#define SECTOR 4096
>>> > +
>>> > +int main (int argc, char **argv) {
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 int desc[2] =3D { -1, -1 };
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 struct sockaddr_alg sock =3D {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_family =3D AF_ALG=
,
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_type=C2=A0=C2=A0 =
=3D "hash",
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_name=C2=A0=C2=A0 =
=3D "crc64-iso3309"
>>> > +=C2=A0=C2=A0=C2=A0 };
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 if ((desc[0] =3D socket(AF_ALG, SOCK_SEQPACKET,=
 0)) =3D=3D -1 ) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("socket");
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 if( bind(desc[0], (struct sockaddr *) &sock, si=
zeof(sock)) !=3D 0 ) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("bind");
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 if( (desc[1] =3D accept(desc[0], NULL, 0)) =3D=3D=
 -1 )
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 if (argc !=3D 2 || strlen(argv[1]) =3D=3D 0) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Please specify =
filename\n");
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1; // empty str=
ing
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 FILE* file;
>>> > +=C2=A0=C2=A0=C2=A0 unsigned char *buffer;
>>> > +=C2=A0=C2=A0=C2=A0 if(posix_memalign((void *)&buffer, SECTOR, BUFF=
ER_SIZE)) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("posix_memalign =
failed");
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 file =3D fopen(argv[1], "rb");
>>> > +=C2=A0=C2=A0=C2=A0 if(file =3D=3D NULL)
>>> > +=C2=A0=C2=A0=C2=A0 {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("An error occure=
d while opening file: %s\n", argv[1]);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(buffer);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 while(!feof(file))
>>> > +=C2=A0=C2=A0=C2=A0 {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int count =3D =
fread(buffer, sizeof(char), BUFFER_SIZE, file);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(ferror(file))
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 printf("An error occurred while accessing the file: %s\n", argv[1]);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 fclose(file);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 free(buffer);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -1;
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (send(desc[1], buffe=
r, count, MSG_MORE) !=3D count) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 free(buffer);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -1;
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 long int crc64 =3D 0x0000000000000000;
>>> > +=C2=A0=C2=A0=C2=A0 if(read(desc[1], &crc64, 8) !=3D 8) {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(buffer);
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> > +=C2=A0=C2=A0=C2=A0 }
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 printf("0x%llx\n", crc64);
>>> > +=C2=A0=C2=A0=C2=A0 free(buffer);
>>> > +=C2=A0=C2=A0=C2=A0 return 0;
>>> > +}
>>> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta=
-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>>> > new file mode 100644
>>> > index 00000000..a707430d
>>> > --- /dev/null
>>> > +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>>> > @@ -0,0 +1,18 @@
>>> > +SUMMARY =3D "Application to test MCRC64 driver"
>>> > +LICENSE =3D "BSD-3-Clause"
>>> > +LIC_FILES_CHKSUM =3D "file://mcrc64.c;beginline=3D1;endline=3D33;m=
d5=3D070547e79367134fcfdf7fdb5e3ef7e3"
>>> > +
>>> > +SRC_URI =3D "file://mcrc64.c"
>>> > +
>>> > +S =3D "${WORKDIR}/sources"
>>> > +UNPACKDIR =3D "${S}"
>>> > +
>>> > +do_compile() {
>>> > +=C2=A0=C2=A0=C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.=
c -o mcrc64
>>> > +}
>>> > +
>>> > +
>>> > +do_install() {
>>> > +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>>> > +=C2=A0=C2=A0=C2=A0 install -m 0755 mcrc64 ${D}${bindir}
>>> > +}
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#15805):https://urldefense.com/v3/__https://lists.=
yoctoproject.org/g/meta-arago/message/15805__;!!G3vK!RlOQdh0cJ3K3zbE5Uxlj=
taoX2scOlnmA4tUkGRsc-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMLXSjQHz$
>>> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoprojec=
t.org/mt/110988349/7030289__;!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkG=
Rsc-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMOPoo8w_$
>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.or=
g/g/meta-arago/unsub__;!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkGRsc-kj=
DqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMDDbYZHU$ [c-shilwant@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>


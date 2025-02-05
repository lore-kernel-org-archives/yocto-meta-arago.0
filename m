Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92A2C02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 19:14:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.19451.1738779206540834588
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 10:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=j0y4bQTa;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: u-kumar1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515IDPrX2581992
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 12:13:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738779206;
	bh=IBa+TjtsurAZgamo3Xm+kDWl5bV68k3CUyN/jBPGSbU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j0y4bQTa2/J5bJwaymPs3R1bPTiaNaYmREaqdDGsGZvagSXqXivztXxqzbnOqbmAK
	 TMpK11D5oKWQAAZeOtYxY2F1aTJy1FgXm31PcvWwyrZl1Py5CAT/uwrqHIg2dqb2a6
	 Lsum1Zdfty2oHzOavme7WAMjEBt2bibOGdsbHez4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515IDPBf005076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 12:13:25 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 12:13:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 12:13:25 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515IDMVm075378;
	Wed, 5 Feb 2025 12:13:23 -0600
Message-ID: <2111944c-65a9-4e9e-8da0-43ba0e6478eb@ti.com>
Date: Wed, 5 Feb 2025 23:43:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3] ti-test: Add mcrc64 test application
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <afd@ti.com>, <a-limaye@ti.com>
References: <20250204071637.4141957-1-a-limaye@ti.com>
 <2cee080e-5776-40c0-bd2d-b05f28a10d4b@ti.com>
 <713ed18e-7ae7-4882-a673-ccb5be39e367@ti.com>
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <713ed18e-7ae7-4882-a673-ccb5be39e367@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 515IDPrX2581992
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 19:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15811


On 2/5/2025 10:19 PM, Chirag Shilwant wrote:
>
> On 05/02/25 20:19, Andrew Davis via lists.yoctoproject.org wrote:
>> On 2/4/25 1:=E2=80=8A16 AM, Aniket Limaye via lists.=E2=80=8Ayoctoprojec=
t.=E2=80=8Aorg wrote:=20
>> > From: Udit Kumar <u-kumar1@=E2=80=8Ati.=E2=80=8Acom> > > Add mcrc64 te=
st=20
>> application recipe. > This application is documented at[0]. Why? Also=20
>> the source shouldn't be here
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the=20
>> source of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqV30l1mwbIKXEnD=
NjH0oo99olCbsPqm549YsQxoVJEzrvd9guIUd37GXbtnlWpwdZCGrcEUvq4uINTkJrifT6tlU$>=
=20
>>
>> ZjQcmQRYFpfptBannerEnd
>> On 2/4/25 1:16 AM, Aniket Limaye via lists.yoctoproject.org wrote:
>> > From: Udit Kumar <u-kumar1@ti.com>
>> > > Add mcrc64 test application recipe.
>> > This application is documented at[0].
>>
>> Why?
>>
>> Also the source shouldn't be here in the yocto recipe, how do you
>> expect the other distros we offer to make use of this?
>
>
> +1 on Andrew's point
>
> We already had a discussion on the above point with hwspinlocktest in=20
> past [1]
> which was reworked to go via GitHub way [2]
>
Thanks for examples


> Let's not use meta-arago to be a placeholder for example applications
>
If this is policy decision, not to hold source code then fine


But with example given, I had mixed views

1) git is someone's public repo=20
git://github.com/sumananna/omap-hwspinlock-test=C2=A0 ,

is this allowed ?


2) hwspinlocktests/files has c code and Makefile patches.

If policy is not to hold source code then IMO, above patches should be=20
checked into above git



> [1]: https://lists.yoctoproject.org/g/meta-arago/message/15577
>
> [2]: https://lists.yoctoproject.org/g/meta-arago/message/15630
>
>
> --=20
> Chirag
>
>
>
>>
>> Put it on github, or if it specifically testing some kernel interface
>> then maybe in the kernel source under tools/testing/crypto/ with the
>> other crypto userspace tests.
>>
>> Andrew
>>
>> > > [0]:=20
>> https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722s/10_01_=
00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/MCRC=
64.html
>> > > Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> > ---
>> > v3:
>> > * Ryan:
>> > - Maintain aplhabetical ordering of ti-test packages
>> > > v2:
>> > * Denys:
>> > - Add required SUMMARY variable as per=20
>> https://urldefense.com/v3/__https://docs.yoctoproject.org/next/contribut=
or-guide/recipe-style-guide.html*required-variables__;Iw!!G3vK!RlOQdh0cJ3K3=
zbE5UxljtaoX2scOlnmA4tUkGRsc-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMDF=
qsJ3A$
>> > ---
>> >=C2=A0=C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> >=C2=A0=C2=A0 .../recipes-kernel/mcrc64/files/mcrc64.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 114=20
>> ++++++++++++++++++
>> >=C2=A0=C2=A0 .../recipes-kernel/mcrc64/mcrc64.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +++
>> >=C2=A0=C2=A0 3 files changed, 133 insertions(+)
>> >=C2=A0=C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/mcrc64/m=
crc64.bb
>> > > diff --git=20
>> a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> > index 814e3ea6..857e06fb 100644
>> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> > @@ -31,6 +31,7 @@ TI_TEST_BASE =3D "\
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linuxptp \
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lmbench \
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lsof \
>> > +=C2=A0=C2=A0=C2=A0 mcrc64 \
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media-ctl \
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memtester \
>> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mstpd \
>> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c=20
>> b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>> > new file mode 100644
>> > index 00000000..fc7a75d6
>> > --- /dev/null
>> > +++ b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>> > @@ -0,0 +1,114 @@
>> > +/*
>> > + * Copyright (C) 2025 Texas Instruments Incorporated -=20
>> http://www.ti.com/
>> > + *
>> > + *
>> > + *=C2=A0 Redistribution and use in source and binary forms, with or=
=20
>> without
>> > + *=C2=A0 modification, are permitted provided that the following=20
>> conditions
>> > + *=C2=A0 are met:
>> > + *
>> > + *=C2=A0=C2=A0=C2=A0 Redistributions of source code must retain the a=
bove copyright
>> > + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followin=
g disclaimer.
>> > + *
>> > + *=C2=A0=C2=A0=C2=A0 Redistributions in binary form must reproduce th=
e above=20
>> copyright
>> > + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followin=
g disclaimer=20
>> in the
>> > + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided wi=
th the
>> > + *=C2=A0=C2=A0=C2=A0 distribution.
>> > + *
>> > + *=C2=A0=C2=A0=C2=A0 Neither the name of Texas Instruments Incorporat=
ed nor the=20
>> names of
>> > + *=C2=A0=C2=A0=C2=A0 its contributors may be used to endorse or promo=
te products=20
>> derived
>> > + *=C2=A0=C2=A0=C2=A0 from this software without specific prior writte=
n permission.
>> > + *
>> > + *=C2=A0 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND=20
>> CONTRIBUTORS
>> > + *=C2=A0 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BU=
T NOT
>> > + *=C2=A0 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND=20
>> FITNESS FOR
>> > + *=C2=A0 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE=
=20
>> COPYRIGHT
>> > + *=C2=A0 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,=20
>> INCIDENTAL,
>> > + *=C2=A0 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
 NOT
>> > + *=C2=A0 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOS=
S=20
>> OF USE,
>> > + *=C2=A0 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED A=
ND=20
>> ON ANY
>> > + *=C2=A0 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, =
OR=20
>> TORT
>> > + *=C2=A0 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT O=
F=20
>> THE USE
>> > + *=C2=A0 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH=
=20
>> DAMAGE.
>> > + *
>> > +*/
>> > +
>> > +#include <unistd.h>
>> > +#include <stdio.h>
>> > +#include <stdlib.h>
>> > +#include <sys/socket.h>
>> > +#include <linux/if_alg.h>
>> > +#include <string.h>
>> > +
>> > +#define BUFFER_SIZE 4096
>> > +#define SECTOR 4096
>> > +
>> > +int main (int argc, char **argv) {
>> > +
>> > +=C2=A0=C2=A0=C2=A0 int desc[2] =3D { -1, -1 };
>> > +
>> > +=C2=A0=C2=A0=C2=A0 struct sockaddr_alg sock =3D {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_family =3D AF_ALG,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_type=C2=A0=C2=A0 =3D=
 "hash",
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .salg_name=C2=A0=C2=A0 =3D=
 "crc64-iso3309"
>> > +=C2=A0=C2=A0=C2=A0 };
>> > +
>> > +=C2=A0=C2=A0=C2=A0 if ((desc[0] =3D socket(AF_ALG, SOCK_SEQPACKET, 0)=
) =3D=3D -1 ) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("socket");
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 if( bind(desc[0], (struct sockaddr *) &sock, sizeo=
f(sock)) !=3D=20
>> 0 ) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("bind");
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 if( (desc[1] =3D accept(desc[0], NULL, 0)) =3D=3D =
-1 )
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +
>> > +=C2=A0=C2=A0=C2=A0 if (argc !=3D 2 || strlen(argv[1]) =3D=3D 0) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Please specify fil=
ename\n");
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1; // empty string
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 FILE* file;
>> > +=C2=A0=C2=A0=C2=A0 unsigned char *buffer;
>> > +=C2=A0=C2=A0=C2=A0 if(posix_memalign((void *)&buffer, SECTOR, BUFFER_=
SIZE)) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror("posix_memalign fai=
led");
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 file =3D fopen(argv[1], "rb");
>> > +=C2=A0=C2=A0=C2=A0 if(file =3D=3D NULL)
>> > +=C2=A0=C2=A0=C2=A0 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("An error occured w=
hile opening file: %s\n", argv[1]);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(buffer);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 while(!feof(file))
>> > +=C2=A0=C2=A0=C2=A0 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int count =3D fre=
ad(buffer, sizeof(char),=20
>> BUFFER_SIZE, file);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(ferror(file))
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("An error occurred while accessing the file:=20
>> %s\n", argv[1]);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fc=
lose(file);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fr=
ee(buffer);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -1;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (send(desc[1], buffer, =
count, MSG_MORE) !=3D count) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fr=
ee(buffer);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -1;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 long int crc64 =3D 0x0000000000000000;
>> > +=C2=A0=C2=A0=C2=A0 if(read(desc[1], &crc64, 8) !=3D 8) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(buffer);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 printf("0x%llx\n", crc64);
>> > +=C2=A0=C2=A0=C2=A0 free(buffer);
>> > +=C2=A0=C2=A0=C2=A0 return 0;
>> > +}
>> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb=20
>> b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>> > new file mode 100644
>> > index 00000000..a707430d
>> > --- /dev/null
>> > +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>> > @@ -0,0 +1,18 @@
>> > +SUMMARY =3D "Application to test MCRC64 driver"
>> > +LICENSE =3D "BSD-3-Clause"
>> > +LIC_FILES_CHKSUM =3D=20
>> "file://mcrc64.c;beginline=3D1;endline=3D33;md5=3D070547e79367134fcfdf7f=
db5e3ef7e3"
>> > +
>> > +SRC_URI =3D "file://mcrc64.c"
>> > +
>> > +S =3D "${WORKDIR}/sources"
>> > +UNPACKDIR =3D "${S}"
>> > +
>> > +do_compile() {
>> > +=C2=A0=C2=A0=C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -=
o mcrc64
>> > +}
>> > +
>> > +
>> > +do_install() {
>> > +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> > +=C2=A0=C2=A0=C2=A0 install -m 0755 mcrc64 ${D}${bindir}
>> > +}
>>
>>
>>=20
>>
>>


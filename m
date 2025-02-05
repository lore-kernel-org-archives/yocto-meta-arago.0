Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD7DC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 16:49:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.17148.1738774181645259517
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 08:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=y6z7rE22;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515Gne0m3389527
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 10:49:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738774180;
	bh=ZYcSUkdKIelb/nWftBkt/NOOsIEiTMWfgTuGMH7wMQU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y6z7rE2211EQ6M5mcnFIW6OmjZQrGJ3i4mRlMs6fvy8PyVD68rzkYkkVIEBZ4nQju
	 BWQ/QoLKysq4vbf/pOuegM5CZd37/MpA24JswxmCHJNfCZet19cwwsyMw4OAhWKhK/
	 RSHzgFTkg6y9izjvCqVrtjJQ0JM2Eo83z/+myOjM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515GneKL084028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 10:49:40 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 10:49:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 10:49:39 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515Gnc2g114422;
	Wed, 5 Feb 2025 10:49:38 -0600
Message-ID: <713ed18e-7ae7-4882-a673-ccb5be39e367@ti.com>
Date: Wed, 5 Feb 2025 22:19:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master][PATCH v3] ti-test: Add mcrc64
 test application
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>, <a-limaye@ti.com>
References: <20250204071637.4141957-1-a-limaye@ti.com>
 <2cee080e-5776-40c0-bd2d-b05f28a10d4b@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <2cee080e-5776-40c0-bd2d-b05f28a10d4b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 515Gne0m3389527
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 16:49:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15806


On 05/02/25 20:19, Andrew Davis via lists.yoctoproject.org wrote:
> On 2/4/25 1:=E2=80=8A16 AM, Aniket Limaye via lists.=E2=80=8Ayoctoproje=
ct.=E2=80=8Aorg wrote:=20
> > From: Udit Kumar <u-kumar1@=E2=80=8Ati.=E2=80=8Acom> > > Add mcrc64 t=
est application=20
> recipe. > This application is documented at[0]. Why? Also the source=20
> shouldn't be here
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqV30l1mwbIKXEn=
DNjH0oo99olCbsPqm549YsQxoVJEzrvd9guIUd37GXbtnlWpwdZCGrcEUvq4uINTkJrifT6tl=
U$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On 2/4/25 1:16 AM, Aniket Limaye via lists.yoctoproject.org wrote:
> > From: Udit Kumar <u-kumar1@ti.com>
> >=20
> > Add mcrc64 test application recipe.
> > This application is documented at[0].
>
> Why?
>
> Also the source shouldn't be here in the yocto recipe, how do you
> expect the other distros we offer to make use of this?


+1 on Andrew's point

We already had a discussion on the above point with hwspinlocktest in=20
past [1]
which was reworked to go via GitHub way [2]

Let's not use meta-arago to be a placeholder for example applications


[1]: https://lists.yoctoproject.org/g/meta-arago/message/15577

[2]: https://lists.yoctoproject.org/g/meta-arago/message/15630


--
Chirag



>
> Put it on github, or if it specifically testing some kernel interface
> then maybe in the kernel source under tools/testing/crypto/ with the
> other crypto userspace tests.
>
> Andrew
>
> >=20
> > [0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722=
s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Dr=
ivers/MCRC64.html
> >=20
> > Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > ---
> > v3:
> > * Ryan:
> > - Maintain aplhabetical ordering of ti-test packages
> >=20
> > v2:
> > * Denys:
> > - Add required SUMMARY variable as per https://urldefense.com/v3/__ht=
tps://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.htm=
l*required-variables__;Iw!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkGRsc-=
kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMDFqsJ3A$
> > ---
> >   .../recipes-core/packagegroups/ti-test.bb     |   1 +
> >   .../recipes-kernel/mcrc64/files/mcrc64.c      | 114 +++++++++++++++=
+++
> >   .../recipes-kernel/mcrc64/mcrc64.bb           |  18 +++
> >   3 files changed, 133 insertions(+)
> >   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/files/mcrc=
64.c
> >   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> >=20
> > diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/=
meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > index 814e3ea6..857e06fb 100644
> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > @@ -31,6 +31,7 @@ TI_TEST_BASE =3D "\
> >       linuxptp \
> >       lmbench \
> >       lsof \
> > +    mcrc64 \
> >       media-ctl \
> >       memtester \
> >       mstpd \
> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c b/m=
eta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
> > new file mode 100644
> > index 00000000..fc7a75d6
> > --- /dev/null
> > +++ b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
> > @@ -0,0 +1,114 @@
> > +/*
> > + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti=
.com/
> > + *
> > + *
> > + *  Redistribution and use in source and binary forms, with or witho=
ut
> > + *  modification, are permitted provided that the following conditio=
ns
> > + *  are met:
> > + *
> > + *    Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + *
> > + *    Redistributions in binary form must reproduce the above copyri=
ght
> > + *    notice, this list of conditions and the following disclaimer i=
n the
> > + *    documentation and/or other materials provided with the
> > + *    distribution.
> > + *
> > + *    Neither the name of Texas Instruments Incorporated nor the nam=
es of
> > + *    its contributors may be used to endorse or promote products de=
rived
> > + *    from this software without specific prior written permission.
> > + *
> > + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUT=
ORS
> > + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NO=
T
> > + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNES=
S FOR
> > + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYR=
IGHT
> > + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDE=
NTAL,
> > + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> > + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE,
> > + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND O=
N ANY
> > + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR T=
ORT
> > + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF TH=
E USE
> > + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAM=
AGE.
> > + *
> > +*/
> > +
> > +#include <unistd.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <sys/socket.h>
> > +#include <linux/if_alg.h>
> > +#include <string.h>
> > +
> > +#define BUFFER_SIZE 4096
> > +#define SECTOR 4096
> > +
> > +int main (int argc, char **argv) {
> > +
> > +    int desc[2] =3D { -1, -1 };
> > +
> > +    struct sockaddr_alg sock =3D {
> > +        .salg_family =3D AF_ALG,
> > +        .salg_type   =3D "hash",
> > +        .salg_name   =3D "crc64-iso3309"
> > +    };
> > +
> > +    if ((desc[0] =3D socket(AF_ALG, SOCK_SEQPACKET, 0)) =3D=3D -1 ) =
{
> > +        perror("socket");
> > +        return -1;
> > +    }
> > +
> > +    if( bind(desc[0], (struct sockaddr *) &sock, sizeof(sock)) !=3D =
0 ) {
> > +        perror("bind");
> > +        return -1;
> > +    }
> > +
> > +    if( (desc[1] =3D accept(desc[0], NULL, 0)) =3D=3D -1 )
> > +        return -1;
> > +
> > +    if (argc !=3D 2 || strlen(argv[1]) =3D=3D 0) {
> > +        printf("Please specify filename\n");
> > +        return -1; // empty string
> > +    }
> > +
> > +    FILE* file;
> > +    unsigned char *buffer;
> > +    if(posix_memalign((void *)&buffer, SECTOR, BUFFER_SIZE)) {
> > +        perror("posix_memalign failed");
> > +        return -1;
> > +    }
> > +
> > +    file =3D fopen(argv[1], "rb");
> > +    if(file =3D=3D NULL)
> > +    {
> > +        printf("An error occured while opening file: %s\n", argv[1])=
;
> > +        free(buffer);
> > +        return -1;
> > +    }
> > +
> > +    while(!feof(file))
> > +    {
> > +        unsigned int count =3D fread(buffer, sizeof(char), BUFFER_SI=
ZE, file);
> > +        if(ferror(file))
> > +        {
> > +            printf("An error occurred while accessing the file: %s\n=
", argv[1]);
> > +            fclose(file);
> > +            free(buffer);
> > +            return -1;
> > +        }
> > +
> > +        if (send(desc[1], buffer, count, MSG_MORE) !=3D count) {
> > +            free(buffer);
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    long int crc64 =3D 0x0000000000000000;
> > +    if(read(desc[1], &crc64, 8) !=3D 8) {
> > +        free(buffer);
> > +        return -1;
> > +    }
> > +
> > +    printf("0x%llx\n", crc64);
> > +    free(buffer);
> > +    return 0;
> > +}
> > diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta-a=
rago-test/recipes-kernel/mcrc64/mcrc64.bb
> > new file mode 100644
> > index 00000000..a707430d
> > --- /dev/null
> > +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Application to test MCRC64 driver"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://mcrc64.c;beginline=3D1;endline=3D33;md5=
=3D070547e79367134fcfdf7fdb5e3ef7e3"
> > +
> > +SRC_URI =3D "file://mcrc64.c"
> > +
> > +S =3D "${WORKDIR}/sources"
> > +UNPACKDIR =3D "${S}"
> > +
> > +do_compile() {
> > +	${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -o mcrc64
> > +}
> > +
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}
> > +	install -m 0755 mcrc64 ${D}${bindir}
> > +}
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15805):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15805__;!!G3vK!RlOQdh0cJ3K3zbE5Uxljta=
oX2scOlnmA4tUkGRsc-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMLXSjQHz$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/110988349/7030289__;!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkGRs=
c-kjDqYQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMOPoo8w_$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!RlOQdh0cJ3K3zbE5UxljtaoX2scOlnmA4tUkGRsc-kjDq=
YQ1stPFBFu349vTtJfsd0G9jEzi0dwKrdux3ZabMDDbYZHU$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


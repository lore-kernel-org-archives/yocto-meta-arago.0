Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412FBC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 15:11:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.7893.1658848290283766377
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 08:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=hFJ8IhDe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QFBRF1001124;
	Tue, 26 Jul 2022 10:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658848287;
	bh=BThE1FplL/5zklboOFsOd/d7Z7XFWDTXqeqjBZFnuls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hFJ8IhDeuokuwXNt5GkUYffbhK55aL+TYeZOQtHdgvs3ZnSnv7HS/5nOfh7z+/ByQ
	 RaX5kRAJX49HojP97IbAZifXTvgzZn9zAepwMfTPRhWaCRJm7fWin0oVWz//llrNwa
	 7/cBvMeK0/7BZ+ST8Mku1BqikJCwf7Q57g2Br5uc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QFBRvB084774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 10:11:27 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 10:11:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 10:11:23 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QFBMmu016926;
	Tue, 26 Jul 2022 10:11:23 -0500
Message-ID: <8c1a0a35-58c3-e9c1-8d8f-2b61fabf106d@ti.com>
Date: Tue, 26 Jul 2022 10:11:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago] [dunfell PATCH] cryptodev-module: Backport a patch
 to fix build failure with kernel v5.19
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>, <meta-arago@lists.yoctoproject.org>
CC: Nishanth Menon <nm@ti.com>
References: <20220712175512.3007435-1-dfustini@baylibre.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220712175512.3007435-1-dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 26QFBRF1001124
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Jul 2022 15:11:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13966


I was just brought to my attention that we have missed this patch.  I=20
can't find it in Patchwork (patchwork.yoctoproject.org).  I'll ping the=20
yocto admins to see what is up.


On 7/12/2022 12:55, Drew Fustini wrote:
> From: Nishanth Menon <nm@ti.com>
>=20
> cryptodev-linux/authenc.c: In function =E2=80=98pad_record=E2=80=99:
> cryptodev-linux/authenc.c:317:2: warning: ISO C90 forbids variable leng=
th array =E2=80=98pad=E2=80=99 [-Wvla]
>    317 |  uint8_t pad[block_size];
>        |  ^~~~~~~
>    LD [M]  /home/nmenon/Src/opensource/cryptodev-linux/cryptodev.o
>=20
> Newer kernels enforce build warnings as error now, so.. lets backport a=
n
> upstream fix for the same.
>=20
> Reported-by: Drew Fustini <dfustini@baylibre.com>
> Tested-by: Drew Fustini <dfustini@baylibre.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>   .../cryptodev/cryptodev-module_%.bbappend     |  5 +-
>   ...0001-remove-VLA-usage-from-authenc.c.patch | 60 ++++++++++++++++++=
+
>   2 files changed, 64 insertions(+), 1 deletion(-)
>   create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/files/0=
001-remove-VLA-usage-from-authenc.c.patch
>=20
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-modul=
e_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-modul=
e_%.bbappend
> index c210cc4e2613..4f17153ad200 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bba=
ppend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bba=
ppend
> @@ -2,6 +2,9 @@ PR_append =3D ".arago1"
>  =20
>   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>  =20
> -SRC_URI +=3D "file://0001-Fix-build-for-Linux-5.11-rc1.patch"
> +SRC_URI +=3D " \
> +file://0001-Fix-build-for-Linux-5.11-rc1.patch \
> +file://0001-remove-VLA-usage-from-authenc.c.patch \
> +"
>  =20
>   KERNEL_MODULE_AUTOLOAD +=3D "cryptodev"
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-remo=
ve-VLA-usage-from-authenc.c.patch b/meta-arago-distro/recipes-kernel/cryp=
todev/files/0001-remove-VLA-usage-from-authenc.c.patch
> new file mode 100644
> index 000000000000..c500b47e12af
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-=
usage-from-authenc.c.patch
> @@ -0,0 +1,60 @@
> +From 0acdfe789eb0a7aea20ff104bbd52a14553900db Mon Sep 17 00:00:00 2001
> +From: Cristian Stoica <cristian.stoica@microchip.com>
> +Date: Tue, 28 Jul 2020 10:48:12 +0300
> +Subject: [PATCH] remove VLA usage from authenc.c
> +
> +Linux no longer allows VLA use in the kernel, requiring declaration of
> +arrays to be up-front. This patch fixes "alloca is no longer permitted
> +in linux" build error.
> +
> +Upstream-status: Backport [e8263d2d682b06a1ee7bcb2791a7cf27a4af38e0]
> +
> +Suggested-at: https://github.com/cryptodev-linux/cryptodev-linux/pull/=
49/commits/5b0662b802f40aa5956e095e404c8080828f8858
> +Signed-off-by: Cristian Stoica <cristian.stoica@microchip.com>
> +Signed-off-by: Signed-off-by Nishanth Menon <nm@ti.com>
> +---
> + Makefile  | 2 +-
> + authenc.c | 5 +++--
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 38629b9e4e59..dce06923dfde 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -4,7 +4,7 @@
> + # corresponding CFLAG.
> + #
> + CRYPTODEV_CFLAGS ?=3D #-DENABLE_ASYNC
> +-KBUILD_CFLAGS +=3D -I$(src) $(CRYPTODEV_CFLAGS)
> ++KBUILD_CFLAGS +=3D -I$(src) $(CRYPTODEV_CFLAGS) -Wvla
> + KERNEL_DIR ?=3D /lib/modules/$(shell uname -r)/build
> + VERSION =3D 1.10
> +
> +diff --git a/authenc.c b/authenc.c
> +index 7c236cf6ad34..269b826de70e 100644
> +--- a/authenc.c
> ++++ b/authenc.c
> +@@ -312,9 +312,10 @@ static void read_tls_hash(struct scatterlist *dst=
_sg, int len, void *hash, int h
> + 	scatterwalk_map_and_copy(hash, dst_sg, len - hash_len, hash_len, 0);
> + }
> +
> ++#define TLS_MAX_PADDING_SIZE 256
> + static int pad_record(struct scatterlist *dst_sg, int len, int block_=
size)
> + {
> +-	uint8_t pad[block_size];
> ++	uint8_t pad[TLS_MAX_PADDING_SIZE];
> + 	int pad_size =3D block_size - (len % block_size);
> +
> + 	memset(pad, pad_size - 1, pad_size);
> +@@ -326,7 +327,7 @@ static int pad_record(struct scatterlist *dst_sg, =
int len, int block_size)
> +
> + static int verify_tls_record_pad(struct scatterlist *dst_sg, int len,=
 int block_size)
> + {
> +-	uint8_t pad[256]; /* the maximum allowed */
> ++	uint8_t pad[TLS_MAX_PADDING_SIZE];
> + 	uint8_t pad_size;
> + 	int i;
> +
> +--
> +2.31.1
> +

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


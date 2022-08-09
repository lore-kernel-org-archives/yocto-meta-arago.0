Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942F5C00140
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 01:22:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.6676.1660008135521249673
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 18:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=muDmHtnl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2791MD2Z110877;
	Mon, 8 Aug 2022 20:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660008133;
	bh=Q6X5Gac/x4V4LcU+JCzBFyBS7MKV61AN7pvYORJZQOk=;
	h=Date:From:Subject:To:CC;
	b=muDmHtnlTUzSJjCfIGNk9WvwLR4VNWx1gAw9gKq7fRDrx1grgso1hWM6S1HvvIPXv
	 smKzyu3t1WPC/takhdJyVDdstG0VBUNg6K6cjC1mUPjgQe4xxXt4AegE8EDcDkudqm
	 ntvXDG8lUZgfDILK5dR1LOdVIWbjlmm+sT0xE9D0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2791MDt2007531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Aug 2022 20:22:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 8
 Aug 2022 20:22:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 8 Aug 2022 20:22:13 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2791MDGU025773;
	Mon, 8 Aug 2022 20:22:13 -0500
Message-ID: <0ce1e3ca-a0e7-dd89-dff2-35e99c2bc309@ti.com>
Date: Mon, 8 Aug 2022 20:22:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago] [dunfell PATCH RESEND] cryptodev-module: Backport a
 patch to fix build failure with kernel v5.19
To: <meta-arago@lists.yoctoproject.org>
CC: Nishanth Menon <nm@ti.com>, Drew Fustini <dfustini@baylibre.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 2791MD2Z110877
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Aug 2022 01:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13975



For some reason this did not make it into Patchwork.  I am re-sending=20
this to the list to try and fix that.





cryptodev-linux/authenc.c: In function =E2=80=98pad_record=E2=80=99:
cryptodev-linux/authenc.c:317:2: warning: ISO C90 forbids variable=20
length array =E2=80=98pad=E2=80=99 [-Wvla]
   317 |  uint8_t pad[block_size];
       |  ^~~~~~~
   LD [M]  /home/nmenon/Src/opensource/cryptodev-linux/cryptodev.o

Newer kernels enforce build warnings as error now, so.. lets backport an
upstream fix for the same.

Reported-by: Drew Fustini <dfustini@baylibre.com>
Tested-by: Drew Fustini <dfustini@baylibre.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
  .../cryptodev/cryptodev-module_%.bbappend     |  5 +-
  ...0001-remove-VLA-usage-from-authenc.c.patch | 60 +++++++++++++++++++
  2 files changed, 64 insertions(+), 1 deletion(-)
  create mode 100644=20
meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-usage-fr=
om-authenc.c.patch

diff --git=20
a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend=20
b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index c210cc4e2613..4f17153ad200 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbapp=
end
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbapp=
end
@@ -2,6 +2,9 @@ PR_append =3D ".arago1"
   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
  -SRC_URI +=3D "file://0001-Fix-build-for-Linux-5.11-rc1.patch"
+SRC_URI +=3D " \
+file://0001-Fix-build-for-Linux-5.11-rc1.patch \
+file://0001-remove-VLA-usage-from-authenc.c.patch \
+"
   KERNEL_MODULE_AUTOLOAD +=3D "cryptodev"
diff --git=20
a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-usage-=
from-authenc.c.patch=20
b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-usage-=
from-authenc.c.patch
new file mode 100644
index 000000000000..c500b47e12af
--- /dev/null
+++=20
b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-remove-VLA-usage-=
from-authenc.c.patch
@@ -0,0 +1,60 @@
+From 0acdfe789eb0a7aea20ff104bbd52a14553900db Mon Sep 17 00:00:00 2001
+From: Cristian Stoica <cristian.stoica@microchip.com>
+Date: Tue, 28 Jul 2020 10:48:12 +0300
+Subject: [PATCH] remove VLA usage from authenc.c
+
+Linux no longer allows VLA use in the kernel, requiring declaration of
+arrays to be up-front. This patch fixes "alloca is no longer permitted
+in linux" build error.
+
+Upstream-status: Backport [e8263d2d682b06a1ee7bcb2791a7cf27a4af38e0]
+
+Suggested-at:=20
https://github.com/cryptodev-linux/cryptodev-linux/pull/49/commits/5b0662=
b802f40aa5956e095e404c8080828f8858
+Signed-off-by: Cristian Stoica <cristian.stoica@microchip.com>
+Signed-off-by: Signed-off-by Nishanth Menon <nm@ti.com>
+---
+ Makefile  | 2 +-
+ authenc.c | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 38629b9e4e59..dce06923dfde 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,7 +4,7 @@
+ # corresponding CFLAG.
+ #
+ CRYPTODEV_CFLAGS ?=3D #-DENABLE_ASYNC
+-KBUILD_CFLAGS +=3D -I$(src) $(CRYPTODEV_CFLAGS)
++KBUILD_CFLAGS +=3D -I$(src) $(CRYPTODEV_CFLAGS) -Wvla
+ KERNEL_DIR ?=3D /lib/modules/$(shell uname -r)/build
+ VERSION =3D 1.10
+ +diff --git a/authenc.c b/authenc.c
+index 7c236cf6ad34..269b826de70e 100644
+--- a/authenc.c
++++ b/authenc.c
+@@ -312,9 +312,10 @@ static void read_tls_hash(struct scatterlist=20
*dst_sg, int len, void *hash, int h
+ 	scatterwalk_map_and_copy(hash, dst_sg, len - hash_len, hash_len, 0);
+ }
+ ++#define TLS_MAX_PADDING_SIZE 256
+ static int pad_record(struct scatterlist *dst_sg, int len, int block_si=
ze)
+ {
+-	uint8_t pad[block_size];
++	uint8_t pad[TLS_MAX_PADDING_SIZE];
+ 	int pad_size =3D block_size - (len % block_size);
+ + 	memset(pad, pad_size - 1, pad_size);
+@@ -326,7 +327,7 @@ static int pad_record(struct scatterlist *dst_sg,=20
int len, int block_size)
+ + static int verify_tls_record_pad(struct scatterlist *dst_sg, int=20
len, int block_size)
+ {
+-	uint8_t pad[256]; /* the maximum allowed */
++	uint8_t pad[TLS_MAX_PADDING_SIZE];
+ 	uint8_t pad_size;
+ 	int i;
+ +-- +2.31.1
+
--=20
2.32.0



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#13948):=20
https://lists.yoctoproject.org/g/meta-arago/message/13948
Mute This Topic: https://lists.yoctoproject.org/mt/92338591/6551054
Group Owner: meta-arago+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
[reatmon@ti.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




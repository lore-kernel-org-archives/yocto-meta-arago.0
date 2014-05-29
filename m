Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4055452A1E
	for <meta-arago@arago-project.org>;
	Thu, 29 May 2014 15:03:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4TF35AF007978;
	Thu, 29 May 2014 10:03:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TF357u024081;
	Thu, 29 May 2014 10:03:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 29 May 2014 10:03:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] cryptodev: fix INIT_COMPLETION macro
	change in	kernels 3.13+
Thread-Index: AQHPet7kxWFndWkHCUajPvCwP4cpUZtXqCaA
Date: Thu, 29 May 2014 15:03:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D07770C@DLEE11.ent.ti.com>
References: <1401327562-3151-1-git-send-email-denis@denix.org>
In-Reply-To: <1401327562-3151-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] cryptodev: fix INIT_COMPLETION macro change in	kernels 3.13+
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
X-List-Received-Date: Thu, 29 May 2014 15:03:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, May 28, 2014 8:39 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] cryptodev: fix INIT_COMPLETION macro
>change in kernels 3.13+
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Chase Maupin <chase.maupin@ti.com>

>---
> .../recipes-kernel/cryptodev/cryptodev_1.6.bb      |  4 +-
> ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch | 86
>++++++++++++++++++++++
> 2 files changed, 89 insertions(+), 1 deletion(-)
> create mode 100644 meta-arago-extras/recipes-
>kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-
>INIT_COMPLETION-mac.patch
>
>diff --git a/meta-arago-extras/recipes-
>kernel/cryptodev/cryptodev_1.6.bb b/meta-arago-extras/recipes-
>kernel/cryptodev/cryptodev_1.6.bb
>index 637e59a..086259b 100644
>--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
>+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
>@@ -8,4 +8,6 @@ RREPLACES_${PN} =3D "ocf-linux"
>
> inherit module
>
>-PR =3D "r1"
>+PR =3D "r2"
>+
>+SRC_URI +=3D "file://0002-In-the-3.13-rc1-Linux-kernel-the-
>INIT_COMPLETION-mac.patch"
>diff --git a/meta-arago-extras/recipes-
>kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-
>INIT_COMPLETION-mac.patch b/meta-arago-extras/recipes-
>kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-
>INIT_COMPLETION-mac.patch
>new file mode 100644
>index 0000000..c5c7ec7
>--- /dev/null
>+++ b/meta-arago-extras/recipes-kernel/cryptodev/files/0002-In-
>the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
>@@ -0,0 +1,86 @@
>+From 57b5544de80db85c8955499831fdaa30829db77a Mon Sep 17 00:00:00
>2001
>+From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
>+Date: Thu, 23 Jan 2014 03:40:00 +0100
>+Subject: [PATCH] In the 3.13-rc1 Linux kernel, the
>INIT_COMPLETION macro has
>+ been replaced with an inline function, reinit_completion [1][2].
>We are
>+ currently using the 3.13-rc3 Linux kernel, which leads to the
>following
>+ error:
>+
>+cryptlib.c:279:2: error: implicit declaration of function
>'INIT_COMPLETION' [-Werror=3Dimplicit-function-declaration]
>+  INIT_COMPLETION(cdata->async.result->completion);
>+
>+[1]
>https://github.com/torvalds/linux/commit/c32f74ab2872994bc8336ed36
>7313da3139350ca
>+[2]
>https://github.com/torvalds/linux/commit/62026aedaacedbe1ffe94a359
>9ad4acd8ecdf587
>+
>+Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
>+Reviewed-by: Cristian Stoica <cristian.stoica@freescale.com>
>+Tested-by: Cristian Stoica <cristian.stoica@freescale.com>
>+Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
>+Signed-off-by: Phil Sutter <phil@nwl.cc>
>+
>+Upstream-Status: Backport
>+---
>+ cryptlib.c      | 8 ++++----
>+ cryptodev_int.h | 6 ++++++
>+ 2 files changed, 10 insertions(+), 4 deletions(-)
>+
>+diff --git a/cryptlib.c b/cryptlib.c
>+index 54d5d41..a923c14 100644
>+--- a/cryptlib.c
>++++ b/cryptlib.c
>+@@ -217,7 +217,7 @@ ssize_t cryptodev_cipher_encrypt(struct
>cipher_data *cdata,
>+ {
>+ 	int ret;
>+
>+-	INIT_COMPLETION(cdata->async.result->completion);
>++	reinit_completion(&cdata->async.result->completion);
>+
>+ 	if (cdata->aead =3D=3D 0) {
>+ 		ablkcipher_request_set_crypt(cdata->async.request,
>+@@ -240,7 +240,7 @@ ssize_t cryptodev_cipher_decrypt(struct
>cipher_data *cdata,
>+ {
>+ 	int ret;
>+
>+-	INIT_COMPLETION(cdata->async.result->completion);
>++	reinit_completion(&cdata->async.result->completion);
>+ 	if (cdata->aead =3D=3D 0) {
>+ 		ablkcipher_request_set_crypt(cdata->async.request,
>+ 			(struct scatterlist *)src, dst,
>+@@ -351,7 +351,7 @@ ssize_t cryptodev_hash_update(struct
>hash_data *hdata,
>+ {
>+ 	int ret;
>+
>+-	INIT_COMPLETION(hdata->async.result->completion);
>++	reinit_completion(&hdata->async.result->completion);
>+ 	ahash_request_set_crypt(hdata->async.request, sg, NULL,
>len);
>+
>+ 	ret =3D crypto_ahash_update(hdata->async.request);
>+@@ -363,7 +363,7 @@ int cryptodev_hash_final(struct hash_data
>*hdata, void* output)
>+ {
>+ 	int ret;
>+
>+-	INIT_COMPLETION(hdata->async.result->completion);
>++	reinit_completion(&hdata->async.result->completion);
>+ 	ahash_request_set_crypt(hdata->async.request, NULL, output,
>0);
>+
>+ 	ret =3D crypto_ahash_final(hdata->async.request);
>+diff --git a/cryptodev_int.h b/cryptodev_int.h
>+index 12dd5b1..188063d 100644
>+--- a/cryptodev_int.h
>++++ b/cryptodev_int.h
>+@@ -2,6 +2,12 @@
>+ #ifndef CRYPTODEV_INT_H
>+ # define CRYPTODEV_INT_H
>+
>++#include <linux/version.h>
>++
>++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
>++#  define reinit_completion(x) INIT_COMPLETION(*(x))
>++#endif
>++
>+ #include <linux/init.h>
>+ #include <linux/sched.h>
>+ #include <linux/fs.h>
>+--
>+1.9.1
>+
>--
>1.9.3
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


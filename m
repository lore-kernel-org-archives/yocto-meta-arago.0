Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C757852961
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 22:03:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11M3KY7008129;
	Mon, 1 Feb 2016 16:03:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11M3JVT004027;
	Mon, 1 Feb 2016 16:03:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 16:03:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11M3JRG010541;
	Mon, 1 Feb 2016 16:03:19 -0600
Date: Mon, 1 Feb 2016 17:03:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160201220304.GV11314@edge>
References: <CADySD0G_Sy+0JasUQ=R7Du-iwwLH4OKZ4UBp7v4srHvzDPK50A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0G_Sy+0JasUQ=R7Du-iwwLH4OKZ4UBp7v4srHvzDPK50A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Fix bluetooth.h compilation error with strict C
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
X-List-Received-Date: Mon, 01 Feb 2016 22:03:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please specify:
* what combination of setup and toolchain causes the error (not seen here)
* where this patch comes from
* update Upstream-Status: field accordingly[1]

[1] http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

-- 
Denys


On Sat, Jan 30, 2016 at 09:30:22AM +1300, Ankur Tyagi wrote:
> This patch fixes the compilation error of bluetooth.h on fido branch
> 
> regards
> Ankur
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  .../0001-strict-C-compilation-error-fix.patch      | 41
> ++++++++++++++++++++++
>  .../bluez/bluez4_4.101.bbappend                    |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644
> meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> 
> diff --git
> a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> new file mode 100644
> index 0000000..c2cac24
> --- /dev/null
> +++
> b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> @@ -0,0 +1,41 @@
> +From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi@gallagher.com>
> +Date: Thu, 14 Jan 2016 18:12:23 +1300
> +Subject: [PATCH 1/1] strict C compilation error fix
> +
> +Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> +---
> + lib/bluetooth.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/bluetooth.h b/lib/bluetooth.h
> +index 0fc4508..449431d 100644
> +--- a/lib/bluetooth.h
> ++++ b/lib/bluetooth.h
> +@@ -138,18 +138,18 @@ enum {
> +
> + /* Bluetooth unaligned access */
> + #define bt_get_unaligned(ptr)            \
> +-({                        \
> ++__extension__ ({                \
> +    struct __attribute__((packed)) {    \
> +-        typeof(*(ptr)) __v;        \
> +-    } *__p = (typeof(__p)) (ptr);        \
> ++        __typeof__(*(ptr)) __v;        \
> ++    } *__p = (__typeof__(__p)) (ptr);    \
> +    __p->__v;                \
> + })
> +
> + #define bt_put_unaligned(val, ptr)        \
> + do {                        \
> +    struct __attribute__((packed)) {    \
> +-        typeof(*(ptr)) __v;        \
> +-    } *__p = (typeof(__p)) (ptr);        \
> ++        __typeof__(*(ptr)) __v;        \
> ++    } *__p = (__typeof__(__p)) (ptr);    \
> +    __p->__v = (val);            \
> + } while(0)
> +
> +--
> +1.9.1
> +
> diff --git
> a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> index d111425..acda4ee 100644
> --- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> @@ -5,6 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  SRC_URI +=
> "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
>              file://0001-socket-enable-for-bluez-4_98.patch \
>              file://0001-bluez-enable-source-interface.patch \
> +            file://0001-strict-C-compilation-error-fix.patch \
>  "
>  # udev 150-170 provide its on hid2hci tool and udev rules for it.
> Therefore,
>  # disabling hid2hci from bluez4.
> --

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



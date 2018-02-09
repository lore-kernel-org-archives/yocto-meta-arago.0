Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 607F352985
	for <meta-arago@arago-project.org>;
	Fri,  9 Feb 2018 00:19:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w190JAtH017155
	for <meta-arago@arago-project.org>; Thu, 8 Feb 2018 18:19:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518135550;
	bh=N020B+VhSv02QtIbXL5WozOttP5gcQG9DGem+hCOaQs=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=x/FEV7tGpgTGnu3j7mngZMTsOVG/xq6FShf93WEW62mBTxlwNFkv7jEu2aGsThSC/
	6aMVIppTb7Ztj0IZLaEVqFIHo6ccd342/ygfaUZ5/dFezBv0hzimqnsIR/ZSkFAG77
	lYQhqgW04gLBAncXruBFu1oY1uiUvGrxb9Y3Qg/g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w190JAu0010962
	for <meta-arago@arago-project.org>; Thu, 8 Feb 2018 18:19:10 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 8 Feb 2018 18:19:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 8 Feb 2018 18:19:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w190JAah032758
	for <meta-arago@arago-project.org>; Thu, 8 Feb 2018 18:19:10 -0600
Date: Thu, 8 Feb 2018 19:19:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20180209001909.GA30521@edge>
References: <1518134515-17125-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1518134515-17125-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH] cryptodev-module: backport patch fixing builds with kernel 4.13 or later
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
X-List-Received-Date: Fri, 09 Feb 2018 00:19:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Actually, this is strictly for rocko, as master already has this patch in 
oe-core...


On Thu, Feb 08, 2018 at 07:01:55PM -0500, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49 ++++++++++++++++++++++
>  .../cryptodev/cryptodev-module_%.bbappend          |  4 ++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> 
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> new file mode 100644
> index 0000000..a41efac
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> @@ -0,0 +1,49 @@
> +From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Mon, 4 Sep 2017 11:05:08 +0200
> +Subject: [PATCH] ioctl.c: Fix build with linux 4.13
> +
> +git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +note: (near initialization for 'verbosity_ctl_dir[1]')
> +git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +
> +Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
> +triggering build errors with gcc 5 and 6 (but not with gcc 4)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
> +---
> + ioctl.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ioctl.c b/ioctl.c
> +index 0385203..8d4a162 100644
> +--- a/ioctl.c
> ++++ b/ioctl.c
> +@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
> + 		.mode           = 0644,
> + 		.proc_handler   = proc_dointvec,
> + 	},
> +-	{0, },
> ++	{},
> + };
> + 
> + static struct ctl_table verbosity_ctl_root[] = {
> +@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
> + 		.mode           = 0555,
> + 		.child          = verbosity_ctl_dir,
> + 	},
> +-	{0, },
> ++	{},
> + };
> + static struct ctl_table_header *verbosity_sysctl_header;
> + static int __init init_cryptodev(void)
> +-- 
> +2.7.4
> +
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> index f8a35cd..647c5ea 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> @@ -1,3 +1,7 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
>  PR_append = ".arago0"
>  
>  KERNEL_MODULE_AUTOLOAD += "cryptodev"
> +
> +SRC_URI += "file://0001-ioctl.c-Fix-build-with-linux-4.13.patch"
> -- 
> 2.7.4
> 


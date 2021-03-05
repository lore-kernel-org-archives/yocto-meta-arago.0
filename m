Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7C8C3529A2
	for <meta-arago@arago-project.org>;
	Fri,  5 Mar 2021 00:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21F9940BEC;
	Fri,  5 Mar 2021 00:27:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id j04BAOR4cg9r; Fri,  5 Mar 2021 00:27:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F4167406B7;
	Fri,  5 Mar 2021 00:27:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 56566174524; Thu,  4 Mar 2021 19:27:00 -0500 (EST)
Date: Thu, 4 Mar 2021 19:27:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210305002700.GO4892@denix.org>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org>
	<20210304231845.xtxge5g7em6r7zmo@crisping>
MIME-Version: 1.0
In-Reply-To: <20210304231845.xtxge5g7em6r7zmo@crisping>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago <meta-arago@arago-project.org>
Subject: Re: [PATCH dunfell] cryptodev: Move to 1.12 revision
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
X-List-Received-Date: Fri, 05 Mar 2021 00:26:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 05:18:45PM -0600, Nishanth Menon wrote:
> On 13:48-20210304, Denys Dmytriyenko wrote:
> > On Thu, Mar 04, 2021 at 12:52:00AM -0600, Nishanth Menon wrote:
> > > Cryptodev out of kernel module and suite has yet another set of
> 
> [...]
> 
> > > +PR_append = ".arago0"
> > 
> > Same.
> 
> Thanks.. Subject to our thread continuing in parallel if a new layer is
> needed... just posting for reference a v2 - inline:

Overall looks fine - thanks for addressing all my comments.
We'll see in the other thread if this is needed.


> -- >8 --
> From 7a345806bda670973300e64e32affcf0ceab2d01 Mon Sep 17 00:00:00 2001
> From: Nishanth Menon <nm@ti.com>
> Date: Thu, 4 Mar 2021 00:26:29 -0600
> Subject: [PATCH V2 master/dunfell] cryptodev: Move to 1.12 revision
> 
> Cryptodev out of kernel module and suite has yet another set of
> challenge with broken API compatibility. However, the complete list of
> patches beteween dunfell's default 1.10 and current latest 1.12 revisions:
>  e0c25e289d6b (tag: cryptodev-linux-1.12) Release version 1.12
>  55c6315058fc Fix build for Linux 5.11-rc1
>  2f5e08aebf92 Fix build for Linux 5.9-rc1
>  e8263d2d682b remove VLA usage from authenc.c
>  dafa42cadc86 Fix for change in Kernel 4.4.168
>  f4d3653c8dcb Release version 1.11
>  9e765068582a Fix build for Linux 5.8-rc1
>  7e72f6758f2d enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
>  98b163a23f6b cryptlib.c: fix build on kernel v5.5+
>  a1e738aef624 tests: cipher-aead-srtp: Fix cao->dst alignment
>  f971e0cd4a0e Fix module loading with Linux v5.0-rc5
> 
> We have the following choices
> 1) just cherry-pick minimum set of kernel patches relevant for kernel
> compatibility
> OR
> 2) switch to a newer version with richer set of fixups
> 
> Attempting to switch to 1.12 version with minimal changes as a better
> option to get a wider swath of kernel compatibility (v5.5 to v5.11), vs
> the default of v5.4 kernel in dunfell vanilla.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  .../recipes-kernel/cryptodev/cryptodev-linux_%.bbappend      | 5 +++++
>  .../recipes-kernel/cryptodev/cryptodev-module_%.bbappend     | 5 +++++
>  .../recipes-kernel/cryptodev/cryptodev-tests_%.bbappend      | 5 +++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
>  create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
> new file mode 100644
> index 000000000000..a4ae187d4082
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
> @@ -0,0 +1,5 @@
> +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> +# just pull 1.12 revision, everything else remains the same.
> +
> +PV = "1.12"
> +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> index f8a35cd73765..a1e1c91978c4 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> @@ -1,3 +1,8 @@
> +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> +# just pull 1.12 revision, everything else remains the same.
> +
> +PV = "1.12"
>  PR_append = ".arago0"
> +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
>  
>  KERNEL_MODULE_AUTOLOAD += "cryptodev"
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> new file mode 100644
> index 000000000000..a4ae187d4082
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> @@ -0,0 +1,5 @@
> +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> +# just pull 1.12 revision, everything else remains the same.
> +
> +PV = "1.12"
> +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> -- 
> 2.25.1.377.g2d2118b814c1
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


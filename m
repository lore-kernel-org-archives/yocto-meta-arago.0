Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2F8FC52A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:17:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKHi8t017426
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:17:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKHigd010879
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:17:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 15:17:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKHiMM027648	for
	<meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:17:44 -0500
Date: Fri, 23 Aug 2013 16:17:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130823201743.GC27308@edge>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1377289002-20230-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/4] arago-prefs: set default preferences for am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:17:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 23, 2013 at 04:16:39PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index b125957..49268c4 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -9,6 +9,7 @@ PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
>  PREFERRED_VERSION_qt4-embedded = "4.8.4"
>  PREFERRED_VERSION_qt4-native = "4.8.4"
>  PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.4"
> +PREFERRED_VERSION_linux-libc-headers = "3.8"
>  
>  # Use v4.09.00.01 of the Graphics SDK
>  PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
> @@ -23,6 +24,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
>  
> +PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.8"
> +PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.09+2013.10-rc1"

Yeah, this version would need to change for v2 in meta-ti...


>  PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
>  PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
>  PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
> -- 
> 1.8.3.2
> 


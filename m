Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 20CD752979
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 17:48:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t89HmGvV017814;
	Wed, 9 Sep 2015 12:48:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89HmG6a023292;
	Wed, 9 Sep 2015 12:48:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Sep 2015 12:48:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89HmFMQ012506;
	Wed, 9 Sep 2015 12:48:16 -0500
Date: Wed, 9 Sep 2015 13:48:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20150909174800.GE18085@edge>
References: <1441819032-23875-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1441819032-23875-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] external-linaro-toolchain: adjust -cross dependency to avoid possible race
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
X-List-Received-Date: Wed, 09 Sep 2015 17:48:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ignore this, I have a better fix.

On Wed, Sep 09, 2015 at 01:17:12PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Many toolchain components like gcc share common work directory with sources
> and rely on those sources being prepped by a corresponding -cross part.
> Since we use a prebuilt cross toolchain, we have to fake some prep steps for
> target toolchain components to build successfully (install unwind.h, etc.).
> Need to make sure those prep steps get executed before target gcc requires
> them.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/meta/external-linaro-toolchain.bbappend              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> index f382897..71ef91e 100644
> --- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> @@ -4,7 +4,7 @@ ALLOW_EMPTY_ldd = "1"
>  ALLOW_EMPTY_libstdc++ = "1"
>  ALLOW_EMPTY_libgomp = "1"
>  
> -PR_append = "-arago21"
> +PR_append = "-arago22"
>  
>  PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
>  PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
> @@ -18,7 +18,7 @@ PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'exter
>  
>  DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
>  
> -do_build[depends] += "external-linaro-toolchain-cross:do_populate_sysroot"
> +do_populate_sysroot[depends] += "external-linaro-toolchain-cross:do_populate_sysroot"
>  
>  RDEPENDS_${PN}-utils = ""
>  
> -- 
> 2.2.0
> 


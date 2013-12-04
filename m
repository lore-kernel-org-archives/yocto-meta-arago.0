Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 39026529BF
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 05:54:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB45sZFo002450
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2013 23:54:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB45sZfe011444
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2013 23:54:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Dec 2013 23:54:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB45sZ0t005447;
	Tue, 3 Dec 2013 23:54:35 -0600
Date: Wed, 4 Dec 2013 00:54:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204055434.GO690@edge>
References: <1385638728-12135-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385638728-12135-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 13/14] crda: Update recipe to 1.1.3 version.
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
X-List-Received-Date: Wed, 04 Dec 2013 05:54:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Since crda-1.1.3 (but newer regulatory db) is in meta-openembedded, can you 
please verify it works with your components and remove crda from meta-arago.

-- 
Denys


On Thu, Nov 28, 2013 at 01:38:48PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Added missing libnl3 flag.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  .../crda/{crda_1.1.1.bb => crda_1.1.3.bb}          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  copy meta-arago-extras/recipes-connectivity/crda/{crda_1.1.1.bb => crda_1.1.3.bb} (97%)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 5c20a0f..e9dc865 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -85,7 +85,7 @@ PREFERRED_VERSION_readline-native = "5.2"
>  PREFERRED_VERSION_readline-nativesdk = "5.2"
>  
>  PREFERRED_VERSION_libnl = "3.2.21"
> -PREFERRED_VERSION_crda = "1.1.1"
> +PREFERRED_VERSION_crda = "1.1.3"
>  PREFERRED_VERSION_obex = "0.34"
>  PREFERRED_VERSION_bluez4 = "4.101"
>  PREFERRED_VERSION_bluez-hcidump = "2.2"
> diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> similarity index 97%
> copy from meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> copy to meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> index e3880a1..9c1e0c2 100644
> --- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> +++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> @@ -13,7 +13,7 @@ SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
>             http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
>  "
>  
> -CFLAGS += " -DCONFIG_LIBNL20"
> +CFLAGS += " -DCONFIG_LIBNL32"
>  
>  EXTRA_OEMAKE = "MAKEFLAGS="
>  do_compile() {
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


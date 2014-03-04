Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 33D7F5208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 19:13:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24JDo67023806
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:13:50 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24JDoUQ008374
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:13:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 13:13:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24JDnhx005372;
	Tue, 4 Mar 2014 13:13:50 -0600
Date: Tue, 4 Mar 2014 14:13:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140304191348.GM22125@edge>
References: <1393959849-32619-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393959849-32619-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dylan|ti2013.12.x][PATCH] Revert "arago-prefs: set PREFERRED VERSION of libdrm to latest"
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
X-List-Received-Date: Tue, 04 Mar 2014 19:13:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you seen this:
http://arago-project.org/pipermail/meta-arago/2014-February/003143.html


On Tue, Mar 04, 2014 at 01:04:09PM -0600, Franklin S. Cooper Jr wrote:
> This reverts commit 8303758bc661f660a39b75e0ff7aa2a0ca6fea56.
> 
> libdrm v2.4.46 doesn't exist for the dylan (ti2013.12.x) maintenance branch
> ---
>  .../conf/distro/include/arago-prefs.inc            |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 5f7b023..d5176fd 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -4,9 +4,6 @@ include conf/distro/include/qt5-versions.inc
>  # Use the latest version of ltp-ddt for kernel versions 3.8+
>  PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>  
> -# Use the latest version of libdrm
> -PREFERRED_VERSION_libdrm = "2.4.46"
> -
>  PREFERRED_PROVIDER_virtual/gettext = "gettext"
>  
>  ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


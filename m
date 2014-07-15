Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 51062529BC
	for <meta-arago@arago-project.org>;
	Tue, 15 Jul 2014 17:28:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FHSOeW019208
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 12:28:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FHSOPc016826
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 12:28:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 12:28:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FHSM5x002914;
	Tue, 15 Jul 2014 12:28:23 -0500
Date: Tue, 15 Jul 2014 13:28:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140715172820.GF15788@edge>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-4-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1405423715-21885-4-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/4] arago: unset ASSUME_PROVIDED for git-native
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
X-List-Received-Date: Tue, 15 Jul 2014 17:28:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 15, 2014 at 06:28:34AM -0500, Chase Maupin wrote:
> * To get maximum size reduction use the later version of git
>   that is provided by git-native.  This reduces the kernel sources
>   size from 1002MB to 762MB.
> * Older versions of git work but they provide a depth of 1 for
>   all branches and tags instead of just for the branch requested.
> * This was tested with git version 1.7.9.5 and 1.9 as comparison
>   points.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index b9af13f..1470f22 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -50,6 +50,11 @@ require conf/distro/include/arago-prefs.inc
>  # Hack out sgx flag for now, as breaking on kernels >= 3.14
>  MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
>  
> +# Remove the ASSUME_PROVIDED setting for git-native so that we can
> +# use the latest version for the sourceipk which leads to a smaller
> +# git history.
> +ASSUME_PROVIDED := "${@filter_out('git-native','${ASSUME_PROVIDED}',d)}"

This now should work:

ASSUME_PROVIDED -= "git-native"


>  # Allow branding on top of Arago Distro and Core TI-SDK
>  # If ARAGO_BRAND is not set in local.conf, default to core
>  ARAGO_BRAND ??= "core"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 67F1952972
	for <meta-arago@arago-project.org>;
	Mon, 14 Apr 2014 16:36:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3EGaJ73015248
	for <meta-arago@arago-project.org>; Mon, 14 Apr 2014 11:36:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EGaJYb011125
	for <meta-arago@arago-project.org>; Mon, 14 Apr 2014 11:36:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Apr 2014 11:36:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EGaJNc019468	for
	<meta-arago@arago-project.org>; Mon, 14 Apr 2014 11:36:19 -0500
Date: Mon, 14 Apr 2014 12:36:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140414163618.GD12929@edge>
References: <1397247019-15012-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1397247019-15012-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
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
X-List-Received-Date: Mon, 14 Apr 2014 16:36:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any comments?

On Fri, Apr 11, 2014 at 04:10:19PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> From Dora and up, images are deployed into corresponding machine subdirs.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
> index 8df9a5b..cff86e4 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -125,6 +125,12 @@ extract_sdk_image() {
>          return 1
>      fi
>  
> +    # prefer sdk_path/m, if exists - Dora and up
> +    if [ -d $sdk_path/$m ]
> +    then
> +        sdk_path="$sdk_path/$m"
> +    fi
> +
>  ################################################################################
>  # SDK_FILTER variable is used to specify the SDK image produced by the build,
>  # that includes bootloaders, kernel, rootfs, devkit and host tools.
> -- 
> 1.7.9.5
> 


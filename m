Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BE179529F2
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 19:20:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IJKmmn024826
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:20:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJKm9s010251
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:20:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 14:20:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJKl4B004296	for
	<meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:20:47 -0500
Date: Fri, 18 Jul 2014 15:20:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140718192047.GQ15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-11-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1405709522-404-11-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 11/11] arago.conf: use the new _remove override to filter out sgx feature
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
X-List-Received-Date: Fri, 18 Jul 2014 19:20:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 18, 2014 at 02:52:02PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

I'll have to send v2 that preserves filter_out as it's used by 
Chase's ASSUME_PROVIDED.


> ---
>  meta-arago-distro/conf/distro/arago.conf              | 2 +-
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ----
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 2686264..3ac30ce 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -49,7 +49,7 @@ TARGET_CPPFLAGS += "-fstack-protector"
>  require conf/distro/include/arago-prefs.inc
>  
>  # Hack out sgx flag for now, as breaking on kernels >= 3.14
> -MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
> +MACHINE_FEATURES_remove = "sgx"
>  
>  # Allow branding on top of Arago Distro and Core TI-SDK
>  # If ARAGO_BRAND is not set in local.conf, default to core
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 8261d10..650a71d 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -103,7 +103,3 @@ PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gs
>  PREFERRED_PROVIDER_gst-plugins-bad = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel', 'gst-plugins-bad', d)}"
>  PREFERRED_PROVIDER_gst-plugins-base = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel', 'gst-plugins-base', d)}"
>  PREFERRED_PROVIDER_gst-plugins-good = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel', 'gst-plugins-good', d)}"
> -
> -def filter_out(f, str, d):
> -    from re import match
> -    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
> -- 
> 2.0.0
> 


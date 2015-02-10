Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3DC2B5297F
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:16:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGG6Gm002925
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:16:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGG3vx030594
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:16:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 10:16:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGG4JO015751;
	Tue, 10 Feb 2015 10:16:04 -0600
Date: Tue, 10 Feb 2015 11:16:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150210161603.GD13231@edge>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Make psplash conditional with splash feature
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
X-List-Received-Date: Tue, 10 Feb 2015 16:16:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 10, 2015 at 11:01:15AM -0500, Sam Nelson wrote:
> - This is meant to avoid error message with headless distribution
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 7652622..7b71aa4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
> -PR = "r15"
> +PR = "r16"
>  
>  inherit packagegroup
>  
> @@ -12,7 +12,7 @@ RDEPENDS_${PN} = "\
>      libpcre \
>      iptables \
>      iperf \
> -    psplash \
> +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash', '',d)} \

There's no "splash" in DISTRO_FEATURES. There is one in IMAGE_FEATURES though, 
which we don't use, but probably should.


>      arago-gpl-notice \
>      arago-feed-config \
>      nfs-utils-client \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4D224529E1
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:29:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJTj4I004583
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:29:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJTjsL026036
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:29:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:29:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJTjee027818;
	Mon, 19 May 2014 14:29:45 -0500
Date: Mon, 19 May 2014 15:29:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140519192944.GE21819@edge>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 13/19] packagegroup-arago-base-tiskd: Add base nfs-utils
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
X-List-Received-Date: Mon, 19 May 2014 19:29:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin wrote:
> * Add the base nfs-utils package along with the nfs-utils-client
>   package.

I asked it before, but don't remember seeing the answer - what's the purpose? 
Is there a use case for NFS server?


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 16b5df1..2db98b8 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
> -PR = "r13"
> +PR = "r14"
>  
>  inherit packagegroup
>  
> @@ -16,5 +16,6 @@ RDEPENDS_${PN} = "\
>      iperf \
>      psplash \
>      arago-gpl-notice \
> +    nfs-utils \
>      nfs-utils-client \
>      "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


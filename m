Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2FC32529DD
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 18:47:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UIl6V6002935
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:47:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIl4OV002946
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:47:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 12:47:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIl4NP031912;
	Fri, 30 Jan 2015 12:47:04 -0600
Date: Fri, 30 Jan 2015 13:47:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150130184703.GJ21328@edge>
References: <1422585948-19345-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422585948-19345-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 1/2] strongswan: Add append recipe for strongswan v5.1.1 to remove GPLV3 dependency
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
X-List-Received-Date: Fri, 30 Jan 2015 18:47:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Jan 29, 2015 at 09:45:47PM -0500, Sam Nelson wrote:
> - Remove GMP dependency which has GPLV3 content
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous version
> - Used _remove to remove gmp dependancy and flags
> ---
> ---
>  .../strongswan/strongswan_5.1.1.bbappend           |    7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> 
> diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> new file mode 100644
> index 0000000..9dbc509
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> @@ -0,0 +1,7 @@
> +PR_append = "-arago0"
> +
> +DEPENDS_remove = "gmp"
> +
> +EXTRA_OECONF_remove = "--enable-gmp"
> +
> +EXTRA_OECONF += "--disable-gmp"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


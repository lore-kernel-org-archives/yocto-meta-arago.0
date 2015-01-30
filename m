Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 84CD052A23
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 01:55:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U1t7oZ029163
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:55:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1t66P007181
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:55:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 19:55:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1t6Ab005914;
	Thu, 29 Jan 2015 19:55:06 -0600
Date: Thu, 29 Jan 2015 20:55:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150130015505.GE21328@edge>
References: <1422558045-17124-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422558045-17124-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] strongswan: Add append recipe for strongswan v5.1.1 to remove GPLV3 dependency
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
X-List-Received-Date: Fri, 30 Jan 2015 01:55:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 29, 2015 at 02:00:44PM -0500, Sam Nelson wrote:
> - Remove GMP dependency which has GPLV3 content
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../strongswan/strongswan_5.1.1.bbappend           |    8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> 
> diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> new file mode 100644
> index 0000000..ca19b68
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
> @@ -0,0 +1,8 @@
> +PR_append = "-arago0"
> +
> +DEPENDS = "openssl flex-native flex bison-native"

Based on your description above, you want to remove gmp from the original 
DEPENDS list. You can do it like this:

DEPENDS_remove = "gmp"

Same with EXTRA_OECONF below.


> +EXTRA_OECONF = "--disable-gmp \
> +        --enable-openssl \
> +        --without-lib-prefix \
> +"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


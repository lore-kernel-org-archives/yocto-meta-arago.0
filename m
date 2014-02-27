Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DC69952A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2014 18:28:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1RISLFF013327
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 12:28:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1RISLeB030337
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 12:28:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 27 Feb 2014 12:28:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1RISKSN017538;
	Thu, 27 Feb 2014 12:28:20 -0600
Date: Thu, 27 Feb 2014 13:28:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140227182819.GE22125@edge>
References: <1393525144-18094-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393525144-18094-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] iproute2: Add 3.11 version recipe for iproute2
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
X-List-Received-Date: Thu, 27 Feb 2014 18:28:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

dylan has 3.8
dora has 3.10
master has 3.12

I understand you need to bump it for dylan - will 3.10 work? We can overlay it 
from dora temporarily in our dylan branch of meta-arago and you'd 
automatically get it from oe-core when you eventually upgrade to dora.

Also, I'd suggest taking recipes as is from oe-core newer branches - there's 
at least 1 patch to make configure cross-safe...

-- 
Denys


On Thu, Feb 27, 2014 at 01:19:04PM -0500, Sam Nelson wrote:
> - Patches used earler for 3.8 removed
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../iproute2/iproute2_3.11.0.bb                    |    8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb b/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb
> new file mode 100644
> index 0000000..406d216
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/iproute2/iproute2_3.11.0.bb
> @@ -0,0 +1,8 @@
> +require recipes-connectivity/iproute2/iproute2.inc
> +
> +PR = "r0"
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "d7ffb27bc9f0d80577b1f3fb9d1a7689"
> +SRC_URI[sha256sum] = "0ab31b52b5fd5ff0d3cf03f2068f05eeb4f0b37d107070fbbaacac94df5e88b7"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


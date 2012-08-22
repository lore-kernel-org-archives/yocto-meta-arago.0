Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 87C6452A00
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 18:14:24 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MIENwe026103
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 13:14:23 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MIEN9C026032
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 13:14:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 13:14:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MIENVp002909;
	Wed, 22 Aug 2012 13:14:23 -0500
Date: Wed, 22 Aug 2012 14:14:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20120822181421.GG21025@edge>
References: <1344889987-31288-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C2A8788@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2A8788@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] psplash: Update to latest version of psplash. Tweak LIC_FILES_CHKSUM variable
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
X-List-Received-Date: Wed, 22 Aug 2012 18:14:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 06:06:43PM +0000, Cooper Jr., Franklin wrote:
> Ignore this patch. A new patch will be sent out that addresses the concern 
> of patch [meta-arago] [PATCH] meta-arago-upstream: Create new upstream layer

Right, are you going to use a separate "next" branch or just drop it in 
"master" for now, as we discussed?

-- 
Denys


> -----Original Message-----
> From: Cooper Jr., Franklin 
> Sent: Monday, August 13, 2012 3:33 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago][PATCH] psplash: Update to latest version of psplash. Tweak LIC_FILES_CHKSUM variable
> 
> * Add the change to the variable LIC_FILES_CHKSUM to insure that only
>   the lines that contains license information are used for the checksum
> * Update to the latest version of psplash.
> * The above changes are already found in the psplash recipe located in oe-core
>   master
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/psplash/psplash_git.bbappend      |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
> 
> diff --git a/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
> new file mode 100644
> index 0000000..0ddbd6a
> --- /dev/null
> +++ b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
> @@ -0,0 +1,4 @@
> +LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
> +
> +SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
> +PRINC := "${@int(PRINC) + 1}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


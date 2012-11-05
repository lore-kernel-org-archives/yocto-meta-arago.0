Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6317A529A9
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 18:22:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA5IMWvN010729;
	Mon, 5 Nov 2012 12:22:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA5IMWq8018662;
	Mon, 5 Nov 2012 12:22:32 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 5 Nov 2012 12:22:32 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA5IMWbN019586;
	Mon, 5 Nov 2012 12:22:32 -0600
Date: Mon, 5 Nov 2012 13:22:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121105182231.GF8311@edge>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 03/42] libjpeg-turbo: Mimic RPROVIDES fix from meta-oe master
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
X-List-Received-Date: Mon, 05 Nov 2012 18:22:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I think some patches are missing. I counted only 40 out of 42 - #1 and #2 seem 
to be missing...


On Sun, Nov 04, 2012 at 07:52:58PM -0600, Franklin S. Cooper Jr wrote:
> * Add the changes incorporated by the patch
>   "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
>   currently applied to meta-oe master.
> * When the above patch is applied to the denzil branch then this commit
>   can be reverted.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
> 
> diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
> new file mode 100644
> index 0000000..08c085d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
> @@ -0,0 +1,9 @@
> +PRINC := "${@int(PRINC) + 1}"
> +
> +# Temporarily add this append which incorporates the changes of meta-oe master 
> +# patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
> +# commit id 662fd013adcbee8c59f4f475a11911c3267eae90.
> +
> +RPROVIDES_${PN}  += "jpeg"
> +RREPLACES_${PN}  += "jpeg"
> +RCONFLICTS_${PN} += "jpeg"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


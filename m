Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0FBBD5296F
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2013 21:34:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NLYshA013320
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 16:34:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NLYs5B013210
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 16:34:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 16:34:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NLYsNt018482;
	Mon, 23 Sep 2013 16:34:54 -0500
Date: Mon, 23 Sep 2013 17:34:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130923213453.GI3456@edge>
References: <1379972911-15320-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1379972911-15320-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] sourceipk.bbclass: Remove broken symbolic links
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
X-List-Received-Date: Mon, 23 Sep 2013 21:34:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Mon, Sep 23, 2013 at 04:48:31PM -0500, Franklin S. Cooper Jr wrote:
> * Latest kernel sources included symbolic links that were broken and caused the
>   tar command to fail.
> * Find and remove broken symlinks to avoid this issue.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
> index 1ea0577..3b86b99 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -166,6 +166,9 @@ sourceipk_do_create_srcipk() {
>              cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
>          fi
>  
> +        # Remove any broken symlinks that causes tar to fail when encountered
> +        find -L $tmp_dir/${SRCIPK_INSTALL_DIR} -type l  -exec rm {} \;
> +
>          #Write the data tarball
>          tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 304A7529AF
	for <meta-arago@arago-project.org>;
	Mon,  2 Feb 2015 21:04:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12L4Tc9010455
	for <meta-arago@arago-project.org>; Mon, 2 Feb 2015 15:04:29 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12L4SDC019724
	for <meta-arago@arago-project.org>; Mon, 2 Feb 2015 15:04:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Feb 2015 15:04:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12L4R9N020944;
	Mon, 2 Feb 2015 15:04:27 -0600
Date: Mon, 2 Feb 2015 16:04:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150202210427.GB6257@edge>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
	<1422657099-15544-4-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422657099-15544-4-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/6] sourceipk: Fix issue with git fetch when shallow clone is used
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
X-List-Received-Date: Mon, 02 Feb 2015 21:04:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 30, 2015 at 04:31:37PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * When shallow clone is used for some reason running git fetch on the repository
>   didn't end up making it completely whole (fetch all commits).
> * Even worse the copied repository didn't have a proper way to reference or
>   fetch remote branches or tags.
> * For some reason deleting the origin and seeing it back to the correct value
>   fixed these problems.

That all sounds like some kind of voodoo... :) What version of git were you 
using?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
> index 6b16657..6895378 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -157,7 +157,11 @@ adjust_git() {
>  
>              cd -
>  
> -            git remote set-url origin $remote_repo $local_repo
> +            # Some crazy reason I need to add these two lines when doing a
> +            # shallow copy. Otherwise, I had problems where git fetch wasn't
> +            # properly fetching all the commits and extra remotes.
> +            git remote rm origin
> +            git remote add origin $remote_repo
>  
>              # Repackage the repository so its a proper clone of the original
>              # (remote) git repository
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 84F9B52A35
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 14:02:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EE29ZW021523
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:02:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EE28sl001297
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:02:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 09:02:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EE28aA027938;
	Thu, 14 Aug 2014 09:02:08 -0500
Date: Thu, 14 Aug 2014 10:02:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20140814140207.GV23523@edge>
References: <1408024773-17838-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1408024773-17838-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] qtwayland - update to 5.4 branch
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
X-List-Received-Date: Thu, 14 Aug 2014 14:02:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Aug 14, 2014 at 09:59:32AM -0400, Jacob Stiffler wrote:
> * The 5.3 branch no longer exists and the SRCREV points to a commit on the 5.4 branch.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-qt/qt5/qtwayland-native_git.bbappend   |    4 ++--
>  .../recipes-qt/qt5/qtwayland_git.bbappend          |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> index 53c1454..64de589 100644
> --- a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = "-arago1"
>  
> -QT_MODULE_BRANCH = "5.3"
> +QT_MODULE_BRANCH = "5.4"
> diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> index 53c1454..64de589 100644
> --- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago0"
> +PR_append = "-arago1"
>  
> -QT_MODULE_BRANCH = "5.3"
> +QT_MODULE_BRANCH = "5.4"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id F003652986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 15:47:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8R00ET855ZWDH0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Aug 2012 10:46:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7F62C201AC; Tue,
	14 Aug 2012 11:46:47 -0400 (EDT)
Date: Tue, 14 Aug 2012 11:46:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120814154647.GA1094@denix.org>
References: <1344873428-7710-1-git-send-email-fcooper@ti.com>
	<1344873428-7710-2-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1344873428-7710-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
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
X-List-Received-Date: Tue, 14 Aug 2012 15:47:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Franklin,

Just a nit-pick for the future - to not break bisectability, you should 
normally do this in 2 commits:

1. add oprofile-example recipe AND switch the RDEPENDS
2. remove the old reference from am-sysinfo

Denys


On Mon, Aug 13, 2012 at 10:57:07AM -0500, Franklin S Cooper Jr wrote:
> * Replace the RDEPENDS from am-sysinfo to oprofile-example.
>   The application oprofile-example use to be located within
>   am-sysinfo but now is located in its own repository.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../matrix/matrix-gui-oprofile-demos_2.0.bb        |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> index e8aad0b..d3246f9 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
>  
>  require matrix-gui-apps-git.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  inherit allarch
>  
> @@ -13,6 +13,6 @@ S = "${WORKDIR}/git/oprofile_apps"
>  # Make sure profiling submenu and app images  has been installed
>  # Include am-sysinfo because that package has the sample
>  # executables for profiling.
> -RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile am-sysinfo"
> +RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile oprofile-example"
>  
>  FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 


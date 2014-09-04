Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7E12652992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:44:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84Hi96q020681
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:44:09 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Hi9td027157
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:44:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:44:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Hi9oh030397;
	Thu, 4 Sep 2014 12:44:09 -0500
Date: Thu, 4 Sep 2014 13:44:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140904174408.GM18620@edge>
References: <1409852140-13616-1-git-send-email-fcooper@ti.com>
	<1409852140-13616-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409852140-13616-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] libinput: Fix touch calibration issue
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
X-List-Received-Date: Thu, 04 Sep 2014 17:44:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 12:35:40PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Libinput and Weston have a calibration problem when using resistive touch
>   screens.
> * Bug report and additional information can be found here:
>     https://bugs.freedesktop.org/show_bug.cgi?id=82742
> * Update to latest commit of libinput that includes the 9 patches that fixes
>   this issue.

9 patches? Wow, that was rather broken :)


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-graphics/wayland/libinput_git.bb       |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> index d591f7d..967d5db 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> @@ -8,10 +8,10 @@ inherit autotools pkgconfig
>  
>  DEPENDS = "libevdev udev"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  BRANCH = "master"
> -SRCREV = "bb10ec84d3704fc0fb40591bcbffe90f6c77966d"
> +SRCREV = "0647574c46e5e930063ace7b35385213dca33dc1"
>  
>  PV = "0.5.0"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


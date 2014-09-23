Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D0317529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:57:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFvC06005521
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:57:12 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFvBMe003285
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:57:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:57:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFvBO8000991;
	Tue, 23 Sep 2014 10:57:11 -0500
Date: Tue, 23 Sep 2014 11:57:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923155711.GL6303@edge>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
	<1411487426-31949-5-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411487426-31949-5-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master 4/5] example-applications: Adding repository of GLSDK example applications
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
X-List-Received-Date: Tue, 23 Sep 2014 15:57:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Are those specific to GLSDK or OMAP5/DRA7 platforms? If so, should we name the 
recipe differently? The git repo has more specific hierarchy - 
glsdk/example-applications, should the recipe be more specific too?

-- 
Denys


On Tue, Sep 23, 2014 at 09:20:25PM +0530, Karthik Ramanan wrote:
> This repository contains the following tests
>  * drm-tests
>  * gst-test-player used for trickplay
>  * messageq based application for profiling IPC performance
>  * thermal tests
>  * vpe related test cases
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../example-applications/example-applications.bb   |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/example-applications/example-applications.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/example-applications/example-applications.bb b/meta-arago-extras/recipes-graphics/example-applications/example-applications.bb
> new file mode 100644
> index 0000000..fa5c3ab
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/example-applications/example-applications.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "GLSDK example applications"
> +HOMEPAGE = "http://git.ti.com"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
> +
> +DEPENDS = "gstreamer libdrm ti-ipc"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
> +SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
> +
> +S = "${WORKDIR}/git"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


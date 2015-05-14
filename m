Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EEFBF52093
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 16:46:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EGkP21022820
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 11:46:25 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EGkP7d025458
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 11:46:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 11:46:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EGkPdu019901;
	Thu, 14 May 2015 11:46:25 -0500
Date: Thu, 14 May 2015 12:46:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150514164624.GC27821@edge>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/9] Switch remaining recipes from gitorious.org to git.ti.com
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
X-List-Received-Date: Thu, 14 May 2015 16:46:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, I have pretty much the same changes here locally, but I was holding on 
to pushing more changes until I get all the nightlies going on and stop 
failing in multimachine build. Still some issues, as last one has failed 
again...


On Thu, May 14, 2015 at 10:28:16AM -0400, Jacob Stiffler wrote:
> 
> Jacob Stiffler (9):
>   arm-benchmarks: Move SRC_URI to git.ti.com.
>   am-sysinfo: Move SRC_URI to git.ti.com.
>   matrix-gui-browser: Move SRC_URI to git.ti.com.
>   matrix-gui: Move SRC_URI to git.ti.com.
>   refresh-screen: Move SRC_URI to git.ti.com.
>   oprofile-example: Move SRC_URI to git.ti.com.
>   screenshot: Move SRC_URI to git.ti.com.
>   av-examples: Move SRC_URI to git.ti.com.
>   image-gallery: Move SRC_URI to git.ti.com.
> 
>  .../arm-benchmarks/arm-benchmarks_1.3.bb           |    2 +-
>  .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    2 +-
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    2 +-
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |    2 +-
>  .../oprofile-example/oprofile-example_git.bb       |    2 +-
>  .../recipes-graphics/screenshot/screenshot_1.0.bb  |    2 +-
>  .../av-examples/av-examples_1.0.bb                 |    2 +-
>  .../recipes-qt/qt-apps/image-gallery_git.bb        |    2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


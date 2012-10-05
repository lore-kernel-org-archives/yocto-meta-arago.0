Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 1893452A99
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 17:19:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00MCAK4BSQ42@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 12:19:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B91172038D; Fri,
	05 Oct 2012 13:19:23 -0400 (EDT)
Date: Fri, 05 Oct 2012 13:19:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005171923.GH23366@denix.org>
References: <1349419959-21857-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349419959-21857-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] task-arago-gst: Add gst-plugins-ugly
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
X-List-Received-Date: Fri, 05 Oct 2012 17:19:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 01:52:39AM -0500, Franklin S. Cooper Jr wrote:
> * Gst-plugins-ugly and several dependencies have a commercial license.
> * Add back gst-plugins-ugly and whitelist these needed recipes.

This one looks good, but being held by the comments I sent for task-arago-gst*

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf           |    9 +++++++++
>  .../tasks/task-arago-gst-sdk-target.bb             |    3 ++-
>  .../recipes-core/tasks/task-arago-gst.bb           |    2 ++
>  3 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 381118d..002f000 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -27,3 +27,12 @@ POLKITAUTH = ""
>  
>  # Enable generation of source packages for SDKs
>  require arago-source-ipk.conf
> +
> +# Whitelist several recipes that have commercial licenses
> +# Need to verify with legal that the following recipes are ok to distribute
> +# with the SDK
> +LICENSE_FLAGS_WHITELIST = "\
> +    commercial_gst-plugins-ugly \
> +    commercial_mpeg2dec \
> +    commercial_lame \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> index 655cd20..d2ccba3 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Task to build and install header and libs in sdk"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit task
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -11,4 +11,5 @@ RDEPENDS_${PN} = "\
>      gst-plugins-base-dev \
>      gst-plugins-good-dev \
>      gst-plugins-bad-dev \
> +    gst-plugins-ugly-dev \
>  "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index da9e41c..fc0962a 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -11,9 +11,11 @@ GSTREAMER = " \
>      gst-plugins-base \
>      gst-plugins-good \
>      gst-plugins-bad \
> +    gst-plugins-ugly \
>      gst-plugins-base-meta \
>      gst-plugins-good-meta \
>      gst-plugins-bad-meta \
> +    gst-plugins-ugly-meta \
>      "
>  
>  RDEPENDS_${PN} = "\
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 


Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id D70665296D
	for <meta-arago@arago-project.org>;
	Tue,  9 Oct 2012 19:16:56 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBN00A4547H8R40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Oct 2012 14:16:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2783320226; Tue,
	09 Oct 2012 15:16:29 -0400 (EDT)
Date: Tue, 09 Oct 2012 15:16:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121009191629.GB12654@denix.org>
References: <1349541644-31551-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349541644-31551-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] task-arago-gst-sdk-target: Add task to install gstreamer related dev packages
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
X-List-Received-Date: Tue, 09 Oct 2012 19:16:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Oct 06, 2012 at 11:40:44AM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
> 
> * This task is used to install gstreamer and gstreamer plugins dev packages
> * Remove COMPATIBLE_MACHINE restriction
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 3 changes:
> Removed unneeded PACKAGE_ARCH = "${MACHINE_ARCH}"

Not critical for now, but in the future, changes like this should rather be 
mentioned in the main description. I.e. you removed COMPATIBLE_MACHINE and 
listed it in the summary. As one of the re-spins of the change, you ended up 
also removing PACKAGE_ARCH from the recip. So, it's not just the difference 
between v3 and v2, but also should be listed in the new summary of the patch.

-- 
Denys


> 
>  .../tasks/task-arago-gst-sdk-target.bb             |   13 +++++++++++++
>  .../recipes-core/tasks/task-arago-gst.bb           |    4 +---
>  2 files changed, 14 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> new file mode 100644
> index 0000000..2a9fb27
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Task to build and install header and libs in sdk"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +
> +RDEPENDS_${PN} = "\
> +    gstreamer-dev \
> +    gst-plugins-base-dev \
> +    gst-plugins-good-dev \
> +    gst-plugins-bad-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index d34402a..8c67881 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -1,11 +1,9 @@
>  DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit task
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  GSTREAMER = " \
>      gstreamer \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

